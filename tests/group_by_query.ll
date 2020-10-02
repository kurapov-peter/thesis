; ModuleID = 'query.bc'
source_filename = "/export/users/pakurapo/dynamic_offloading/omniscidb/QueryEngine/RuntimeFunctions.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"dest\00", align 1
@.str.1 = private unnamed_addr constant [85 x i8] c"/export/users/pakurapo/dynamic_offloading/omniscidb/QueryEngine/RuntimeFunctions.cpp\00", align 1
@__PRETTY_FUNCTION__.write_back_nop = private unnamed_addr constant [57 x i8] c"void write_back_nop(int64_t *, int64_t *, const int32_t)\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"groups_buffer\00", align 1
@__PRETTY_FUNCTION__.init_group_by_buffer_gpu = private unnamed_addr constant [132 x i8] c"void init_group_by_buffer_gpu(int64_t *, const int64_t *, const uint32_t, const uint32_t, const uint32_t, const bool, const int8_t)\00", align 1
@__PRETTY_FUNCTION__.init_columnar_group_by_buffer_gpu = private unnamed_addr constant [154 x i8] c"void init_columnar_group_by_buffer_gpu(int64_t *, const int64_t *, const uint32_t, const uint32_t, const uint32_t, const bool, const bool, const int32_t)\00", align 1
@__PRETTY_FUNCTION__.init_group_by_buffer_impl = private unnamed_addr constant [133 x i8] c"void init_group_by_buffer_impl(int64_t *, const int64_t *, const uint32_t, const uint32_t, const uint32_t, const bool, const int8_t)\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"max_arr_size >= elem_count\00", align 1
@.str.4 = private unnamed_addr constant [94 x i8] c"/export/users/pakurapo/dynamic_offloading/omniscidb/QueryEngine/JoinHashTableQueryRuntime.cpp\00", align 1
@__PRETTY_FUNCTION__.get_candidate_rows = private unnamed_addr constant [199 x i8] c"int64_t get_candidate_rows(int32_t *, const uint32_t, const int8_t *, const int32_t, const double, const double, const int32_t, const int64_t, int64_t *, const int64_t, const int64_t, const int64_t)\00", align 1
@.str.5 = private unnamed_addr constant [159 x i8] c"col_buffers || literals || num_rows || frag_row_offsets || max_matched || init_agg_value || out || frag_idx || error_code || join_hash_tables || total_matched\00", align 1
@__PRETTY_FUNCTION__.query_stub_hoisted_literals = private unnamed_addr constant [196 x i8] c"void query_stub_hoisted_literals(const int8_t **, const int8_t *, const int64_t *, const uint64_t *, const int32_t *, const int64_t *, int64_t **, uint32_t, const int64_t *, int32_t *, int32_t *)\00", align 1
@.str.6 = private unnamed_addr constant [147 x i8] c"col_buffers || num_rows || frag_row_offsets || max_matched || init_agg_value || out || frag_idx || error_code || join_hash_tables || total_matched\00", align 1
@__PRETTY_FUNCTION__.query_stub = private unnamed_addr constant [163 x i8] c"void query_stub(const int8_t **, const int64_t *, const uint64_t *, const int32_t *, const int64_t *, int64_t **, uint32_t, const int64_t *, int32_t *, int32_t *)\00", align 1
@_ZZ20check_interrupt_initE22runtime_interrupt_flag.0.0 = internal unnamed_addr global i8 0, align 1

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define dso_local i64 @fixed_width_int_decode(i8* nocapture readonly %0, i32 %1, i64 %2) local_unnamed_addr #0 {
  switch i32 %1, label %25 [
    i32 1, label %4
    i32 2, label %8
    i32 4, label %14
    i32 8, label %20
  ]

4:                                                ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 %2
  %6 = load i8, i8* %5, align 1, !tbaa !2
  %7 = sext i8 %6 to i64
  br label %25

8:                                                ; preds = %3
  %9 = shl nsw i64 %2, 1
  %10 = getelementptr inbounds i8, i8* %0, i64 %9
  %11 = bitcast i8* %10 to i16*
  %12 = load i16, i16* %11, align 2, !tbaa !5
  %13 = sext i16 %12 to i64
  br label %25

14:                                               ; preds = %3
  %15 = shl nsw i64 %2, 2
  %16 = getelementptr inbounds i8, i8* %0, i64 %15
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = sext i32 %18 to i64
  br label %25

20:                                               ; preds = %3
  %21 = shl nsw i64 %2, 3
  %22 = getelementptr inbounds i8, i8* %0, i64 %21
  %23 = bitcast i8* %22 to i64*
  %24 = load i64, i64* %23, align 8, !tbaa !9
  br label %25

25:                                               ; preds = %20, %14, %8, %4, %3
  %26 = phi i64 [ %24, %20 ], [ %19, %14 ], [ %13, %8 ], [ %7, %4 ], [ -9223372036854775807, %3 ]
  ret i64 %26
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define internal i64 @fixed_width_unsigned_decode(i8* nocapture readonly %0, i32 %1, i64 %2) local_unnamed_addr #0 {
  switch i32 %1, label %25 [
    i32 1, label %4
    i32 2, label %8
    i32 4, label %14
    i32 8, label %20
  ]

4:                                                ; preds = %3
  %5 = getelementptr inbounds i8, i8* %0, i64 %2
  %6 = load i8, i8* %5, align 1, !tbaa !2
  %7 = zext i8 %6 to i64
  br label %25

8:                                                ; preds = %3
  %9 = shl nsw i64 %2, 1
  %10 = getelementptr inbounds i8, i8* %0, i64 %9
  %11 = bitcast i8* %10 to i16*
  %12 = load i16, i16* %11, align 2, !tbaa !5
  %13 = zext i16 %12 to i64
  br label %25

14:                                               ; preds = %3
  %15 = shl nsw i64 %2, 2
  %16 = getelementptr inbounds i8, i8* %0, i64 %15
  %17 = bitcast i8* %16 to i32*
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = zext i32 %18 to i64
  br label %25

20:                                               ; preds = %3
  %21 = shl nsw i64 %2, 3
  %22 = getelementptr inbounds i8, i8* %0, i64 %21
  %23 = bitcast i8* %22 to i64*
  %24 = load i64, i64* %23, align 8, !tbaa !9
  br label %25

25:                                               ; preds = %20, %14, %8, %4, %3
  %26 = phi i64 [ %24, %20 ], [ %19, %14 ], [ %13, %8 ], [ %7, %4 ], [ -9223372036854775807, %3 ]
  ret i64 %26
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
declare dso_local i64 @fixed_width_int_decode_noinline(i8* nocapture readonly, i32, i64) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
declare dso_local i64 @fixed_width_unsigned_decode_noinline(i8* nocapture readonly, i32, i64) local_unnamed_addr #1

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define internal i64 @diff_fixed_width_int_decode(i8* nocapture readonly %0, i32 %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  switch i32 %1, label %26 [
    i32 1, label %5
    i32 2, label %9
    i32 4, label %15
    i32 8, label %21
  ]

5:                                                ; preds = %4
  %6 = getelementptr inbounds i8, i8* %0, i64 %3
  %7 = load i8, i8* %6, align 1, !tbaa !2
  %8 = sext i8 %7 to i64
  br label %26

9:                                                ; preds = %4
  %10 = shl nsw i64 %3, 1
  %11 = getelementptr inbounds i8, i8* %0, i64 %10
  %12 = bitcast i8* %11 to i16*
  %13 = load i16, i16* %12, align 2, !tbaa !5
  %14 = sext i16 %13 to i64
  br label %26

15:                                               ; preds = %4
  %16 = shl nsw i64 %3, 2
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  %18 = bitcast i8* %17 to i32*
  %19 = load i32, i32* %18, align 4, !tbaa !7
  %20 = sext i32 %19 to i64
  br label %26

21:                                               ; preds = %4
  %22 = shl nsw i64 %3, 3
  %23 = getelementptr inbounds i8, i8* %0, i64 %22
  %24 = bitcast i8* %23 to i64*
  %25 = load i64, i64* %24, align 8, !tbaa !9
  br label %26

26:                                               ; preds = %21, %15, %9, %5, %4
  %27 = phi i64 [ %25, %21 ], [ %20, %15 ], [ %14, %9 ], [ %8, %5 ], [ -9223372036854775807, %4 ]
  %28 = add nsw i64 %27, %2
  ret i64 %28
}

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define internal float @fixed_width_float_decode(i8* nocapture readonly %0, i64 %1) local_unnamed_addr #0 {
  %3 = shl i64 %1, 2
  %4 = getelementptr inbounds i8, i8* %0, i64 %3
  %5 = bitcast i8* %4 to float*
  %6 = load float, float* %5, align 4, !tbaa !11
  ret float %6
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
declare dso_local float @fixed_width_float_decode_noinline(i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define internal double @fixed_width_double_decode(i8* nocapture readonly %0, i64 %1) local_unnamed_addr #0 {
  %3 = shl i64 %1, 3
  %4 = getelementptr inbounds i8, i8* %0, i64 %3
  %5 = bitcast i8* %4 to double*
  %6 = load double, double* %5, align 8, !tbaa !13
  ret double %6
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
declare dso_local double @fixed_width_double_decode_noinline(i8* nocapture readonly, i64) local_unnamed_addr #1

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
define internal i64 @fixed_width_small_date_decode(i8* nocapture readonly %0, i32 %1, i32 %2, i64 %3, i64 %4) local_unnamed_addr #0 {
  switch i32 %1, label %27 [
    i32 1, label %6
    i32 2, label %10
    i32 4, label %16
    i32 8, label %22
  ]

6:                                                ; preds = %5
  %7 = getelementptr inbounds i8, i8* %0, i64 %4
  %8 = load i8, i8* %7, align 1, !tbaa !2
  %9 = sext i8 %8 to i64
  br label %27

10:                                               ; preds = %5
  %11 = shl nsw i64 %4, 1
  %12 = getelementptr inbounds i8, i8* %0, i64 %11
  %13 = bitcast i8* %12 to i16*
  %14 = load i16, i16* %13, align 2, !tbaa !5
  %15 = sext i16 %14 to i64
  br label %27

16:                                               ; preds = %5
  %17 = shl nsw i64 %4, 2
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  %19 = bitcast i8* %18 to i32*
  %20 = load i32, i32* %19, align 4, !tbaa !7
  %21 = sext i32 %20 to i64
  br label %27

22:                                               ; preds = %5
  %23 = shl nsw i64 %4, 3
  %24 = getelementptr inbounds i8, i8* %0, i64 %23
  %25 = bitcast i8* %24 to i64*
  %26 = load i64, i64* %25, align 8, !tbaa !9
  br label %27

27:                                               ; preds = %22, %16, %10, %6, %5
  %28 = phi i64 [ %26, %22 ], [ %21, %16 ], [ %15, %10 ], [ %9, %6 ], [ -9223372036854775807, %5 ]
  %29 = sext i32 %2 to i64
  %30 = icmp eq i64 %28, %29
  %31 = mul nsw i64 %28, 86400
  %32 = select i1 %30, i64 %3, i64 %31
  ret i64 %32
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
declare dso_local i64 @fixed_width_small_date_decode_noinline(i8* nocapture readonly, i32, i32, i64, i64) local_unnamed_addr #1

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @add_int8_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @sub_int8_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mul_int8_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @div_int8_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @safe_div_int8_t(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @add_int8_t_nullable_lhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @sub_int8_t_nullable_lhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mul_int8_t_nullable_lhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @div_int8_t_nullable_lhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @add_int8_t_nullable_rhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @sub_int8_t_nullable_rhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mul_int8_t_nullable_rhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @div_int8_t_nullable_rhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int8_t_nullable(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int8_t_nullable_lhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int8_t_nullable_rhs(i8 signext, i8 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @add_int16_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @sub_int16_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mul_int16_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @div_int16_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @safe_div_int16_t(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @add_int16_t_nullable_lhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @sub_int16_t_nullable_lhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mul_int16_t_nullable_lhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @div_int16_t_nullable_lhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @add_int16_t_nullable_rhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @sub_int16_t_nullable_rhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mul_int16_t_nullable_rhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @div_int16_t_nullable_rhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int16_t_nullable(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int16_t_nullable_lhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int16_t_nullable_rhs(i16 signext, i16 signext, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @add_int32_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @sub_int32_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mul_int32_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @div_int32_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @safe_div_int32_t(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @add_int32_t_nullable_lhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @sub_int32_t_nullable_lhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mul_int32_t_nullable_lhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @div_int32_t_nullable_lhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @add_int32_t_nullable_rhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @sub_int32_t_nullable_rhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mul_int32_t_nullable_rhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @div_int32_t_nullable_rhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int32_t_nullable(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int32_t_nullable_lhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int32_t_nullable_rhs(i32, i32, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @add_int64_t_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @sub_int64_t_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mul_int64_t_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @div_int64_t_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @safe_div_int64_t(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @add_int64_t_nullable_lhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @sub_int64_t_nullable_lhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mul_int64_t_nullable_lhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @div_int64_t_nullable_lhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @add_int64_t_nullable_rhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @sub_int64_t_nullable_rhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mul_int64_t_nullable_rhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @div_int64_t_nullable_rhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int64_t_nullable(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int64_t_nullable_lhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_int64_t_nullable_rhs(i64, i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @add_float_nullable(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @sub_float_nullable(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @mul_float_nullable(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @div_float_nullable(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @safe_div_float(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @add_float_nullable_lhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @sub_float_nullable_lhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @mul_float_nullable_lhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @div_float_nullable_lhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @add_float_nullable_rhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @sub_float_nullable_rhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @mul_float_nullable_rhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @div_float_nullable_rhs(float, float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_float_nullable(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_float_nullable_lhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_float_nullable_rhs(float, float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @add_double_nullable(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @sub_double_nullable(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @mul_double_nullable(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @div_double_nullable(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @safe_div_double(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @add_double_nullable_lhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @sub_double_nullable_lhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @mul_double_nullable_lhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @div_double_nullable_lhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @add_double_nullable_rhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @sub_double_nullable_rhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @mul_double_nullable_rhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @div_double_nullable_rhs(double, double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_double_nullable(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_double_nullable_lhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @eq_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ne_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @lt_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @gt_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @le_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @ge_double_nullable_rhs(double, double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mod_int8_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mod_int16_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mod_int32_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mod_int64_t_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mod_int8_t_nullable_lhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mod_int16_t_nullable_lhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mod_int32_t_nullable_lhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mod_int64_t_nullable_lhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @mod_int8_t_nullable_rhs(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @mod_int16_t_nullable_rhs(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @mod_int32_t_nullable_rhs(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @mod_int64_t_nullable_rhs(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @scale_decimal_up(i64, i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @scale_decimal_down_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @scale_decimal_down_not_nullable(i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @uminus_int8_t_nullable(i8 signext, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @uminus_int16_t_nullable(i16 signext, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @uminus_int32_t_nullable(i32, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @uminus_int64_t_nullable(i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @uminus_float_nullable(float, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @uminus_double_nullable(double, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @cast_int8_t_to_int16_t_nullable(i8 signext, i8 signext, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @cast_int16_t_to_int8_t_nullable(i16 signext, i16 signext, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_int8_t_to_int32_t_nullable(i8 signext, i8 signext, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @cast_int32_t_to_int8_t_nullable(i32, i32, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @cast_int8_t_to_int64_t_nullable(i8 signext, i8 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @cast_int64_t_to_int8_t_nullable(i64, i64, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_int16_t_to_int32_t_nullable(i16 signext, i16 signext, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @cast_int32_t_to_int16_t_nullable(i32, i32, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @cast_int16_t_to_int64_t_nullable(i16 signext, i16 signext, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @cast_int64_t_to_int16_t_nullable(i64, i64, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @cast_int32_t_to_int64_t_nullable(i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_int64_t_to_int32_t_nullable(i64, i64, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @cast_float_to_double_nullable(float, float, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @cast_double_to_float_nullable(double, double, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @cast_float_to_int8_t_nullable(float, float, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @cast_int8_t_to_float_nullable(i8 signext, i8 signext, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @cast_float_to_int16_t_nullable(float, float, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @cast_int16_t_to_float_nullable(i16 signext, i16 signext, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_float_to_int32_t_nullable(float, float, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @cast_int32_t_to_float_nullable(i32, i32, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @cast_float_to_int64_t_nullable(float, float, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local float @cast_int64_t_to_float_nullable(i64, i64, float) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @cast_double_to_int8_t_nullable(double, double, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @cast_int8_t_to_double_nullable(i8 signext, i8 signext, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i16 @cast_double_to_int16_t_nullable(double, double, i16 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @cast_int16_t_to_double_nullable(i16 signext, i16 signext, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_double_to_int32_t_nullable(double, double, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @cast_int32_t_to_double_nullable(i32, i32, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @cast_double_to_int64_t_nullable(double, double, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local double @cast_int64_t_to_double_nullable(i64, i64, double) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_uint8_t_to_int32_t_nullable(i8 zeroext, i8 zeroext, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @cast_uint16_t_to_int32_t_nullable(i16 zeroext, i16 zeroext, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @logical_not(i8 signext, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @logical_and(i8 signext, i8 signext, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local signext i8 @logical_or(i8 signext, i8 signext, i8 signext) local_unnamed_addr #3

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_count(i64* nocapture, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_count_distinct_bitmap(i64* nocapture readonly, i64, i64) local_unnamed_addr #4

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_count_distinct_bitmap_gpu(i64*, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline uwtable
declare dso_local void @agg_approximate_count_distinct(i64* nocapture readonly, i64, i32) local_unnamed_addr #6

declare dso_local i64 @MurmurHash64A(i8*, i32, i64) local_unnamed_addr #7

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_approximate_count_distinct_gpu(i64*, i64, i32, i64, i64) local_unnamed_addr #5

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local signext i8 @bit_is_set(i64, i64, i64, i64, i64, i8 signext) local_unnamed_addr #0

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_sum(i64* nocapture, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max(i64* nocapture, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min(i64* nocapture, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @agg_id(i64* nocapture, i64) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id(i64* nocapture, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_count_distinct_bitmap_skip_val(i64* nocapture readonly, i64, i64, i64) local_unnamed_addr #4

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_count_distinct_bitmap_skip_val_gpu(i64*, i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
define dso_local i32 @agg_count_int32(i32* nocapture %0, i32 %1) local_unnamed_addr #4 {
  %3 = load i32, i32* %0, align 4, !tbaa !7
  %4 = add i32 %3, 1
  store i32 %4, i32* %0, align 4, !tbaa !7
  ret i32 %3
}

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @agg_sum_int32(i32* nocapture, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int32(i32* nocapture, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int16(i16* nocapture, i16 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int8(i8* nocapture, i8 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int32(i32* nocapture, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int16(i16* nocapture, i16 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int8(i8* nocapture, i8 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
define dso_local void @agg_id_int32(i32* nocapture %0, i32 %1) local_unnamed_addr #8 {
  store i32 %1, i32* %0, align 4, !tbaa !7
  ret void
}

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @agg_id_int16(i16* nocapture, i16 signext) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @agg_id_int8(i8* nocapture, i8 signext) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id_int32(i32* nocapture, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id_int16(i16* nocapture, i16 signext, i16 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id_int8(i8* nocapture, i8 signext, i8 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @write_projection_int64(i8* nocapture, i64, i64) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @write_projection_int32(i8* nocapture, i32, i64) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_sum_skip_val(i64* nocapture, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @agg_sum_int32_skip_val(i32* nocapture, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_count_skip_val(i64* nocapture, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @agg_count_int32_skip_val(i32* nocapture, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_skip_val(i64* nocapture, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_skip_val(i64* nocapture, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int32_skip_val(i32* nocapture, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int32_skip_val(i32* nocapture, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int16_skip_val(i16* nocapture, i16 signext, i16 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int16_skip_val(i16* nocapture, i16 signext, i16 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_max_int8_skip_val(i8* nocapture, i8 signext, i8 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_min_int8_skip_val(i8* nocapture, i8 signext, i8 signext) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_count_double(i64* nocapture, double) local_unnamed_addr #4

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_sum_double(i64* nocapture, double) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_max_double(i64* nocapture, double) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_min_double(i64* nocapture, double) local_unnamed_addr #9

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @agg_id_double(i64* nocapture, double) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id_double(i64* nocapture, double, double) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @agg_count_float(i32* nocapture, float) local_unnamed_addr #4

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_sum_float(i32* nocapture, float) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_max_float(i32* nocapture, float) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_min_float(i32* nocapture, float) local_unnamed_addr #9

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local void @agg_id_float(i32* nocapture, float) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @checked_single_agg_id_float(i32* nocapture, float, float) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64 @agg_count_double_skip_val(i64* nocapture, double, double) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @agg_count_float_skip_val(i32* nocapture, float, float) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_sum_double_skip_val(i64* nocapture, double, double) local_unnamed_addr #4

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_max_double_skip_val(i64* nocapture, double, double) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_min_double_skip_val(i64* nocapture, double, double) local_unnamed_addr #9

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @agg_sum_float_skip_val(i32* nocapture, float, float) local_unnamed_addr #4

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_max_float_skip_val(i32* nocapture, float, float) local_unnamed_addr #9

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local void @agg_min_float_skip_val(i32* nocapture, float, float) local_unnamed_addr #9

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @decimal_floor(i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @decimal_ceil(i64, i64) local_unnamed_addr #3

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_count_shared(i64*, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_count_skip_val_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_count_int32_shared(i32*, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_count_int32_skip_val_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_count_double_shared(i64*, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_count_double_skip_val_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_count_float_shared(i32*, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_count_float_skip_val_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_shared(i64*, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_skip_val_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int32_shared(i32*, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int16_shared(i16*, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int8_shared(i8*, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int32_skip_val_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_double_shared(i64*, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_double_skip_val_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_float_shared(i32*, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_float_skip_val_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_shared(i64*, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_skip_val_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int32_shared(i32*, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int16_shared(i16*, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int8_shared(i8*, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int32_skip_val_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_double_shared(i64*, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_double_skip_val_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_float_shared(i32*, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_float_skip_val_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_shared(i64*, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_skip_val_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_int32_shared(i32*, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_int16_shared(i16*, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_int8_shared(i8*, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_int32_skip_val_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_double_shared(i64*, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_double_skip_val_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_float_shared(i32*, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_float_skip_val_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_int32_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_int16_shared(i16*, i16 signext, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_int8_shared(i8*, i8 signext, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_double_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @checked_single_agg_id_float_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int16_skip_val_shared(i16*, i16 signext, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_max_int8_skip_val_shared(i8*, i8 signext, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int16_skip_val_shared(i16*, i16 signext, i16 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_min_int8_skip_val_shared(i8*, i8 signext, i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_id_double_shared_slow(i64*, double*) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_sum_shared(i64*, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @agg_sum_skip_val_shared(i64*, i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_sum_int32_shared(i32*, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i32 @agg_sum_int32_skip_val_shared(i32*, i32, i32) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_sum_double_shared(i64*, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_sum_double_skip_val_shared(i64*, double, double) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_sum_float_shared(i32*, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @agg_sum_float_skip_val_shared(i32*, float, float) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @force_sync() local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @sync_warp() local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @sync_warp_protected(i64, i64) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @sync_threadblock() local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local void @write_back_non_grouped_agg(i64*, i64*, i32) local_unnamed_addr #5

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i32 @pos_start_impl(i32*) local_unnamed_addr #10

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i32 @group_buff_idx_impl() local_unnamed_addr #10

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i32 @pos_step_impl() local_unnamed_addr #11

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local signext i8 @thread_warp_idx(i8 signext) local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @get_thread_index() local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64* @declare_dynamic_shared_memory() local_unnamed_addr #5

; Function Attrs: noinline nounwind optnone uwtable
declare dso_local i64 @get_block_index() local_unnamed_addr #5

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
define internal i32 @record_error_code(i32 returned %0, i32* nocapture %1) local_unnamed_addr #4 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %14, label %4

4:                                                ; preds = %2
  %5 = tail call i32 @pos_start_impl(i32* null)
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32* %1, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !7
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %10, label %14

10:                                               ; preds = %4
  %11 = tail call i32 @pos_start_impl(i32* null)
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %1, i64 %12
  store i32 %0, i32* %13, align 4, !tbaa !7
  br label %14

14:                                               ; preds = %10, %4, %2
  ret i32 %0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i64* @init_shared_mem_nop(i64* readnone returned, i32) local_unnamed_addr #11

; Function Attrs: noinline nounwind uwtable
declare dso_local void @write_back_nop(i64* readnone, i64* nocapture readnone, i32) local_unnamed_addr #12

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #13

; Function Attrs: norecurse nounwind readnone uwtable
declare dso_local noalias i64* @init_shared_mem(i64* nocapture readnone, i32) local_unnamed_addr #14

; Function Attrs: noinline nounwind uwtable
declare dso_local void @init_group_by_buffer_gpu(i64* readnone, i64* nocapture readnone, i32, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #12

; Function Attrs: noinline nounwind uwtable
declare dso_local void @init_columnar_group_by_buffer_gpu(i64* readnone, i64* nocapture readnone, i32, i32, i32, i1 zeroext, i1 zeroext, i32) local_unnamed_addr #12

; Function Attrs: noinline nounwind uwtable
declare dso_local void @init_group_by_buffer_impl(i64* readnone, i64* nocapture readnone, i32, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #12

; Function Attrs: alwaysinline nounwind uwtable
declare dso_local i64* @get_matching_group_value(i64*, i32, i64* nocapture readonly, i32, i32, i32, i64* nocapture readnone) local_unnamed_addr #9

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @get_matching_group_value_columnar_slot(i64* nocapture, i32, i32, i64* nocapture readonly, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64* @get_matching_group_value_columnar(i64*, i32, i64* nocapture readonly, i32, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i64* @get_matching_group_value_perfect_hash(i64*, i32, i64* nocapture readonly, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64* @get_matching_group_value_perfect_hash_keyless(i64* readnone, i32, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local void @set_matching_group_value_perfect_hash_columnar(i64* nocapture, i32, i64* nocapture readonly, i32, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32* @get_bucketized_hash_slot(i32* readnone, i64, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32* @get_hash_slot(i32* readnone, i64, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32* @get_bucketized_hash_slot_sharded(i32* readnone, i64, i64, i32, i32, i32, i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32* @get_hash_slot_sharded(i32* readnone, i64, i64, i32, i32, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline uwtable
declare dso_local i32 @key_hash(i64*, i32, i32) local_unnamed_addr #15

declare dso_local i32 @MurmurHash1(i8*, i32, i32) local_unnamed_addr #7

; Function Attrs: noinline uwtable
declare dso_local i64* @get_group_value(i64*, i32, i64*, i32, i32, i32, i64* nocapture readnone) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i64* @get_group_value_with_watchdog(i64*, i32, i64*, i32, i32, i32, i64* nocapture readnone) local_unnamed_addr #6

declare dso_local zeroext i1 @dynamic_watchdog() local_unnamed_addr #7

; Function Attrs: noinline uwtable
declare dso_local i32 @get_group_value_columnar_slot(i64* nocapture, i32, i64*, i32, i32) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i32 @get_group_value_columnar_slot_with_watchdog(i64* nocapture, i32, i64*, i32, i32) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i64* @get_group_value_columnar(i64*, i32, i64*, i32) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i64* @get_group_value_columnar_with_watchdog(i64*, i32, i64*, i32) local_unnamed_addr #6

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local nonnull i64* @get_group_value_fast(i64*, i64, i64, i64, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local nonnull i64* @get_group_value_fast_with_original_key(i64*, i64, i64, i64, i64, i32) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local i32 @get_columnar_group_bin_offset(i64* nocapture, i64, i64, i64) local_unnamed_addr #4

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local i64* @get_scan_output_slot(i64*, i32, i32, i64, i32) local_unnamed_addr #8

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable writeonly
declare dso_local i32 @get_columnar_scan_output_offset(i64* nocapture, i32, i32, i64) local_unnamed_addr #8

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @bucketized_hash_join_idx(i64, i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx(i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @bucketized_hash_join_idx_nullable(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx_nullable(i64, i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @bucketized_hash_join_idx_bitwise(i64, i64, i64, i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx_bitwise(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx_sharded(i64, i64, i64, i64, i32, i32, i32) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx_sharded_nullable(i64, i64, i64, i64, i32, i32, i32, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @hash_join_idx_bitwise_sharded(i64, i64, i64, i64, i32, i32, i32, i64, i64) local_unnamed_addr #0

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i64 @translate_null_key_int8_t(i8 signext, i8 signext, i64) local_unnamed_addr #11

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i64 @translate_null_key_int16_t(i16 signext, i16 signext, i64) local_unnamed_addr #11

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i64 @translate_null_key_int32_t(i32, i32, i64) local_unnamed_addr #11

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i64 @translate_null_key_int64_t(i64, i64, i64) local_unnamed_addr #11

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @_Z14compare_to_keyPKaS0_m(i8* nocapture readonly, i8* nocapture readonly, i64) local_unnamed_addr #16

; Function Attrs: noinline uwtable
declare dso_local i64 @baseline_hash_join_idx_32(i8* nocapture readonly, i8*, i64, i64) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i64 @baseline_hash_join_idx_64(i8* nocapture readonly, i8*, i64, i64) local_unnamed_addr #6

; Function Attrs: noinline nounwind readonly uwtable
declare dso_local i64 @get_bucket_key_for_range_double(i8* nocapture readonly, i64, double) local_unnamed_addr #17

; Function Attrs: noinline nounwind readonly uwtable
declare dso_local i64 @get_bucket_key_for_range_compressed(i8* nocapture readonly, i64, double) local_unnamed_addr #17

; Function Attrs: noinline uwtable
declare dso_local i64 @get_composite_key_index_32(i32*, i64, i32* nocapture readonly, i64) local_unnamed_addr #6

; Function Attrs: noinline uwtable
declare dso_local i64 @get_composite_key_index_64(i64*, i64, i64* nocapture readonly, i64) local_unnamed_addr #6

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i32 @insert_sorted(i32* nocapture, i64, i32) local_unnamed_addr #10

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @overlaps_hash_join_idx(i64, i64, i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline uwtable
declare dso_local { i32*, i64 } @_Z21get_row_id_buffer_ptrPlPKlllll(i64*, i64*, i64, i64, i64, i64) local_unnamed_addr #15

; Function Attrs: noinline uwtable
declare dso_local i64 @get_candidate_rows(i32* nocapture, i32, i8* nocapture readonly, i32, double, double, i32, i64, i64*, i64, i64, i64) local_unnamed_addr #6

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.floor.f64(double) #18

; Function Attrs: noinline nounwind readonly uwtable
declare dso_local i32 @get_num_buckets_for_bounds(i8* nocapture readonly, i32, double, double) local_unnamed_addr #17

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
define dso_local i64* @get_group_value_fast_keyless(i64* readnone %0, i64 %1, i64 %2, i64 %3, i32 %4) local_unnamed_addr #3 {
  %6 = zext i32 %4 to i64
  %7 = sub nsw i64 %1, %2
  %8 = mul nsw i64 %7, %6
  %9 = getelementptr inbounds i64, i64* %0, i64 %8
  ret i64* %9
}

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64* @get_group_value_fast_keyless_semiprivate(i64* readnone, i64, i64, i64, i32, i8 zeroext, i8 zeroext) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i8* @extract_str_ptr(i64) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @extract_str_len(i64) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i8* @extract_str_ptr_noinline(i64) local_unnamed_addr #11

; Function Attrs: noinline norecurse nounwind readnone uwtable
declare dso_local i32 @extract_str_len_noinline(i64) local_unnamed_addr #11

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i64 @string_pack(i8*, i32) local_unnamed_addr #3

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_like_simple(i8* nocapture readonly, i32, i8* nocapture readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_ilike_simple(i8* nocapture readonly, i32, i8* nocapture readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_like_simple_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_ilike_simple_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: nounwind readonly uwtable
declare dso_local zeroext i1 @string_like(i8* nocapture readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #19

; Function Attrs: nounwind readonly uwtable
define internal fastcc i32 @_ZL17string_like_matchPKciS0_icb(i8* nocapture readonly %0, i32 %1, i8* %2, i32 %3, i8 signext %4, i1 zeroext %5) unnamed_addr #19 {
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %3, 0
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %295

10:                                               ; preds = %6
  br i1 %5, label %11, label %101

11:                                               ; preds = %72, %10
  %12 = phi i32 [ %74, %72 ], [ %3, %10 ]
  %13 = phi i8* [ %73, %72 ], [ %2, %10 ]
  %14 = phi i32 [ %75, %72 ], [ %1, %10 ]
  %15 = phi i8* [ %76, %72 ], [ %0, %10 ]
  %16 = load i8, i8* %13, align 1, !tbaa !2
  %17 = icmp eq i8 %16, %4
  br i1 %17, label %50, label %18

18:                                               ; preds = %11
  switch i8 %16, label %41 [
    i8 37, label %120
    i8 95, label %38
    i8 91, label %69
  ]

19:                                               ; preds = %99, %19
  %20 = phi i32 [ %100, %99 ], [ %27, %19 ]
  %21 = phi i8* [ %84, %99 ], [ %22, %19 ]
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  %23 = load i8, i8* %22, align 1, !tbaa !2
  %24 = icmp ne i8 %23, 93
  %25 = icmp sgt i32 %20, 0
  %26 = and i1 %25, %24
  %27 = add nsw i32 %20, -1
  br i1 %26, label %19, label %28

28:                                               ; preds = %19
  %29 = icmp slt i32 %20, 1
  br i1 %29, label %317, label %30

30:                                               ; preds = %28
  %31 = ptrtoint i8* %22 to i64
  %32 = ptrtoint i8* %13 to i64
  %33 = xor i64 %31, 4294967295
  %34 = add i64 %33, %32
  %35 = trunc i64 %34 to i32
  %36 = add i32 %12, %35
  %37 = getelementptr inbounds i8, i8* %21, i64 2
  br label %72

38:                                               ; preds = %18
  %39 = getelementptr inbounds i8, i8* %13, i64 1
  %40 = add nsw i32 %12, -1
  br label %72

41:                                               ; preds = %18
  %42 = load i8, i8* %15, align 1, !tbaa !2
  %43 = sext i8 %42 to i32
  %44 = add i8 %42, -65
  %45 = icmp ult i8 %44, 26
  %46 = add nsw i32 %43, 32
  %47 = select i1 %45, i32 %46, i32 %43
  %48 = sext i8 %16 to i32
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %64, label %317

50:                                               ; preds = %11
  %51 = getelementptr inbounds i8, i8* %13, i64 1
  %52 = icmp slt i32 %12, 2
  br i1 %52, label %317, label %53

53:                                               ; preds = %50
  %54 = add nsw i32 %12, -1
  %55 = load i8, i8* %15, align 1, !tbaa !2
  %56 = sext i8 %55 to i32
  %57 = add i8 %55, -65
  %58 = icmp ult i8 %57, 26
  %59 = add nsw i32 %56, 32
  %60 = select i1 %58, i32 %59, i32 %56
  %61 = load i8, i8* %51, align 1, !tbaa !2
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %60, %62
  br i1 %63, label %64, label %317

64:                                               ; preds = %53, %41
  %65 = phi i8* [ %51, %53 ], [ %13, %41 ]
  %66 = phi i32 [ %54, %53 ], [ %12, %41 ]
  %67 = getelementptr inbounds i8, i8* %65, i64 1
  %68 = add nsw i32 %66, -1
  br label %72

69:                                               ; preds = %18
  %70 = add nsw i32 %12, -1
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %80, label %317

72:                                               ; preds = %64, %38, %30
  %73 = phi i8* [ %67, %64 ], [ %39, %38 ], [ %37, %30 ]
  %74 = phi i32 [ %68, %64 ], [ %40, %38 ], [ %36, %30 ]
  %75 = add nsw i32 %14, -1
  %76 = getelementptr inbounds i8, i8* %15, i64 1
  %77 = icmp sgt i32 %75, 0
  %78 = icmp sgt i32 %74, 0
  %79 = and i1 %77, %78
  br i1 %79, label %11, label %295

80:                                               ; preds = %96, %69
  %81 = phi i32 [ %97, %96 ], [ %70, %69 ]
  %82 = phi i8* [ %84, %96 ], [ %13, %69 ]
  %83 = phi i32 [ %81, %96 ], [ %12, %69 ]
  %84 = getelementptr inbounds i8, i8* %82, i64 1
  %85 = load i8, i8* %84, align 1, !tbaa !2
  %86 = icmp eq i8 %85, 93
  br i1 %86, label %317, label %87

87:                                               ; preds = %80
  %88 = load i8, i8* %15, align 1, !tbaa !2
  %89 = sext i8 %88 to i32
  %90 = add i8 %88, -65
  %91 = icmp ult i8 %90, 26
  %92 = add nsw i32 %89, 32
  %93 = select i1 %91, i32 %92, i32 %89
  %94 = sext i8 %85 to i32
  %95 = icmp eq i32 %93, %94
  br i1 %95, label %99, label %96

96:                                               ; preds = %87
  %97 = add nsw i32 %81, -1
  %98 = icmp sgt i32 %97, 0
  br i1 %98, label %80, label %317

99:                                               ; preds = %87
  %100 = add nsw i32 %83, -2
  br label %19

101:                                              ; preds = %245, %10
  %102 = phi i32 [ %247, %245 ], [ %3, %10 ]
  %103 = phi i8* [ %246, %245 ], [ %2, %10 ]
  %104 = phi i32 [ %248, %245 ], [ %1, %10 ]
  %105 = phi i8* [ %249, %245 ], [ %0, %10 ]
  %106 = load i8, i8* %103, align 1, !tbaa !2
  %107 = icmp eq i8 %106, %4
  br i1 %107, label %108, label %116

108:                                              ; preds = %101
  %109 = getelementptr inbounds i8, i8* %103, i64 1
  %110 = icmp slt i32 %102, 2
  br i1 %110, label %317, label %111

111:                                              ; preds = %108
  %112 = add nsw i32 %102, -1
  %113 = load i8, i8* %105, align 1, !tbaa !2
  %114 = load i8, i8* %109, align 1, !tbaa !2
  %115 = icmp eq i8 %113, %114
  br i1 %115, label %290, label %317

116:                                              ; preds = %101
  switch i8 %106, label %287 [
    i8 37, label %120
    i8 95, label %242
    i8 91, label %117
  ]

117:                                              ; preds = %116
  %118 = add nsw i32 %102, -1
  %119 = icmp sgt i32 %118, 0
  br i1 %119, label %253, label %317

120:                                              ; preds = %116, %18
  %121 = phi i8* [ %15, %18 ], [ %105, %116 ]
  %122 = phi i32 [ %14, %18 ], [ %104, %116 ]
  %123 = phi i8* [ %13, %18 ], [ %103, %116 ]
  %124 = phi i32 [ %12, %18 ], [ %102, %116 ]
  %125 = add nsw i32 %124, -1
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %317

127:                                              ; preds = %140, %120
  %128 = phi i32 [ %143, %140 ], [ %125, %120 ]
  %129 = phi i8* [ %133, %140 ], [ %123, %120 ]
  %130 = phi i32 [ %128, %140 ], [ %124, %120 ]
  %131 = phi i32 [ %142, %140 ], [ %122, %120 ]
  %132 = phi i8* [ %141, %140 ], [ %121, %120 ]
  %133 = getelementptr inbounds i8, i8* %129, i64 1
  %134 = load i8, i8* %133, align 1, !tbaa !2
  switch i8 %134, label %145 [
    i8 37, label %140
    i8 95, label %135
  ]

135:                                              ; preds = %127
  %136 = icmp slt i32 %131, 1
  br i1 %136, label %317, label %137

137:                                              ; preds = %135
  %138 = getelementptr inbounds i8, i8* %132, i64 1
  %139 = add nsw i32 %131, -1
  br label %140

140:                                              ; preds = %137, %127
  %141 = phi i8* [ %138, %137 ], [ %132, %127 ]
  %142 = phi i32 [ %139, %137 ], [ %131, %127 ]
  %143 = add nsw i32 %128, -1
  %144 = icmp sgt i32 %143, 0
  br i1 %144, label %127, label %317

145:                                              ; preds = %127
  %146 = icmp eq i8 %134, %4
  br i1 %146, label %147, label %152

147:                                              ; preds = %145
  %148 = icmp slt i32 %130, 3
  br i1 %148, label %317, label %149

149:                                              ; preds = %147
  %150 = getelementptr inbounds i8, i8* %129, i64 2
  %151 = load i8, i8* %150, align 1, !tbaa !2
  br label %165

152:                                              ; preds = %145
  %153 = icmp ne i8 %134, 91
  %154 = or i1 %146, %153
  %155 = getelementptr inbounds i8, i8* %129, i64 2
  %156 = add nsw i32 %128, -1
  %157 = icmp slt i32 %128, 2
  br i1 %154, label %165, label %158

158:                                              ; preds = %152
  %159 = icmp slt i32 %131, 1
  %160 = or i1 %159, %157
  br i1 %160, label %314, label %161

161:                                              ; preds = %158
  %162 = load i8, i8* %155, align 1, !tbaa !2
  %163 = icmp eq i8 %162, 93
  %164 = sext i8 %162 to i32
  br label %189

165:                                              ; preds = %152, %149
  %166 = phi i8 [ %151, %149 ], [ %134, %152 ]
  %167 = sext i8 %166 to i32
  %168 = icmp sgt i32 %131, 0
  br i1 %168, label %169, label %317

169:                                              ; preds = %185, %165
  %170 = phi i32 [ %187, %185 ], [ %131, %165 ]
  %171 = phi i8* [ %186, %185 ], [ %132, %165 ]
  %172 = load i8, i8* %171, align 1, !tbaa !2
  br i1 %5, label %175, label %173

173:                                              ; preds = %169
  %174 = icmp eq i8 %172, %166
  br i1 %174, label %182, label %185

175:                                              ; preds = %169
  %176 = sext i8 %172 to i32
  %177 = add i8 %172, -65
  %178 = icmp ult i8 %177, 26
  %179 = add nsw i32 %176, 32
  %180 = select i1 %178, i32 %179, i32 %176
  %181 = icmp eq i32 %180, %167
  br i1 %181, label %182, label %185

182:                                              ; preds = %175, %173
  %183 = tail call fastcc i32 @_ZL17string_like_matchPKciS0_icb(i8* nonnull %171, i32 %170, i8* nonnull %133, i32 %128, i8 signext %4, i1 zeroext %5)
  %184 = icmp eq i32 %183, 1
  br i1 %184, label %185, label %317

185:                                              ; preds = %182, %175, %173
  %186 = getelementptr inbounds i8, i8* %171, i64 1
  %187 = add nsw i32 %170, -1
  %188 = icmp sgt i32 %187, 0
  br i1 %188, label %169, label %317

189:                                              ; preds = %237, %161
  %190 = phi i32 [ %239, %237 ], [ %131, %161 ]
  %191 = phi i8* [ %238, %237 ], [ %132, %161 ]
  br i1 %5, label %195, label %192

192:                                              ; preds = %189
  br i1 %163, label %229, label %193

193:                                              ; preds = %192
  %194 = load i8, i8* %191, align 1, !tbaa !2
  br label %219

195:                                              ; preds = %189
  br i1 %163, label %237, label %196

196:                                              ; preds = %195
  %197 = load i8, i8* %191, align 1, !tbaa !2
  %198 = sext i8 %197 to i32
  %199 = add i8 %197, -65
  %200 = icmp ult i8 %199, 26
  %201 = add nsw i32 %198, 32
  %202 = select i1 %200, i32 %201, i32 %198
  %203 = icmp eq i32 %202, %164
  br i1 %203, label %229, label %210

204:                                              ; preds = %210
  %205 = load i8, i8* %213, align 1, !tbaa !2
  %206 = icmp eq i8 %205, 93
  br i1 %206, label %229, label %207

207:                                              ; preds = %204
  %208 = sext i8 %205 to i32
  %209 = icmp eq i32 %202, %208
  br i1 %209, label %229, label %210

210:                                              ; preds = %207, %196
  %211 = phi i32 [ %214, %207 ], [ %156, %196 ]
  %212 = phi i8* [ %213, %207 ], [ %155, %196 ]
  %213 = getelementptr inbounds i8, i8* %212, i64 1
  %214 = add nsw i32 %211, -1
  %215 = icmp sgt i32 %214, 0
  br i1 %215, label %204, label %317

216:                                              ; preds = %225
  %217 = load i8, i8* %226, align 1, !tbaa !2
  %218 = icmp eq i8 %217, 93
  br i1 %218, label %229, label %219

219:                                              ; preds = %216, %193
  %220 = phi i8 [ %217, %216 ], [ %162, %193 ]
  %221 = phi i32 [ %223, %216 ], [ %128, %193 ]
  %222 = phi i8* [ %226, %216 ], [ %155, %193 ]
  %223 = phi i32 [ %227, %216 ], [ %156, %193 ]
  %224 = icmp eq i8 %194, %220
  br i1 %224, label %229, label %225

225:                                              ; preds = %219
  %226 = getelementptr inbounds i8, i8* %222, i64 1
  %227 = add nsw i32 %223, -1
  %228 = icmp sgt i32 %227, 0
  br i1 %228, label %216, label %317

229:                                              ; preds = %219, %216, %207, %204, %196, %192
  %230 = phi i32 [ %128, %196 ], [ %128, %192 ], [ %211, %207 ], [ %211, %204 ], [ %221, %219 ], [ %223, %216 ]
  %231 = phi i1 [ true, %196 ], [ false, %192 ], [ true, %207 ], [ false, %204 ], [ true, %219 ], [ false, %216 ]
  %232 = icmp slt i32 %230, 2
  br i1 %232, label %317, label %233

233:                                              ; preds = %229
  br i1 %231, label %234, label %237

234:                                              ; preds = %233
  %235 = tail call fastcc i32 @_ZL17string_like_matchPKciS0_icb(i8* %191, i32 %190, i8* nonnull %133, i32 %128, i8 signext %4, i1 zeroext %5)
  %236 = icmp eq i32 %235, 1
  br i1 %236, label %237, label %317

237:                                              ; preds = %234, %233, %195
  %238 = getelementptr inbounds i8, i8* %191, i64 1
  %239 = add nsw i32 %190, -1
  %240 = icmp slt i32 %190, 2
  %241 = or i1 %240, %157
  br i1 %241, label %314, label %189

242:                                              ; preds = %116
  %243 = getelementptr inbounds i8, i8* %103, i64 1
  %244 = add nsw i32 %102, -1
  br label %245

245:                                              ; preds = %290, %279, %242
  %246 = phi i8* [ %293, %290 ], [ %243, %242 ], [ %286, %279 ]
  %247 = phi i32 [ %294, %290 ], [ %244, %242 ], [ %285, %279 ]
  %248 = add nsw i32 %104, -1
  %249 = getelementptr inbounds i8, i8* %105, i64 1
  %250 = icmp sgt i32 %248, 0
  %251 = icmp sgt i32 %247, 0
  %252 = and i1 %250, %251
  br i1 %252, label %101, label %295

253:                                              ; preds = %263, %117
  %254 = phi i32 [ %264, %263 ], [ %118, %117 ]
  %255 = phi i8* [ %257, %263 ], [ %103, %117 ]
  %256 = phi i32 [ %254, %263 ], [ %102, %117 ]
  %257 = getelementptr inbounds i8, i8* %255, i64 1
  %258 = load i8, i8* %257, align 1, !tbaa !2
  %259 = icmp eq i8 %258, 93
  br i1 %259, label %317, label %260

260:                                              ; preds = %253
  %261 = load i8, i8* %105, align 1, !tbaa !2
  %262 = icmp eq i8 %261, %258
  br i1 %262, label %266, label %263

263:                                              ; preds = %260
  %264 = add nsw i32 %254, -1
  %265 = icmp sgt i32 %264, 0
  br i1 %265, label %253, label %317

266:                                              ; preds = %260
  %267 = add nsw i32 %256, -2
  br label %268

268:                                              ; preds = %268, %266
  %269 = phi i32 [ %267, %266 ], [ %276, %268 ]
  %270 = phi i8* [ %257, %266 ], [ %271, %268 ]
  %271 = getelementptr inbounds i8, i8* %270, i64 1
  %272 = load i8, i8* %271, align 1, !tbaa !2
  %273 = icmp ne i8 %272, 93
  %274 = icmp sgt i32 %269, 0
  %275 = and i1 %274, %273
  %276 = add nsw i32 %269, -1
  br i1 %275, label %268, label %277

277:                                              ; preds = %268
  %278 = icmp slt i32 %269, 1
  br i1 %278, label %317, label %279

279:                                              ; preds = %277
  %280 = ptrtoint i8* %271 to i64
  %281 = ptrtoint i8* %103 to i64
  %282 = xor i64 %280, 4294967295
  %283 = add i64 %282, %281
  %284 = trunc i64 %283 to i32
  %285 = add i32 %102, %284
  %286 = getelementptr inbounds i8, i8* %270, i64 2
  br label %245

287:                                              ; preds = %116
  %288 = load i8, i8* %105, align 1, !tbaa !2
  %289 = icmp eq i8 %288, %106
  br i1 %289, label %290, label %317

290:                                              ; preds = %287, %111
  %291 = phi i8* [ %109, %111 ], [ %103, %287 ]
  %292 = phi i32 [ %112, %111 ], [ %102, %287 ]
  %293 = getelementptr inbounds i8, i8* %291, i64 1
  %294 = add nsw i32 %292, -1
  br label %245

295:                                              ; preds = %245, %72, %6
  %296 = phi i8* [ %2, %6 ], [ %73, %72 ], [ %246, %245 ]
  %297 = phi i32 [ %3, %6 ], [ %74, %72 ], [ %247, %245 ]
  %298 = phi i1 [ %7, %6 ], [ %77, %72 ], [ %250, %245 ]
  br i1 %298, label %317, label %299

299:                                              ; preds = %295
  %300 = icmp sgt i32 %297, 0
  br i1 %300, label %301, label %310

301:                                              ; preds = %306, %299
  %302 = phi i32 [ %308, %306 ], [ %297, %299 ]
  %303 = phi i8* [ %307, %306 ], [ %296, %299 ]
  %304 = load i8, i8* %303, align 1, !tbaa !2
  %305 = icmp eq i8 %304, 37
  br i1 %305, label %306, label %310

306:                                              ; preds = %301
  %307 = getelementptr inbounds i8, i8* %303, i64 1
  %308 = add nsw i32 %302, -1
  %309 = icmp sgt i32 %308, 0
  br i1 %309, label %301, label %310

310:                                              ; preds = %306, %301, %299
  %311 = phi i32 [ %297, %299 ], [ %308, %306 ], [ %302, %301 ]
  %312 = icmp slt i32 %311, 1
  %313 = select i1 %312, i32 0, i32 2
  br label %317

314:                                              ; preds = %237, %158
  %315 = phi i1 [ %159, %158 ], [ %240, %237 ]
  %316 = select i1 %315, i32 2, i32 3
  br label %317

317:                                              ; preds = %314, %310, %295, %287, %277, %263, %253, %234, %229, %225, %210, %185, %182, %165, %147, %140, %135, %120, %117, %111, %108, %96, %80, %69, %53, %50, %41, %28
  %318 = phi i32 [ 3, %147 ], [ 1, %295 ], [ %313, %310 ], [ 0, %120 ], [ %316, %314 ], [ 2, %165 ], [ %183, %182 ], [ 2, %185 ], [ 3, %210 ], [ 3, %225 ], [ 3, %229 ], [ %235, %234 ], [ 2, %135 ], [ 0, %140 ], [ 1, %80 ], [ 1, %96 ], [ 1, %69 ], [ 3, %50 ], [ 1, %53 ], [ 1, %41 ], [ 3, %28 ], [ 1, %253 ], [ 1, %263 ], [ 1, %117 ], [ 3, %108 ], [ 1, %111 ], [ 1, %287 ], [ 3, %277 ]
  ret i32 %318
}

; Function Attrs: nounwind readonly uwtable
declare dso_local zeroext i1 @string_ilike(i8* nocapture readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #19

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local i32 @StringCompare(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: nounwind readonly uwtable
declare dso_local signext i8 @string_like_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext, i8 signext) local_unnamed_addr #19

; Function Attrs: nounwind readonly uwtable
declare dso_local signext i8 @string_ilike_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext, i8 signext) local_unnamed_addr #19

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_lt(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_le(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_gt(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_ge(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_eq(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local zeroext i1 @string_ne(i8* readonly, i32, i8* readonly, i32) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_lt_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_le_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_gt_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_ge_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_eq_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: norecurse nounwind readonly uwtable
declare dso_local signext i8 @string_ne_nullable(i8* readonly, i32, i8* readonly, i32, i8 signext) local_unnamed_addr #16

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i64* @get_bin_from_k_heap_int32_t(i64*, i32, i32, i32, i1 zeroext, i1 zeroext, i1 zeroext, i32, i32) local_unnamed_addr #10

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i64* @get_bin_from_k_heap_int64_t(i64*, i32, i32, i32, i1 zeroext, i1 zeroext, i1 zeroext, i64, i64) local_unnamed_addr #10

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i64* @get_bin_from_k_heap_float(i64*, i32, i32, i32, i1 zeroext, i1 zeroext, i1 zeroext, float, float) local_unnamed_addr #10

; Function Attrs: nofree noinline norecurse nounwind uwtable
declare dso_local i64* @get_bin_from_k_heap_double(i64*, i32, i32, i32, i1 zeroext, i1 zeroext, i1 zeroext, double, double) local_unnamed_addr #10

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @char_length(i8* nocapture readnone, i32 returned) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @char_length_nullable(i8* readnone, i32, i32) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readnone uwtable
declare dso_local i32 @key_for_string_encoded(i32 returned) local_unnamed_addr #3

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local i64 @row_number_window_func(i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local double @percent_window_func(i64, i64) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local double @load_double(i64* nocapture readonly) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local float @load_float(i32* nocapture readonly) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local double @load_avg_int(i64* nocapture readonly, i64* nocapture readonly, double) local_unnamed_addr #0

; Function Attrs: alwaysinline nofree nounwind uwtable
declare dso_local double @load_avg_decimal(i64* nocapture readonly, i64* nocapture readonly, double, i32) local_unnamed_addr #20

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local double @load_avg_double(i64* nocapture readonly, i64* nocapture readonly, double) local_unnamed_addr #0

; Function Attrs: alwaysinline norecurse nounwind readonly uwtable
declare dso_local double @load_avg_float(i32* nocapture readonly, i32* nocapture readonly, double) local_unnamed_addr #0

; Function Attrs: noinline uwtable
declare dso_local void @linear_probabilistic_count(i8* nocapture, i32, i8*, i32) local_unnamed_addr #6

; Function Attrs: noinline nounwind uwtable
define internal void @query_stub_hoisted_literals(i8** readnone %0, i8* readnone %1, i64* readnone %2, i64* readnone %3, i32* readnone %4, i64* readnone %5, i64** readnone %6, i32 %7, i64* readnone %8, i32* readnone %9, i32* readnone %10) local_unnamed_addr #12 {
  %12 = icmp ne i8** %0, null
  %13 = icmp ne i8* %1, null
  %14 = or i1 %12, %13
  %15 = icmp ne i64* %2, null
  %16 = or i1 %14, %15
  %17 = icmp ne i64* %3, null
  %18 = or i1 %16, %17
  %19 = icmp ne i32* %4, null
  %20 = or i1 %18, %19
  %21 = icmp ne i64* %5, null
  %22 = or i1 %20, %21
  %23 = icmp ne i64** %6, null
  %24 = or i1 %22, %23
  %25 = icmp ne i32 %7, 0
  %26 = or i1 %24, %25
  %27 = icmp ne i32* %9, null
  %28 = or i1 %26, %27
  %29 = icmp ne i64* %8, null
  %30 = or i1 %29, %28
  %31 = icmp ne i32* %10, null
  %32 = or i1 %31, %30
  br i1 %32, label %34, label %33

33:                                               ; preds = %11
  tail call void @__assert_fail(i8* getelementptr inbounds ([159 x i8], [159 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.1, i64 0, i64 0), i32 1299, i8* getelementptr inbounds ([196 x i8], [196 x i8]* @__PRETTY_FUNCTION__.query_stub_hoisted_literals, i64 0, i64 0)) #27
  unreachable

34:                                               ; preds = %11
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @multifrag_query_hoisted_literals(i8*** readonly %0, i64* nocapture readonly %1, i8* readnone %2, i64* readnone %3, i64* readnone %4, i32* readnone %5, i32* readnone %6, i64* readnone %7, i64** readnone %8, i32* readnone %9, i32* nocapture readonly %10, i64* readnone %11) local_unnamed_addr #21 {
  %13 = load i64, i64* %1, align 8, !tbaa !9
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %28, label %15

15:                                               ; preds = %12
  %16 = icmp eq i8*** %0, null
  br i1 %16, label %17, label %29

17:                                               ; preds = %17, %15
  %18 = phi i32 [ %24, %17 ], [ 0, %15 ]
  %19 = load i32, i32* %10, align 4, !tbaa !7
  %20 = mul i32 %19, %18
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds i64, i64* %3, i64 %21
  %23 = getelementptr inbounds i64, i64* %4, i64 %21
  call void @query_group_by_template(i8** null, i8* %2, i64* %22, i64* %23, i32* %5, i64* %7, i64** %8, i32 %18, i64* %11, i32* %6, i32* %9)
  %24 = add i32 %18, 1
  %25 = zext i32 %24 to i64
  %26 = load i64, i64* %1, align 8, !tbaa !9
  %27 = icmp ugt i64 %26, %25
  br i1 %27, label %17, label %28

28:                                               ; preds = %29, %17, %12
  ret void

29:                                               ; preds = %29, %15
  %30 = phi i64 [ %40, %29 ], [ 0, %15 ]
  %31 = phi i32 [ %39, %29 ], [ 0, %15 ]
  %32 = getelementptr inbounds i8**, i8*** %0, i64 %30
  %33 = load i8**, i8*** %32, align 8, !tbaa !15
  %34 = load i32, i32* %10, align 4, !tbaa !7
  %35 = mul i32 %34, %31
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i64, i64* %3, i64 %36
  %38 = getelementptr inbounds i64, i64* %4, i64 %36
  call void @query_group_by_template(i8** %33, i8* %2, i64* %37, i64* %38, i32* %5, i64* %7, i64** %8, i32 %31, i64* %11, i32* %6, i32* %9)
  %39 = add i32 %31, 1
  %40 = zext i32 %39 to i64
  %41 = load i64, i64* %1, align 8, !tbaa !9
  %42 = icmp ugt i64 %41, %40
  br i1 %42, label %29, label %28
}

; Function Attrs: noinline nounwind uwtable
define internal void @query_stub(i8** readnone %0, i64* readnone %1, i64* readnone %2, i32* readnone %3, i64* readnone %4, i64** readnone %5, i32 %6, i64* readnone %7, i32* readnone %8, i32* readnone %9) local_unnamed_addr #12 {
  %11 = icmp ne i8** %0, null
  %12 = icmp ne i64* %1, null
  %13 = or i1 %11, %12
  %14 = icmp ne i64* %2, null
  %15 = or i1 %13, %14
  %16 = icmp ne i32* %3, null
  %17 = or i1 %15, %16
  %18 = icmp ne i64* %4, null
  %19 = or i1 %17, %18
  %20 = icmp ne i64** %5, null
  %21 = or i1 %19, %20
  %22 = icmp ne i32 %6, 0
  %23 = or i1 %21, %22
  %24 = icmp ne i32* %8, null
  %25 = or i1 %23, %24
  %26 = icmp ne i64* %7, null
  %27 = or i1 %26, %25
  %28 = icmp ne i32* %9, null
  %29 = or i1 %28, %27
  br i1 %29, label %31, label %30

30:                                               ; preds = %10
  tail call void @__assert_fail(i8* getelementptr inbounds ([147 x i8], [147 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.1, i64 0, i64 0), i32 1340, i8* getelementptr inbounds ([163 x i8], [163 x i8]* @__PRETTY_FUNCTION__.query_stub, i64 0, i64 0)) #27
  unreachable

31:                                               ; preds = %10
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @multifrag_query(i8*** readonly %0, i64* nocapture readonly %1, i64* readnone %2, i64* readnone %3, i32* readnone %4, i32* readnone %5, i64* readnone %6, i64** readnone %7, i32* readnone %8, i32* nocapture readonly %9, i64* readnone %10) local_unnamed_addr #21 {
  %12 = load i64, i64* %1, align 8, !tbaa !9
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %27, label %14

14:                                               ; preds = %11
  %15 = icmp eq i8*** %0, null
  br i1 %15, label %16, label %28

16:                                               ; preds = %16, %14
  %17 = phi i32 [ %23, %16 ], [ 0, %14 ]
  %18 = load i32, i32* %9, align 4, !tbaa !7
  %19 = mul i32 %18, %17
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i64, i64* %2, i64 %20
  %22 = getelementptr inbounds i64, i64* %3, i64 %20
  tail call void @query_stub(i8** null, i64* %21, i64* %22, i32* %4, i64* %6, i64** %7, i32 %17, i64* %10, i32* %5, i32* %8)
  %23 = add i32 %17, 1
  %24 = zext i32 %23 to i64
  %25 = load i64, i64* %1, align 8, !tbaa !9
  %26 = icmp ugt i64 %25, %24
  br i1 %26, label %16, label %27

27:                                               ; preds = %28, %16, %11
  ret void

28:                                               ; preds = %28, %14
  %29 = phi i64 [ %39, %28 ], [ 0, %14 ]
  %30 = phi i32 [ %38, %28 ], [ 0, %14 ]
  %31 = getelementptr inbounds i8**, i8*** %0, i64 %29
  %32 = load i8**, i8*** %31, align 8, !tbaa !15
  %33 = load i32, i32* %9, align 4, !tbaa !7
  %34 = mul i32 %33, %30
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i64, i64* %2, i64 %35
  %37 = getelementptr inbounds i64, i64* %3, i64 %35
  tail call void @query_stub(i8** %32, i64* %36, i64* %37, i32* %4, i64* %6, i64** %7, i32 %30, i64* %10, i32* %5, i32* %8)
  %38 = add i32 %30, 1
  %39 = zext i32 %38 to i64
  %40 = load i64, i64* %1, align 8, !tbaa !9
  %41 = icmp ugt i64 %40, %39
  br i1 %41, label %28, label %27
}

; Function Attrs: alwaysinline nofree norecurse nounwind uwtable
declare dso_local zeroext i1 @check_interrupt() local_unnamed_addr #4

; Function Attrs: nofree norecurse nounwind uwtable
declare dso_local zeroext i1 @check_interrupt_init(i32) local_unnamed_addr #22

; Function Attrs: nounwind readnone speculatable willreturn
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #18

; Function Attrs: nofree nounwind
declare dso_local double @pow(double, double) local_unnamed_addr #23

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nofree nounwind readonly
declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #24

; Function Attrs: nounwind readnone speculatable willreturn
declare <2 x double> @llvm.floor.v2f64(<2 x double>) #18

declare i32 @pos_start()

declare i32 @pos_step()

declare i32 @group_buff_idx()

declare i32 @row_process(i64*, i32*, i32*, i32*, i32*, i64*, i64, i64*, i64*, i8*)

; Function Attrs: uwtable
define void @query_group_by_template(i8** nocapture readnone %byte_stream, i8* nocapture readonly %literals, i64* nocapture readnone %row_count_ptr, i64* nocapture readonly %frag_row_off_ptr, i32* %max_matched_ptr, i64* %agg_init_val, i64** %group_by_buffers, i32 %frag_idx, i64* %join_hash_tables, i32* %total_matched, i32* %error_code) #25 {
.entry:
  %0 = getelementptr i8*, i8** %byte_stream, i32 0
  %1 = load i8*, i8** %0, align 8
  %row_count = load i64, i64* %row_count_ptr, align 8
  %2 = load i32, i32* %max_matched_ptr, align 8
  %crt_matched = alloca i32, align 4
  %old_total_matched = alloca i32, align 4
  %3 = call i32 @pos_start_impl(i32* %error_code)
  %4 = call i32 @pos_step_impl()
  %5 = call i32 @group_buff_idx_impl()
  %6 = sext i32 %3 to i64
  %7 = getelementptr i64*, i64** %group_by_buffers, i32 %5
  %col_buffer = load i64*, i64** %7, align 8
  %result_buffer = call i64* @init_shared_mem_nop(i64* %col_buffer, i32 0)
  %8 = icmp slt i64 %6, %row_count
  br i1 %8, label %.loop.preheader, label %.exit

.loop.preheader:                                  ; preds = %.entry
  %9 = sext i32 %4 to i64
  br label %.forbody

.forbody:                                         ; preds = %.forbody, %.loop.preheader
  %pos = phi i64 [ %6, %.loop.preheader ], [ %11, %.forbody ]
  %10 = call i32 @row_func(i64* %result_buffer, i32* %crt_matched, i32* %total_matched, i32* %old_total_matched, i32* %max_matched_ptr, i64* %agg_init_val, i64 %pos, i64* %frag_row_off_ptr, i64* %row_count_ptr, i8* %literals, i8* %1, i64* %join_hash_tables)
  %11 = add i64 %pos, %9
  %12 = icmp slt i64 %11, %row_count
  br i1 %12, label %.forbody, label %._crit_edge

._crit_edge:                                      ; preds = %.forbody
  br label %.exit

.exit:                                            ; preds = %._crit_edge, %.entry
  call void @write_back_nop(i64* %col_buffer, i64* %result_buffer, i32 0)
  ret void
}

; Function Attrs: alwaysinline
define i32 @row_func(i64* %group_by_buff, i32* %crt_matched, i32* %total_matched, i32* %old_total_matched, i32* %max_matched, i64* %agg_init_val, i64 %pos, i64* %frag_row_off, i64* %num_rows_per_scan, i8* %literals, i8* %col_buf0, i64* %join_hash_tables) #26 {
entry:
  br i1 true, label %filter_true, label %filter_false

filter_true:                                      ; preds = %entry
  %0 = call i64 @fixed_width_int_decode(i8* %col_buf0, i32 4, i64 %pos)
  %1 = trunc i64 %0 to i32
  %2 = sext i32 %1 to i64
  %3 = call i64* @get_group_value_fast_keyless(i64* %group_by_buff, i64 %2, i64 0, i64 0, i32 1)
  %4 = bitcast i64* %3 to i32*
  %agg_col_ptr = getelementptr i32, i32* %4, i32 0
  call void @agg_id_int32(i32* %agg_col_ptr, i32 %1)
  %5 = bitcast i64* %3 to i32*
  %agg_col_ptr1 = getelementptr i32, i32* %5, i32 1
  %6 = call i32 @agg_count_int32(i32* %agg_col_ptr1, i32 0)
  br label %filter_false

filter_false:                                     ; preds = %filter_true, %entry
  ret i32 0
}

attributes #0 = { alwaysinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { alwaysinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { alwaysinline nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { alwaysinline nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { alwaysinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nofree noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { alwaysinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { nounwind readnone speculatable willreturn }
attributes #19 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #20 = { alwaysinline nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #21 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #22 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #23 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #24 = { nofree nounwind readonly }
attributes #25 = { uwtable }
attributes #26 = { alwaysinline }
attributes #27 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.1 (git@github.com:omnisci/omniscidb-internal.git f340a7476cc962422316908270fee7e1fd5fc5fd)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !3, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !3, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !3, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"double", !3, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"any pointer", !3, i64 0}
