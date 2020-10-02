#include <cassert>
#include <cstring>
#include <fstream>
#include <iostream>
#include <level_zero/ze_api.h>
#include <limits>
#include <sstream>
#include <vector>

#define L0_SAFE_CALL(call)                                                     \
  {                                                                            \
    auto status = (call);                                                      \
    if (status != 0) {                                                         \
      fprintf(stderr, "%s:%d: L0 error %x\n", __FILE__, __LINE__,              \
              (int)status);                                                    \
      exit(1);                                                                 \
    }                                                                          \
  }

bool verbose = true;

static void L0InitContext(ze_driver_handle_t &hDriver,
                          ze_device_handle_t &hDevice,
                          ze_module_handle_t &hModule,
                          ze_command_queue_handle_t &hCommandQueue,
                          ze_context_handle_t &hContext) {
  ze_init_flag_t init_flag;
  L0_SAFE_CALL(zeInit(0));

  // Discover all the driver instances
  uint32_t driverCount = 0;
  L0_SAFE_CALL(zeDriverGet(&driverCount, nullptr));

  ze_driver_handle_t *allDrivers =
      (ze_driver_handle_t *)malloc(driverCount * sizeof(ze_driver_handle_t));
  L0_SAFE_CALL(zeDriverGet(&driverCount, allDrivers));

  // Find a driver instance with a GPU device
  for (uint32_t i = 0; i < driverCount; ++i) {
    uint32_t deviceCount = 0;
    hDriver = allDrivers[i];
    L0_SAFE_CALL(zeDeviceGet(hDriver, &deviceCount, nullptr));
    ze_device_handle_t *allDevices =
        (ze_device_handle_t *)malloc(deviceCount * sizeof(ze_device_handle_t));
    L0_SAFE_CALL(zeDeviceGet(hDriver, &deviceCount, allDevices));
    for (uint32_t dLiterals = 0; dLiterals < deviceCount; ++dLiterals) {
      ze_device_properties_t device_properties;
      L0_SAFE_CALL(
          zeDeviceGetProperties(allDevices[dLiterals], &device_properties));
      if (ZE_DEVICE_TYPE_GPU == device_properties.type) {
        hDevice = allDevices[dLiterals];
        break;
      }
    }
    free(allDevices);
    if (nullptr != hDevice) {
      break;
    }
  }
  free(allDrivers);
  assert(hDriver);
  assert(hDevice);

  // Create context
  ze_context_desc_t ctxtDesc = {ZE_STRUCTURE_TYPE_CONTEXT_DESC, nullptr, 0};
  zeContextCreate(hDriver, &ctxtDesc, &hContext);
  // Create a command queue
  ze_command_queue_desc_t commandQueueDesc = {
      ZE_STRUCTURE_TYPE_COMMAND_QUEUE_DESC,
      nullptr,
      0, // computeQueueGroupOrdinal - hope 0 works..., no docs on what it is.
      0, // index
      0, // flags
      ZE_COMMAND_QUEUE_MODE_DEFAULT,
      ZE_COMMAND_QUEUE_PRIORITY_NORMAL};
  L0_SAFE_CALL(zeCommandQueueCreate(hContext, hDevice, &commandQueueDesc,
                                    &hCommandQueue));

  std::ifstream is;
  std::string fn = "test.spv";
  is.open(fn, std::ios::binary);
  if (!is.good()) {
    fprintf(stderr, "Open %s failed\n", fn.c_str());
    return;
  }

  is.seekg(0, std::ios::end);
  size_t codeSize = is.tellg();
  is.seekg(0, std::ios::beg);

  if (codeSize == 0) {
    return;
  }
  unsigned char *codeBin = new unsigned char[codeSize];
  if (!codeBin) {
    return;
  }

  is.read((char *)codeBin, codeSize);
  is.close();

  ze_module_desc_t moduleDesc;
  moduleDesc.stype = ZE_STRUCTURE_TYPE_MODULE_DESC;
  moduleDesc.pNext = nullptr;
  moduleDesc.pBuildFlags = "-vc-codegen";
  moduleDesc.format = ZE_MODULE_FORMAT_IL_SPIRV;
  moduleDesc.inputSize = codeSize;
  moduleDesc.pConstants = nullptr;
  moduleDesc.pInputModule = codeBin;
  L0_SAFE_CALL(
      zeModuleCreate(hContext, hDevice, &moduleDesc, &hModule, nullptr));
}

template <typename T, size_t N> struct AllignedArray { T data[N]; };

int main() {
  ze_device_handle_t hDevice = nullptr;
  ze_module_handle_t hModule = nullptr;
  ze_driver_handle_t hDriver = nullptr;
  ze_command_queue_handle_t hCommandQueue = nullptr;
  ze_context_handle_t hContext = nullptr;
  L0InitContext(hDriver, hDevice, hModule, hCommandQueue, hContext);

  ze_command_list_handle_t hCommandList;
  ze_kernel_handle_t hKernel;

  ze_command_list_desc_t commandListDesc;
  commandListDesc.stype = ZE_STRUCTURE_TYPE_COMMAND_LIST_DESC;
  commandListDesc.pNext = nullptr;
  commandListDesc.flags = 0;
  commandListDesc.commandQueueGroupOrdinal = 0; // ?

  L0_SAFE_CALL(
      zeCommandListCreate(hContext, hDevice, &commandListDesc, &hCommandList));
  ze_kernel_desc_t kernelDesc;
  kernelDesc.stype = ZE_STRUCTURE_TYPE_KERNEL_DESC;
  kernelDesc.pNext = nullptr;
  kernelDesc.flags = 0;
  kernelDesc.pKernelName = "multifrag_query_hoisted_literals";

  L0_SAFE_CALL(zeKernelCreate(hModule, &kernelDesc, &hKernel));

  constexpr int a_size = 32;
  AllignedArray<float, a_size> a, b, c;
  for (auto i = 0; i < a_size; ++i) {
    a.data[i] = i;
    b.data[i] = 1;
    c.data[i] = -1;
  }

  ze_device_mem_alloc_desc_t alloc_desc;
  alloc_desc.stype = ZE_STRUCTURE_TYPE_DEVICE_MEM_ALLOC_DESC;
  alloc_desc.pNext = nullptr;
  alloc_desc.flags = 0;
  alloc_desc.ordinal = 0; // ??

  /*
  Kernel params:
  using agg_query = void (*)(const int8_t***,  // col_buffers
                               const uint64_t*,  // num_fragments
                               const int8_t*,    // literals
                               const int64_t*,   // num_rows
                               const uint64_t*,  // frag_row_offsets
                               const int32_t*,   // max_matched
                               int32_t*,         // total_matched
                               const int64_t*,   // init_agg_value
                               int64_t**,        // out
                               int32_t*,         // error_code
                               const uint32_t*,  // num_tables
                               const int64_t*);  // join_hash_tables_pt
  */
  std::vector<int> data = {1, 2, 3, 4, 5, 6, 7, 8};
  std::vector<std::vector<const int8_t *>> col_buffers = {
      {reinterpret_cast<const int8_t *>(&data[0])}};
  std::vector<const int8_t **> multifrag_col_buffers;
  for (auto &col_buf : col_buffers) {
    multifrag_col_buffers.push_back(&col_buf[0]);
  }
  const uint64_t num_frags = 1;
  const int64_t num_rows = 8 /*20000000*/;
  std::vector<uint64_t> flatened_frag_offsets = {0};
  const int32_t matched = 0;
  int32_t total = 0;
  std::vector<int64_t> cmpt_val_buff = {0};
  // out
  int64_t *group_by_buffer;
  std::vector<int64_t *> group_by_buffers;
  uint32_t tables = 1;
  int32_t err_code;

  // pointer to multifrag_col_buffers
  const int8_t ***col_buffers_ptr =
      &multifrag_col_buffers[0];              // data.size() *sizeof(int)
  const uint64_t *num_fragments = &num_frags; // sizeof(uint64_t)
  const int8_t *literals = nullptr;           // sizeof(0)?
  const int64_t *num_rows_ptr = &num_rows;    // sizeof(uint64_t)
  const uint64_t *frag_row_offsets =
      &flatened_frag_offsets[0];         // sizeof(uint64_t) *
                                         // flatened_frag_offsets.size()
  const int32_t *max_matched = &matched; // sizeof(int32_t)
  int32_t *total_matched = &total;       // sizeof(int32_t)
  const int64_t *init_agg_value =
      &cmpt_val_buff[0]; // sizeof(uint64_t) * cmpt_val_buff.size()
  const auto out = reinterpret_cast<int64_t **>(
      group_by_buffers.data());                  // sizeof(int64_t) * 1?
  int32_t *error_code = &err_code;               // sizeof(int32_t)
  const uint32_t *num_tables = &tables;          // sizeof(int32_t)
  const int64_t *join_hash_tables_ptr = nullptr; // sizeof(0)?

  // const float copy_size = a_size*sizeof(float);
  // void *dA = nullptr;
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, copy_size, 0/*align*/,
  // hDevice, &dA));
  void *dCol_buffers = nullptr;
  void *dNum_fragments = nullptr;
  void *dLiterals = nullptr;
  void *dNum_row_ptr = nullptr;
  void *dFrag_row_offsets = nullptr;
  void *dMax_matched = nullptr;
  void *dTotal_matched = nullptr;
  void *dInit_agg_value = nullptr;
  void *dOut = nullptr;
  void *dError_code = nullptr;
  void *dNum_tables = nullptr;
  void *dJoin_hash_tables_ptr = nullptr;

  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc,
                                data.size() * sizeof(int), 0 /*align*/, hDevice,
                                &dCol_buffers));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(uint64_t),
                                0 /*align*/, hDevice, &dNum_fragments));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(int8_t *),
                                0 /*align*/, hDevice, &dLiterals));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(uint64_t),
                                0 /*align*/, hDevice, &dNum_row_ptr));
  L0_SAFE_CALL(
      zeMemAllocDevice(hContext, &alloc_desc,
                       sizeof(sizeof(uint64_t) * flatened_frag_offsets.size()),
                       0 /*align*/, hDevice, &dFrag_row_offsets));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, (sizeof(int32_t)),
                                0 /*align*/, hDevice, &dMax_matched));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, (sizeof(int32_t)),
                                0 /*align*/, hDevice, &dTotal_matched));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc,
                                sizeof(uint64_t) * cmpt_val_buff.size(),
                                0 /*align*/, hDevice, &dInit_agg_value));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(int64_t *),
                                0 /*align*/, hDevice, &dOut));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(int32_t),
                                0 /*align*/, hDevice, &dError_code));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(int32_t),
                                0 /*align*/, hDevice, &dNum_tables));
  L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(int64_t *),
                                0 /*align*/, hDevice, &dJoin_hash_tables_ptr));

  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dCol_buffers));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dNum_fragments));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dLiterals)); L0_SAFE_CALL(zeMemAllocDevice(hContext,
  // &alloc_desc, sizeof(void*), 0/*align*/, hDevice, &dNum_row_ptr));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dFrag_row_offsets));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dMax_matched));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dTotal_matched));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dInit_agg_value));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dOut)); L0_SAFE_CALL(zeMemAllocDevice(hContext,
  // &alloc_desc, sizeof(void*), 0/*align*/, hDevice, &dError_code));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dNum_tables));
  // L0_SAFE_CALL(zeMemAllocDevice(hContext, &alloc_desc, sizeof(void*),
  // 0/*align*/, hDevice, &dJoin_hash_tables_ptr));

  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 0, sizeof(void *), &dCol_buffers));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 1, sizeof(void *), &dNum_fragments));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 2, sizeof(void *), &dLiterals));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 3, sizeof(void *), &dNum_row_ptr));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 4, sizeof(void *), &dFrag_row_offsets));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 5, sizeof(void *), &dMax_matched));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 6, sizeof(void *), &dTotal_matched));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 7, sizeof(void *), &dInit_agg_value));
  L0_SAFE_CALL(zeKernelSetArgumentValue(hKernel, 8, sizeof(void *), &dOut));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 9, sizeof(void *), &dError_code));
  L0_SAFE_CALL(
      zeKernelSetArgumentValue(hKernel, 10, sizeof(void *), &dNum_tables));
  L0_SAFE_CALL(zeKernelSetArgumentValue(hKernel, 11, sizeof(void *),
                                        &dJoin_hash_tables_ptr));

  // void *a_void = a.data;
  // L0_SAFE_CALL(zeCommandListAppendMemoryCopy(hCommandList, dA, a_void,
  // copy_size, nullptr, 0, nullptr));

  // TODO

  void *col_data = (void *)col_buffers_ptr;
  L0_SAFE_CALL(zeCommandListAppendMemoryCopy(
      hCommandList, dCol_buffers, col_data, data.size(), nullptr, 0, nullptr));

  L0_SAFE_CALL(zeCommandListAppendBarrier(hCommandList, nullptr, 0, nullptr));
  L0_SAFE_CALL(zeKernelSetGroupSize(hKernel, 1, 1, 1));
  ze_group_count_t dispatchTraits = {1, 2, 2};

  L0_SAFE_CALL(zeCommandListAppendLaunchKernel(
      hCommandList, hKernel, &dispatchTraits, nullptr, 0, nullptr));

  L0_SAFE_CALL(zeCommandListAppendBarrier(hCommandList, nullptr, 0, nullptr));
  // L0_SAFE_CALL(zeCommandListAppendMemoryCopy(hCommandList, c_void, dC,
  //         copy_size, nullptr, 0, nullptr));

  L0_SAFE_CALL(zeCommandListClose(hCommandList));
  L0_SAFE_CALL(zeCommandQueueExecuteCommandLists(hCommandQueue, 1,
                                                 &hCommandList, nullptr));
  L0_SAFE_CALL(zeCommandQueueSynchronize(hCommandQueue,
                                         std::numeric_limits<uint32_t>::max()));

  // for (int i = 0; i < a_size; ++i) {
  //     std::cout << c.data[i] << " ";
  // }
  // std::cout << std::endl;

  // L0_SAFE_CALL(zeMemFree(hContext, dA));
  // L0_SAFE_CALL(zeMemFree(hContext, dB));
  // L0_SAFE_CALL(zeMemFree(hContext, dC));
}