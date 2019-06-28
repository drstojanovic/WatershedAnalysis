; ModuleID = '../src/pgi_cublas_runtime.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-unknown"

%struct.float2 = type { float, float }
%struct.double2 = type { double, double }
%struct.cublasContext = type opaque
%struct.CUstream_st = type opaque

define  float @cuCrealf(%struct.float2* byval %x) nounwind alwaysinline {
entry:
  %x1 = getelementptr inbounds %struct.float2* %x, i32 0, i32 0
  %0 = load float* %x1, align 4
  ret float %0
}

define  float @cuCimagf(%struct.float2* byval %x) nounwind alwaysinline {
entry:
  %y = getelementptr inbounds %struct.float2* %x, i32 0, i32 1
  %0 = load float* %y, align 4
  ret float %0
}

define  void @make_cuFloatComplex(%struct.float2* noalias sret %agg.result, float %r, float %i) nounwind alwaysinline {
entry:
  %r.addr = alloca float, align 4
  %i.addr = alloca float, align 4
  %res = alloca %struct.float2, align 8
  store float %r, float* %r.addr, align 4
  store float %i, float* %i.addr, align 4
  %0 = load float* %r.addr, align 4
  %x = getelementptr inbounds %struct.float2* %res, i32 0, i32 0
  store float %0, float* %x, align 4
  %1 = load float* %i.addr, align 4
  %y = getelementptr inbounds %struct.float2* %res, i32 0, i32 1
  store float %1, float* %y, align 4
  %2 = bitcast %struct.float2* %agg.result to i8*
  %3 = bitcast %struct.float2* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define  void @cuConjf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x) nounwind alwaysinline {
entry:
  %x4 = alloca %struct.float2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %x2 = alloca %struct.float2, align 8
  %tmp = bitcast %struct.float2* %x2 to i8*
  %tmp3 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp3, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x2, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %tmp5 = bitcast %struct.float2* %x4 to i8*
  %tmp6 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 8, i32 1, i1 false)
  %y.i7 = getelementptr inbounds %struct.float2* %x4, i32 0, i32 1
  %1 = load float* %y.i7, align 4
  %sub = fsub float -0.000000e+00, %1
  store float %0, float* %r.addr.i, align 4
  store float %sub, float* %i.addr.i, align 4
  %2 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %2, float* %x.i, align 4
  %3 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %3, float* %y.i, align 4
  %4 = bitcast %struct.float2* %agg.result to i8*
  %5 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuCaddf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x, %struct.float2* byval %y) nounwind alwaysinline {
entry:
  %y15 = alloca %struct.float2, align 8
  %x11 = alloca %struct.float2, align 8
  %y7 = alloca %struct.float2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %x5 = alloca %struct.float2, align 8
  %tmp = bitcast %struct.float2* %x5 to i8*
  %tmp6 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp6, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x5, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %tmp16 = bitcast %struct.float2* %y15 to i8*
  %tmp17 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 8, i32 1, i1 false)
  %x1.i18 = getelementptr inbounds %struct.float2* %y15, i32 0, i32 0
  %1 = load float* %x1.i18, align 4
  %add = fadd float %0, %1
  %tmp12 = bitcast %struct.float2* %x11 to i8*
  %tmp13 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 8, i32 1, i1 false)
  %y.i14 = getelementptr inbounds %struct.float2* %x11, i32 0, i32 1
  %2 = load float* %y.i14, align 4
  %tmp8 = bitcast %struct.float2* %y7 to i8*
  %tmp9 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 8, i32 1, i1 false)
  %y.i10 = getelementptr inbounds %struct.float2* %y7, i32 0, i32 1
  %3 = load float* %y.i10, align 4
  %add4 = fadd float %2, %3
  store float %add, float* %r.addr.i, align 4
  store float %add4, float* %i.addr.i, align 4
  %4 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %4, float* %x.i, align 4
  %5 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %5, float* %y.i, align 4
  %6 = bitcast %struct.float2* %agg.result to i8*
  %7 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuCsubf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x, %struct.float2* byval %y) nounwind alwaysinline {
entry:
  %y15 = alloca %struct.float2, align 8
  %x11 = alloca %struct.float2, align 8
  %y7 = alloca %struct.float2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %x5 = alloca %struct.float2, align 8
  %tmp = bitcast %struct.float2* %x5 to i8*
  %tmp6 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp6, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x5, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %tmp16 = bitcast %struct.float2* %y15 to i8*
  %tmp17 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 8, i32 1, i1 false)
  %x1.i18 = getelementptr inbounds %struct.float2* %y15, i32 0, i32 0
  %1 = load float* %x1.i18, align 4
  %sub = fsub float %0, %1
  %tmp12 = bitcast %struct.float2* %x11 to i8*
  %tmp13 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 8, i32 1, i1 false)
  %y.i14 = getelementptr inbounds %struct.float2* %x11, i32 0, i32 1
  %2 = load float* %y.i14, align 4
  %tmp8 = bitcast %struct.float2* %y7 to i8*
  %tmp9 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 8, i32 1, i1 false)
  %y.i10 = getelementptr inbounds %struct.float2* %y7, i32 0, i32 1
  %3 = load float* %y.i10, align 4
  %sub4 = fsub float %2, %3
  store float %sub, float* %r.addr.i, align 4
  store float %sub4, float* %i.addr.i, align 4
  %4 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %4, float* %x.i, align 4
  %5 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %5, float* %y.i, align 4
  %6 = bitcast %struct.float2* %agg.result to i8*
  %7 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuCmulf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x, %struct.float2* byval %y) nounwind alwaysinline {
entry:
  %y38 = alloca %struct.float2, align 8
  %x34 = alloca %struct.float2, align 8
  %y30 = alloca %struct.float2, align 8
  %x26 = alloca %struct.float2, align 8
  %y22 = alloca %struct.float2, align 8
  %x18 = alloca %struct.float2, align 8
  %y14 = alloca %struct.float2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %x11 = alloca %struct.float2, align 8
  %prod = alloca %struct.float2, align 8
  %tmp = alloca %struct.float2, align 8
  %tmp12 = bitcast %struct.float2* %x11 to i8*
  %tmp13 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x11, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %tmp39 = bitcast %struct.float2* %y38 to i8*
  %tmp40 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp39, i8* %tmp40, i64 8, i32 1, i1 false)
  %x1.i41 = getelementptr inbounds %struct.float2* %y38, i32 0, i32 0
  %1 = load float* %x1.i41, align 4
  %mul = fmul float %0, %1
  %tmp35 = bitcast %struct.float2* %x34 to i8*
  %tmp36 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp35, i8* %tmp36, i64 8, i32 1, i1 false)
  %y.i37 = getelementptr inbounds %struct.float2* %x34, i32 0, i32 1
  %2 = load float* %y.i37, align 4
  %tmp31 = bitcast %struct.float2* %y30 to i8*
  %tmp32 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp31, i8* %tmp32, i64 8, i32 1, i1 false)
  %y.i33 = getelementptr inbounds %struct.float2* %y30, i32 0, i32 1
  %3 = load float* %y.i33, align 4
  %mul4 = fmul float %2, %3
  %sub = fsub float %mul, %mul4
  %tmp27 = bitcast %struct.float2* %x26 to i8*
  %tmp28 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp27, i8* %tmp28, i64 8, i32 1, i1 false)
  %x1.i29 = getelementptr inbounds %struct.float2* %x26, i32 0, i32 0
  %4 = load float* %x1.i29, align 4
  %tmp23 = bitcast %struct.float2* %y22 to i8*
  %tmp24 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 8, i32 1, i1 false)
  %y.i25 = getelementptr inbounds %struct.float2* %y22, i32 0, i32 1
  %5 = load float* %y.i25, align 4
  %mul7 = fmul float %4, %5
  %tmp19 = bitcast %struct.float2* %x18 to i8*
  %tmp20 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp19, i8* %tmp20, i64 8, i32 1, i1 false)
  %y.i21 = getelementptr inbounds %struct.float2* %x18, i32 0, i32 1
  %6 = load float* %y.i21, align 4
  %tmp15 = bitcast %struct.float2* %y14 to i8*
  %tmp16 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp15, i8* %tmp16, i64 8, i32 1, i1 false)
  %x1.i17 = getelementptr inbounds %struct.float2* %y14, i32 0, i32 0
  %7 = load float* %x1.i17, align 4
  %mul10 = fmul float %6, %7
  %add = fadd float %mul7, %mul10
  store float %sub, float* %r.addr.i, align 4
  store float %add, float* %i.addr.i, align 4
  %8 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %8, float* %x.i, align 4
  %9 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %9, float* %y.i, align 4
  %10 = bitcast %struct.float2* %tmp to i8*
  %11 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 8, i32 8, i1 false) nounwind
  %12 = bitcast %struct.float2* %prod to i8*
  %13 = bitcast %struct.float2* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 8, i1 false)
  %14 = bitcast %struct.float2* %agg.result to i8*
  %15 = bitcast %struct.float2* %prod to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 8, i32 8, i1 false)
  ret void
}

define  void @cuCdivf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x, %struct.float2* byval %y) nounwind alwaysinline {
entry:
  %y41 = alloca %struct.float2, align 8
  %x37 = alloca %struct.float2, align 8
  %x33 = alloca %struct.float2, align 8
  %y29 = alloca %struct.float2, align 8
  %y25 = alloca %struct.float2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %y22 = alloca %struct.float2, align 8
  %quot = alloca %struct.float2, align 8
  %s = alloca float, align 4
  %oos = alloca float, align 4
  %ars = alloca float, align 4
  %ais = alloca float, align 4
  %brs = alloca float, align 4
  %bis = alloca float, align 4
  %tmp = alloca %struct.float2, align 8
  %tmp23 = bitcast %struct.float2* %y22 to i8*
  %tmp24 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %y22, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %call1 = call  float @fabsf(float %0) nounwind readnone
  %tmp42 = bitcast %struct.float2* %y41 to i8*
  %tmp43 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp42, i8* %tmp43, i64 8, i32 1, i1 false)
  %y.i44 = getelementptr inbounds %struct.float2* %y41, i32 0, i32 1
  %1 = load float* %y.i44, align 4
  %call3 = call  float @fabsf(float %1) nounwind readnone
  %add = fadd float %call1, %call3
  store float %add, float* %s, align 4
  %2 = load float* %s, align 4
  %div = fdiv float 1.000000e+00, %2
  store float %div, float* %oos, align 4
  %tmp38 = bitcast %struct.float2* %x37 to i8*
  %tmp39 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp38, i8* %tmp39, i64 8, i32 1, i1 false)
  %x1.i40 = getelementptr inbounds %struct.float2* %x37, i32 0, i32 0
  %3 = load float* %x1.i40, align 4
  %4 = load float* %oos, align 4
  %mul = fmul float %3, %4
  store float %mul, float* %ars, align 4
  %tmp34 = bitcast %struct.float2* %x33 to i8*
  %tmp35 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp34, i8* %tmp35, i64 8, i32 1, i1 false)
  %y.i36 = getelementptr inbounds %struct.float2* %x33, i32 0, i32 1
  %5 = load float* %y.i36, align 4
  %6 = load float* %oos, align 4
  %mul6 = fmul float %5, %6
  store float %mul6, float* %ais, align 4
  %tmp30 = bitcast %struct.float2* %y29 to i8*
  %tmp31 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp30, i8* %tmp31, i64 8, i32 1, i1 false)
  %x1.i32 = getelementptr inbounds %struct.float2* %y29, i32 0, i32 0
  %7 = load float* %x1.i32, align 4
  %8 = load float* %oos, align 4
  %mul8 = fmul float %7, %8
  store float %mul8, float* %brs, align 4
  %tmp26 = bitcast %struct.float2* %y25 to i8*
  %tmp27 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 8, i32 1, i1 false)
  %y.i28 = getelementptr inbounds %struct.float2* %y25, i32 0, i32 1
  %9 = load float* %y.i28, align 4
  %10 = load float* %oos, align 4
  %mul10 = fmul float %9, %10
  store float %mul10, float* %bis, align 4
  %11 = load float* %brs, align 4
  %12 = load float* %brs, align 4
  %mul11 = fmul float %11, %12
  %13 = load float* %bis, align 4
  %14 = load float* %bis, align 4
  %mul12 = fmul float %13, %14
  %add13 = fadd float %mul11, %mul12
  store float %add13, float* %s, align 4
  %15 = load float* %s, align 4
  %div14 = fdiv float 1.000000e+00, %15
  store float %div14, float* %oos, align 4
  %16 = load float* %ars, align 4
  %17 = load float* %brs, align 4
  %mul15 = fmul float %16, %17
  %18 = load float* %ais, align 4
  %19 = load float* %bis, align 4
  %mul16 = fmul float %18, %19
  %add17 = fadd float %mul15, %mul16
  %20 = load float* %oos, align 4
  %mul18 = fmul float %add17, %20
  %21 = load float* %ais, align 4
  %22 = load float* %brs, align 4
  %mul19 = fmul float %21, %22
  %23 = load float* %ars, align 4
  %24 = load float* %bis, align 4
  %mul20 = fmul float %23, %24
  %sub = fsub float %mul19, %mul20
  %25 = load float* %oos, align 4
  %mul21 = fmul float %sub, %25
  store float %mul18, float* %r.addr.i, align 4
  store float %mul21, float* %i.addr.i, align 4
  %26 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %26, float* %x.i, align 4
  %27 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %27, float* %y.i, align 4
  %28 = bitcast %struct.float2* %tmp to i8*
  %29 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 8, i32 8, i1 false) nounwind
  %30 = bitcast %struct.float2* %quot to i8*
  %31 = bitcast %struct.float2* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 8, i32 8, i1 false)
  %32 = bitcast %struct.float2* %agg.result to i8*
  %33 = bitcast %struct.float2* %quot to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 8, i32 8, i1 false)
  ret void
}

declare  float @fabsf(float) nounwind readnone

define  float @cuCabsf(%struct.float2* byval %x) nounwind alwaysinline {
entry:
  %x15 = alloca %struct.float2, align 8
  %x13 = alloca %struct.float2, align 8
  %a = alloca float, align 4
  %b = alloca float, align 4
  %v = alloca float, align 4
  %w = alloca float, align 4
  %t = alloca float, align 4
  %tmp = bitcast %struct.float2* %x13 to i8*
  %tmp14 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp14, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x13, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  store float %0, float* %a, align 4
  %tmp16 = bitcast %struct.float2* %x15 to i8*
  %tmp17 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 8, i32 1, i1 false)
  %y.i = getelementptr inbounds %struct.float2* %x15, i32 0, i32 1
  %1 = load float* %y.i, align 4
  store float %1, float* %b, align 4
  %2 = load float* %a, align 4
  %call2 = call  float @fabsf(float %2) nounwind readnone
  store float %call2, float* %a, align 4
  %3 = load float* %b, align 4
  %call3 = call  float @fabsf(float %3) nounwind readnone
  store float %call3, float* %b, align 4
  %4 = load float* %a, align 4
  %5 = load float* %b, align 4
  %cmp = fcmp ogt float %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load float* %a, align 4
  store float %6, float* %v, align 4
  %7 = load float* %b, align 4
  store float %7, float* %w, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %8 = load float* %b, align 4
  store float %8, float* %v, align 4
  %9 = load float* %a, align 4
  store float %9, float* %w, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load float* %w, align 4
  %11 = load float* %v, align 4
  %div = fdiv float %10, %11
  store float %div, float* %t, align 4
  %12 = load float* %t, align 4
  %13 = load float* %t, align 4
  %mul = fmul float %12, %13
  %add = fadd float 1.000000e+00, %mul
  store float %add, float* %t, align 4
  %14 = load float* %v, align 4
  %15 = load float* %t, align 4
  %call4 = call  float @sqrtf(float %15) nounwind
  %mul5 = fmul float %14, %call4
  store float %mul5, float* %t, align 4
  %16 = load float* %v, align 4
  %cmp6 = fcmp oeq float %16, 0.000000e+00
  br i1 %cmp6, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %17 = load float* %v, align 4
  %cmp7 = fcmp ogt float %17, 0x47EFFFFFE0000000
  br i1 %cmp7, label %if.then10, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %18 = load float* %w, align 4
  %cmp9 = fcmp ogt float %18, 0x47EFFFFFE0000000
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %lor.lhs.false8, %lor.lhs.false, %if.end
  %19 = load float* %v, align 4
  %20 = load float* %w, align 4
  %add11 = fadd float %19, %20
  store float %add11, float* %t, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %lor.lhs.false8
  %21 = load float* %t, align 4
  ret float %21
}

declare  float @sqrtf(float) nounwind

define  double @cuCreal(%struct.double2* byval %x) nounwind alwaysinline {
entry:
  %x1 = getelementptr inbounds %struct.double2* %x, i32 0, i32 0
  %0 = load double* %x1, align 8
  ret double %0
}

define  double @cuCimag(%struct.double2* byval %x) nounwind alwaysinline {
entry:
  %y = getelementptr inbounds %struct.double2* %x, i32 0, i32 1
  %0 = load double* %y, align 8
  ret double %0
}

define  void @make_cuDoubleComplex(%struct.double2* noalias sret %agg.result, double %r, double %i) nounwind alwaysinline {
entry:
  %r.addr = alloca double, align 8
  %i.addr = alloca double, align 8
  %res = alloca %struct.double2, align 16
  store double %r, double* %r.addr, align 8
  store double %i, double* %i.addr, align 8
  %0 = load double* %r.addr, align 8
  %x = getelementptr inbounds %struct.double2* %res, i32 0, i32 0
  store double %0, double* %x, align 8
  %1 = load double* %i.addr, align 8
  %y = getelementptr inbounds %struct.double2* %res, i32 0, i32 1
  store double %1, double* %y, align 8
  %2 = bitcast %struct.double2* %agg.result to i8*
  %3 = bitcast %struct.double2* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 16, i32 16, i1 false)
  ret void
}

define  void @cuConj(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x) nounwind alwaysinline {
entry:
  %x4 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %x2 = alloca %struct.double2, align 8
  %tmp = bitcast %struct.double2* %x2 to i8*
  %tmp3 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp3, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x2, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %tmp5 = bitcast %struct.double2* %x4 to i8*
  %tmp6 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 16, i32 1, i1 false)
  %y.i7 = getelementptr inbounds %struct.double2* %x4, i32 0, i32 1
  %1 = load double* %y.i7, align 8
  %sub = fsub double -0.000000e+00, %1
  store double %0, double* %r.addr.i, align 8
  store double %sub, double* %i.addr.i, align 8
  %2 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %2, double* %x.i, align 8
  %3 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %3, double* %y.i, align 8
  %4 = bitcast %struct.double2* %agg.result to i8*
  %5 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 16, i32 16, i1 false) nounwind
  ret void
}

define  void @cuCadd(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x, %struct.double2* byval %y) nounwind alwaysinline {
entry:
  %y15 = alloca %struct.double2, align 8
  %x11 = alloca %struct.double2, align 8
  %y7 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %x5 = alloca %struct.double2, align 8
  %tmp = bitcast %struct.double2* %x5 to i8*
  %tmp6 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp6, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x5, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %tmp16 = bitcast %struct.double2* %y15 to i8*
  %tmp17 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 16, i32 1, i1 false)
  %x1.i18 = getelementptr inbounds %struct.double2* %y15, i32 0, i32 0
  %1 = load double* %x1.i18, align 8
  %add = fadd double %0, %1
  %tmp12 = bitcast %struct.double2* %x11 to i8*
  %tmp13 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 16, i32 1, i1 false)
  %y.i14 = getelementptr inbounds %struct.double2* %x11, i32 0, i32 1
  %2 = load double* %y.i14, align 8
  %tmp8 = bitcast %struct.double2* %y7 to i8*
  %tmp9 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 16, i32 1, i1 false)
  %y.i10 = getelementptr inbounds %struct.double2* %y7, i32 0, i32 1
  %3 = load double* %y.i10, align 8
  %add4 = fadd double %2, %3
  store double %add, double* %r.addr.i, align 8
  store double %add4, double* %i.addr.i, align 8
  %4 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %4, double* %x.i, align 8
  %5 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %5, double* %y.i, align 8
  %6 = bitcast %struct.double2* %agg.result to i8*
  %7 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 16, i32 16, i1 false) nounwind
  ret void
}

define  void @cuCsub(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x, %struct.double2* byval %y) nounwind alwaysinline {
entry:
  %y15 = alloca %struct.double2, align 8
  %x11 = alloca %struct.double2, align 8
  %y7 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %x5 = alloca %struct.double2, align 8
  %tmp = bitcast %struct.double2* %x5 to i8*
  %tmp6 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp6, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x5, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %tmp16 = bitcast %struct.double2* %y15 to i8*
  %tmp17 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 16, i32 1, i1 false)
  %x1.i18 = getelementptr inbounds %struct.double2* %y15, i32 0, i32 0
  %1 = load double* %x1.i18, align 8
  %sub = fsub double %0, %1
  %tmp12 = bitcast %struct.double2* %x11 to i8*
  %tmp13 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 16, i32 1, i1 false)
  %y.i14 = getelementptr inbounds %struct.double2* %x11, i32 0, i32 1
  %2 = load double* %y.i14, align 8
  %tmp8 = bitcast %struct.double2* %y7 to i8*
  %tmp9 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp8, i8* %tmp9, i64 16, i32 1, i1 false)
  %y.i10 = getelementptr inbounds %struct.double2* %y7, i32 0, i32 1
  %3 = load double* %y.i10, align 8
  %sub4 = fsub double %2, %3
  store double %sub, double* %r.addr.i, align 8
  store double %sub4, double* %i.addr.i, align 8
  %4 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %4, double* %x.i, align 8
  %5 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %5, double* %y.i, align 8
  %6 = bitcast %struct.double2* %agg.result to i8*
  %7 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 16, i32 16, i1 false) nounwind
  ret void
}

define  void @cuCmul(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x, %struct.double2* byval %y) nounwind alwaysinline {
entry:
  %y38 = alloca %struct.double2, align 8
  %x34 = alloca %struct.double2, align 8
  %y30 = alloca %struct.double2, align 8
  %x26 = alloca %struct.double2, align 8
  %y22 = alloca %struct.double2, align 8
  %x18 = alloca %struct.double2, align 8
  %y14 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %x11 = alloca %struct.double2, align 8
  %prod = alloca %struct.double2, align 16
  %tmp = alloca %struct.double2, align 16
  %tmp12 = bitcast %struct.double2* %x11 to i8*
  %tmp13 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp12, i8* %tmp13, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x11, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %tmp39 = bitcast %struct.double2* %y38 to i8*
  %tmp40 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp39, i8* %tmp40, i64 16, i32 1, i1 false)
  %x1.i41 = getelementptr inbounds %struct.double2* %y38, i32 0, i32 0
  %1 = load double* %x1.i41, align 8
  %mul = fmul double %0, %1
  %tmp35 = bitcast %struct.double2* %x34 to i8*
  %tmp36 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp35, i8* %tmp36, i64 16, i32 1, i1 false)
  %y.i37 = getelementptr inbounds %struct.double2* %x34, i32 0, i32 1
  %2 = load double* %y.i37, align 8
  %tmp31 = bitcast %struct.double2* %y30 to i8*
  %tmp32 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp31, i8* %tmp32, i64 16, i32 1, i1 false)
  %y.i33 = getelementptr inbounds %struct.double2* %y30, i32 0, i32 1
  %3 = load double* %y.i33, align 8
  %mul4 = fmul double %2, %3
  %sub = fsub double %mul, %mul4
  %tmp27 = bitcast %struct.double2* %x26 to i8*
  %tmp28 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp27, i8* %tmp28, i64 16, i32 1, i1 false)
  %x1.i29 = getelementptr inbounds %struct.double2* %x26, i32 0, i32 0
  %4 = load double* %x1.i29, align 8
  %tmp23 = bitcast %struct.double2* %y22 to i8*
  %tmp24 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 16, i32 1, i1 false)
  %y.i25 = getelementptr inbounds %struct.double2* %y22, i32 0, i32 1
  %5 = load double* %y.i25, align 8
  %mul7 = fmul double %4, %5
  %tmp19 = bitcast %struct.double2* %x18 to i8*
  %tmp20 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp19, i8* %tmp20, i64 16, i32 1, i1 false)
  %y.i21 = getelementptr inbounds %struct.double2* %x18, i32 0, i32 1
  %6 = load double* %y.i21, align 8
  %tmp15 = bitcast %struct.double2* %y14 to i8*
  %tmp16 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp15, i8* %tmp16, i64 16, i32 1, i1 false)
  %x1.i17 = getelementptr inbounds %struct.double2* %y14, i32 0, i32 0
  %7 = load double* %x1.i17, align 8
  %mul10 = fmul double %6, %7
  %add = fadd double %mul7, %mul10
  store double %sub, double* %r.addr.i, align 8
  store double %add, double* %i.addr.i, align 8
  %8 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %8, double* %x.i, align 8
  %9 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %9, double* %y.i, align 8
  %10 = bitcast %struct.double2* %tmp to i8*
  %11 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 16, i1 false) nounwind
  %12 = bitcast %struct.double2* %prod to i8*
  %13 = bitcast %struct.double2* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 16, i32 16, i1 false)
  %14 = bitcast %struct.double2* %agg.result to i8*
  %15 = bitcast %struct.double2* %prod to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 16, i32 16, i1 false)
  ret void
}

define  void @cuCdiv(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x, %struct.double2* byval %y) nounwind alwaysinline {
entry:
  %y41 = alloca %struct.double2, align 8
  %x37 = alloca %struct.double2, align 8
  %x33 = alloca %struct.double2, align 8
  %y29 = alloca %struct.double2, align 8
  %y25 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %y22 = alloca %struct.double2, align 8
  %quot = alloca %struct.double2, align 16
  %s = alloca double, align 8
  %oos = alloca double, align 8
  %ars = alloca double, align 8
  %ais = alloca double, align 8
  %brs = alloca double, align 8
  %bis = alloca double, align 8
  %tmp = alloca %struct.double2, align 16
  %tmp23 = bitcast %struct.double2* %y22 to i8*
  %tmp24 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %y22, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %call1 = call  double @fabs(double %0) nounwind readnone
  %tmp42 = bitcast %struct.double2* %y41 to i8*
  %tmp43 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp42, i8* %tmp43, i64 16, i32 1, i1 false)
  %y.i44 = getelementptr inbounds %struct.double2* %y41, i32 0, i32 1
  %1 = load double* %y.i44, align 8
  %call3 = call  double @fabs(double %1) nounwind readnone
  %add = fadd double %call1, %call3
  store double %add, double* %s, align 8
  %2 = load double* %s, align 8
  %div = fdiv double 1.000000e+00, %2
  store double %div, double* %oos, align 8
  %tmp38 = bitcast %struct.double2* %x37 to i8*
  %tmp39 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp38, i8* %tmp39, i64 16, i32 1, i1 false)
  %x1.i40 = getelementptr inbounds %struct.double2* %x37, i32 0, i32 0
  %3 = load double* %x1.i40, align 8
  %4 = load double* %oos, align 8
  %mul = fmul double %3, %4
  store double %mul, double* %ars, align 8
  %tmp34 = bitcast %struct.double2* %x33 to i8*
  %tmp35 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp34, i8* %tmp35, i64 16, i32 1, i1 false)
  %y.i36 = getelementptr inbounds %struct.double2* %x33, i32 0, i32 1
  %5 = load double* %y.i36, align 8
  %6 = load double* %oos, align 8
  %mul6 = fmul double %5, %6
  store double %mul6, double* %ais, align 8
  %tmp30 = bitcast %struct.double2* %y29 to i8*
  %tmp31 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp30, i8* %tmp31, i64 16, i32 1, i1 false)
  %x1.i32 = getelementptr inbounds %struct.double2* %y29, i32 0, i32 0
  %7 = load double* %x1.i32, align 8
  %8 = load double* %oos, align 8
  %mul8 = fmul double %7, %8
  store double %mul8, double* %brs, align 8
  %tmp26 = bitcast %struct.double2* %y25 to i8*
  %tmp27 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 16, i32 1, i1 false)
  %y.i28 = getelementptr inbounds %struct.double2* %y25, i32 0, i32 1
  %9 = load double* %y.i28, align 8
  %10 = load double* %oos, align 8
  %mul10 = fmul double %9, %10
  store double %mul10, double* %bis, align 8
  %11 = load double* %brs, align 8
  %12 = load double* %brs, align 8
  %mul11 = fmul double %11, %12
  %13 = load double* %bis, align 8
  %14 = load double* %bis, align 8
  %mul12 = fmul double %13, %14
  %add13 = fadd double %mul11, %mul12
  store double %add13, double* %s, align 8
  %15 = load double* %s, align 8
  %div14 = fdiv double 1.000000e+00, %15
  store double %div14, double* %oos, align 8
  %16 = load double* %ars, align 8
  %17 = load double* %brs, align 8
  %mul15 = fmul double %16, %17
  %18 = load double* %ais, align 8
  %19 = load double* %bis, align 8
  %mul16 = fmul double %18, %19
  %add17 = fadd double %mul15, %mul16
  %20 = load double* %oos, align 8
  %mul18 = fmul double %add17, %20
  %21 = load double* %ais, align 8
  %22 = load double* %brs, align 8
  %mul19 = fmul double %21, %22
  %23 = load double* %ars, align 8
  %24 = load double* %bis, align 8
  %mul20 = fmul double %23, %24
  %sub = fsub double %mul19, %mul20
  %25 = load double* %oos, align 8
  %mul21 = fmul double %sub, %25
  store double %mul18, double* %r.addr.i, align 8
  store double %mul21, double* %i.addr.i, align 8
  %26 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %26, double* %x.i, align 8
  %27 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %27, double* %y.i, align 8
  %28 = bitcast %struct.double2* %tmp to i8*
  %29 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 16, i32 16, i1 false) nounwind
  %30 = bitcast %struct.double2* %quot to i8*
  %31 = bitcast %struct.double2* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 16, i32 16, i1 false)
  %32 = bitcast %struct.double2* %agg.result to i8*
  %33 = bitcast %struct.double2* %quot to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 16, i32 16, i1 false)
  ret void
}

declare  double @fabs(double) nounwind readnone

define  double @cuCabs(%struct.double2* byval %x) nounwind alwaysinline {
entry:
  %x15 = alloca %struct.double2, align 8
  %x13 = alloca %struct.double2, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %v = alloca double, align 8
  %w = alloca double, align 8
  %t = alloca double, align 8
  %tmp = bitcast %struct.double2* %x13 to i8*
  %tmp14 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp14, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x13, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  store double %0, double* %a, align 8
  %tmp16 = bitcast %struct.double2* %x15 to i8*
  %tmp17 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp16, i8* %tmp17, i64 16, i32 1, i1 false)
  %y.i = getelementptr inbounds %struct.double2* %x15, i32 0, i32 1
  %1 = load double* %y.i, align 8
  store double %1, double* %b, align 8
  %2 = load double* %a, align 8
  %call2 = call  double @fabs(double %2) nounwind readnone
  store double %call2, double* %a, align 8
  %3 = load double* %b, align 8
  %call3 = call  double @fabs(double %3) nounwind readnone
  store double %call3, double* %b, align 8
  %4 = load double* %a, align 8
  %5 = load double* %b, align 8
  %cmp = fcmp ogt double %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load double* %a, align 8
  store double %6, double* %v, align 8
  %7 = load double* %b, align 8
  store double %7, double* %w, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %8 = load double* %b, align 8
  store double %8, double* %v, align 8
  %9 = load double* %a, align 8
  store double %9, double* %w, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %10 = load double* %w, align 8
  %11 = load double* %v, align 8
  %div = fdiv double %10, %11
  store double %div, double* %t, align 8
  %12 = load double* %t, align 8
  %13 = load double* %t, align 8
  %mul = fmul double %12, %13
  %add = fadd double 1.000000e+00, %mul
  store double %add, double* %t, align 8
  %14 = load double* %v, align 8
  %15 = load double* %t, align 8
  %call4 = call  double @sqrt(double %15) nounwind
  %mul5 = fmul double %14, %call4
  store double %mul5, double* %t, align 8
  %16 = load double* %v, align 8
  %cmp6 = fcmp oeq double %16, 0.000000e+00
  br i1 %cmp6, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %17 = load double* %v, align 8
  %cmp7 = fcmp ogt double %17, 0x7FEFFFFFFFFFFFFF
  br i1 %cmp7, label %if.then10, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %18 = load double* %w, align 8
  %cmp9 = fcmp ogt double %18, 0x7FEFFFFFFFFFFFFF
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %lor.lhs.false8, %lor.lhs.false, %if.end
  %19 = load double* %v, align 8
  %20 = load double* %w, align 8
  %add11 = fadd double %19, %20
  store double %add11, double* %t, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %lor.lhs.false8
  %21 = load double* %t, align 8
  ret double %21
}

declare  double @sqrt(double) nounwind

define  void @make_cuComplex(%struct.float2* noalias sret %agg.result, float %x, float %y) nounwind alwaysinline {
entry:
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float %y, float* %y.addr, align 4
  %0 = load float* %x.addr, align 4
  %1 = load float* %y.addr, align 4
  store float %0, float* %r.addr.i, align 4
  store float %1, float* %i.addr.i, align 4
  %2 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %2, float* %x.i, align 4
  %3 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %3, float* %y.i, align 4
  %4 = bitcast %struct.float2* %agg.result to i8*
  %5 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuComplexFloatToDouble(%struct.double2* noalias sret %agg.result, %struct.float2* byval %c) nounwind alwaysinline {
entry:
  %c5 = alloca %struct.float2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %c3 = alloca %struct.float2, align 8
  %tmp = bitcast %struct.float2* %c3 to i8*
  %tmp4 = bitcast %struct.float2* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp4, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %c3, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %conv = fpext float %0 to double
  %tmp6 = bitcast %struct.float2* %c5 to i8*
  %tmp7 = bitcast %struct.float2* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 8, i32 1, i1 false)
  %y.i8 = getelementptr inbounds %struct.float2* %c5, i32 0, i32 1
  %1 = load float* %y.i8, align 4
  %conv2 = fpext float %1 to double
  store double %conv, double* %r.addr.i, align 8
  store double %conv2, double* %i.addr.i, align 8
  %2 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %2, double* %x.i, align 8
  %3 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %3, double* %y.i, align 8
  %4 = bitcast %struct.double2* %agg.result to i8*
  %5 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 16, i32 16, i1 false) nounwind
  ret void
}

define  void @cuComplexDoubleToFloat(%struct.float2* noalias sret %agg.result, %struct.double2* byval %c) nounwind alwaysinline {
entry:
  %c5 = alloca %struct.double2, align 8
  %r.addr.i = alloca float, align 4
  %i.addr.i = alloca float, align 4
  %res.i = alloca %struct.float2, align 8
  %c3 = alloca %struct.double2, align 8
  %tmp = bitcast %struct.double2* %c3 to i8*
  %tmp4 = bitcast %struct.double2* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp4, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %c3, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %conv = fptrunc double %0 to float
  %tmp6 = bitcast %struct.double2* %c5 to i8*
  %tmp7 = bitcast %struct.double2* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 16, i32 1, i1 false)
  %y.i8 = getelementptr inbounds %struct.double2* %c5, i32 0, i32 1
  %1 = load double* %y.i8, align 8
  %conv2 = fptrunc double %1 to float
  store float %conv, float* %r.addr.i, align 4
  store float %conv2, float* %i.addr.i, align 4
  %2 = load float* %r.addr.i, align 4
  %x.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 0
  store float %2, float* %x.i, align 4
  %3 = load float* %i.addr.i, align 4
  %y.i = getelementptr inbounds %struct.float2* %res.i, i32 0, i32 1
  store float %3, float* %y.i, align 4
  %4 = bitcast %struct.float2* %agg.result to i8*
  %5 = bitcast %struct.float2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuCfmaf(%struct.float2* noalias sret %agg.result, %struct.float2* byval %x, %struct.float2* byval %y, %struct.float2* byval %d) nounwind alwaysinline {
entry:
  %y49 = alloca %struct.float2, align 8
  %d45 = alloca %struct.float2, align 8
  %x41 = alloca %struct.float2, align 8
  %y37 = alloca %struct.float2, align 8
  %d33 = alloca %struct.float2, align 8
  %x29 = alloca %struct.float2, align 8
  %y25 = alloca %struct.float2, align 8
  %x22 = alloca %struct.float2, align 8
  %y18 = alloca %struct.float2, align 8
  %r.addr.i.i = alloca float, align 4
  %i.addr.i.i = alloca float, align 4
  %res.i.i = alloca %struct.float2, align 8
  %x.addr.i = alloca float, align 4
  %y.addr.i = alloca float, align 4
  %x16 = alloca %struct.float2, align 8
  %real_res = alloca float, align 4
  %imag_res = alloca float, align 4
  %tmp = bitcast %struct.float2* %x16 to i8*
  %tmp17 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp17, i64 8, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.float2* %x16, i32 0, i32 0
  %0 = load float* %x1.i, align 4
  %tmp50 = bitcast %struct.float2* %y49 to i8*
  %tmp51 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp50, i8* %tmp51, i64 8, i32 1, i1 false)
  %x1.i52 = getelementptr inbounds %struct.float2* %y49, i32 0, i32 0
  %1 = load float* %x1.i52, align 4
  %mul = fmul float %0, %1
  %tmp46 = bitcast %struct.float2* %d45 to i8*
  %tmp47 = bitcast %struct.float2* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp46, i8* %tmp47, i64 8, i32 1, i1 false)
  %x1.i48 = getelementptr inbounds %struct.float2* %d45, i32 0, i32 0
  %2 = load float* %x1.i48, align 4
  %add = fadd float %mul, %2
  store float %add, float* %real_res, align 4
  %tmp42 = bitcast %struct.float2* %x41 to i8*
  %tmp43 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp42, i8* %tmp43, i64 8, i32 1, i1 false)
  %x1.i44 = getelementptr inbounds %struct.float2* %x41, i32 0, i32 0
  %3 = load float* %x1.i44, align 4
  %tmp38 = bitcast %struct.float2* %y37 to i8*
  %tmp39 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp38, i8* %tmp39, i64 8, i32 1, i1 false)
  %y.i40 = getelementptr inbounds %struct.float2* %y37, i32 0, i32 1
  %4 = load float* %y.i40, align 4
  %mul5 = fmul float %3, %4
  %tmp34 = bitcast %struct.float2* %d33 to i8*
  %tmp35 = bitcast %struct.float2* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp34, i8* %tmp35, i64 8, i32 1, i1 false)
  %y.i36 = getelementptr inbounds %struct.float2* %d33, i32 0, i32 1
  %5 = load float* %y.i36, align 4
  %add7 = fadd float %mul5, %5
  store float %add7, float* %imag_res, align 4
  %tmp30 = bitcast %struct.float2* %x29 to i8*
  %tmp31 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp30, i8* %tmp31, i64 8, i32 1, i1 false)
  %y.i32 = getelementptr inbounds %struct.float2* %x29, i32 0, i32 1
  %6 = load float* %y.i32, align 4
  %tmp26 = bitcast %struct.float2* %y25 to i8*
  %tmp27 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 8, i32 1, i1 false)
  %y.i28 = getelementptr inbounds %struct.float2* %y25, i32 0, i32 1
  %7 = load float* %y.i28, align 4
  %mul10 = fmul float %6, %7
  %sub = fsub float -0.000000e+00, %mul10
  %8 = load float* %real_res, align 4
  %add11 = fadd float %sub, %8
  store float %add11, float* %real_res, align 4
  %tmp23 = bitcast %struct.float2* %x22 to i8*
  %tmp24 = bitcast %struct.float2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 8, i32 1, i1 false)
  %y.i = getelementptr inbounds %struct.float2* %x22, i32 0, i32 1
  %9 = load float* %y.i, align 4
  %tmp19 = bitcast %struct.float2* %y18 to i8*
  %tmp20 = bitcast %struct.float2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp19, i8* %tmp20, i64 8, i32 1, i1 false)
  %x1.i21 = getelementptr inbounds %struct.float2* %y18, i32 0, i32 0
  %10 = load float* %x1.i21, align 4
  %mul14 = fmul float %9, %10
  %11 = load float* %imag_res, align 4
  %add15 = fadd float %mul14, %11
  store float %add15, float* %imag_res, align 4
  %12 = load float* %real_res, align 4
  %13 = load float* %imag_res, align 4
  store float %12, float* %x.addr.i, align 4
  store float %13, float* %y.addr.i, align 4
  %14 = load float* %x.addr.i, align 4
  %15 = load float* %y.addr.i, align 4
  store float %14, float* %r.addr.i.i, align 4
  store float %15, float* %i.addr.i.i, align 4
  %16 = load float* %r.addr.i.i, align 4
  %x.i.i = getelementptr inbounds %struct.float2* %res.i.i, i32 0, i32 0
  store float %16, float* %x.i.i, align 4
  %17 = load float* %i.addr.i.i, align 4
  %y.i.i = getelementptr inbounds %struct.float2* %res.i.i, i32 0, i32 1
  store float %17, float* %y.i.i, align 4
  %18 = bitcast %struct.float2* %agg.result to i8*
  %19 = bitcast %struct.float2* %res.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 8, i32 8, i1 false) nounwind
  ret void
}

define  void @cuCfma(%struct.double2* noalias sret %agg.result, %struct.double2* byval %x, %struct.double2* byval %y, %struct.double2* byval %d) nounwind alwaysinline {
entry:
  %y50 = alloca %struct.double2, align 8
  %d46 = alloca %struct.double2, align 8
  %x42 = alloca %struct.double2, align 8
  %y38 = alloca %struct.double2, align 8
  %d34 = alloca %struct.double2, align 8
  %x30 = alloca %struct.double2, align 8
  %y26 = alloca %struct.double2, align 8
  %x22 = alloca %struct.double2, align 8
  %y18 = alloca %struct.double2, align 8
  %r.addr.i = alloca double, align 8
  %i.addr.i = alloca double, align 8
  %res.i = alloca %struct.double2, align 16
  %x16 = alloca %struct.double2, align 8
  %real_res = alloca double, align 8
  %imag_res = alloca double, align 8
  %tmp = bitcast %struct.double2* %x16 to i8*
  %tmp17 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp17, i64 16, i32 1, i1 false)
  %x1.i = getelementptr inbounds %struct.double2* %x16, i32 0, i32 0
  %0 = load double* %x1.i, align 8
  %tmp51 = bitcast %struct.double2* %y50 to i8*
  %tmp52 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp51, i8* %tmp52, i64 16, i32 1, i1 false)
  %x1.i53 = getelementptr inbounds %struct.double2* %y50, i32 0, i32 0
  %1 = load double* %x1.i53, align 8
  %mul = fmul double %0, %1
  %tmp47 = bitcast %struct.double2* %d46 to i8*
  %tmp48 = bitcast %struct.double2* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp47, i8* %tmp48, i64 16, i32 1, i1 false)
  %x1.i49 = getelementptr inbounds %struct.double2* %d46, i32 0, i32 0
  %2 = load double* %x1.i49, align 8
  %add = fadd double %mul, %2
  store double %add, double* %real_res, align 8
  %tmp43 = bitcast %struct.double2* %x42 to i8*
  %tmp44 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp43, i8* %tmp44, i64 16, i32 1, i1 false)
  %x1.i45 = getelementptr inbounds %struct.double2* %x42, i32 0, i32 0
  %3 = load double* %x1.i45, align 8
  %tmp39 = bitcast %struct.double2* %y38 to i8*
  %tmp40 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp39, i8* %tmp40, i64 16, i32 1, i1 false)
  %y.i41 = getelementptr inbounds %struct.double2* %y38, i32 0, i32 1
  %4 = load double* %y.i41, align 8
  %mul5 = fmul double %3, %4
  %tmp35 = bitcast %struct.double2* %d34 to i8*
  %tmp36 = bitcast %struct.double2* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp35, i8* %tmp36, i64 16, i32 1, i1 false)
  %y.i37 = getelementptr inbounds %struct.double2* %d34, i32 0, i32 1
  %5 = load double* %y.i37, align 8
  %add7 = fadd double %mul5, %5
  store double %add7, double* %imag_res, align 8
  %tmp31 = bitcast %struct.double2* %x30 to i8*
  %tmp32 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp31, i8* %tmp32, i64 16, i32 1, i1 false)
  %y.i33 = getelementptr inbounds %struct.double2* %x30, i32 0, i32 1
  %6 = load double* %y.i33, align 8
  %tmp27 = bitcast %struct.double2* %y26 to i8*
  %tmp28 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp27, i8* %tmp28, i64 16, i32 1, i1 false)
  %y.i29 = getelementptr inbounds %struct.double2* %y26, i32 0, i32 1
  %7 = load double* %y.i29, align 8
  %mul10 = fmul double %6, %7
  %sub = fsub double -0.000000e+00, %mul10
  %8 = load double* %real_res, align 8
  %add11 = fadd double %sub, %8
  store double %add11, double* %real_res, align 8
  %tmp23 = bitcast %struct.double2* %x22 to i8*
  %tmp24 = bitcast %struct.double2* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp23, i8* %tmp24, i64 16, i32 1, i1 false)
  %y.i25 = getelementptr inbounds %struct.double2* %x22, i32 0, i32 1
  %9 = load double* %y.i25, align 8
  %tmp19 = bitcast %struct.double2* %y18 to i8*
  %tmp20 = bitcast %struct.double2* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp19, i8* %tmp20, i64 16, i32 1, i1 false)
  %x1.i21 = getelementptr inbounds %struct.double2* %y18, i32 0, i32 0
  %10 = load double* %x1.i21, align 8
  %mul14 = fmul double %9, %10
  %11 = load double* %imag_res, align 8
  %add15 = fadd double %mul14, %11
  store double %add15, double* %imag_res, align 8
  %12 = load double* %real_res, align 8
  %13 = load double* %imag_res, align 8
  store double %12, double* %r.addr.i, align 8
  store double %13, double* %i.addr.i, align 8
  %14 = load double* %r.addr.i, align 8
  %x.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 0
  store double %14, double* %x.i, align 8
  %15 = load double* %i.addr.i, align 8
  %y.i = getelementptr inbounds %struct.double2* %res.i, i32 0, i32 1
  store double %15, double* %y.i, align 8
  %16 = bitcast %struct.double2* %agg.result to i8*
  %17 = bitcast %struct.double2* %res.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 16, i32 16, i1 false) nounwind
  ret void
}

define  i32 @__pgi_device_cublasCreate(i8* %h) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %call = call  i32 @cublasCreate_v2(%struct.cublasContext** %1)
  ret i32 %call
}

declare  i32 @cublasCreate_v2(%struct.cublasContext**)

define  i32 @__pgi_device_cublasDestroy(i8* %h) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %call = call  i32 @cublasDestroy_v2(%struct.cublasContext* %2)
  ret i32 %call
}

declare  i32 @cublasDestroy_v2(%struct.cublasContext*)

define  i32 @__pgi_device_cublasGetVersion(i8* %h, i32* %ver) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %ver.addr = alloca i32*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32* %ver, i32** %ver.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32** %ver.addr, align 8
  %call = call  i32 @cublasGetVersion_v2(%struct.cublasContext* %2, i32* %3)
  ret i32 %call
}

declare  i32 @cublasGetVersion_v2(%struct.cublasContext*, i32*)

define  i32 @__pgi_device_cublasSetStream(i8* %h, i64 %stream) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %stream.addr = alloca i64, align 8
  store i8* %h, i8** %h.addr, align 8
  store i64 %stream, i64* %stream.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i64* %stream.addr, align 8
  %4 = inttoptr i64 %3 to %struct.CUstream_st*
  %call = call  i32 @cublasSetStream_v2(%struct.cublasContext* %2, %struct.CUstream_st* %4)
  ret i32 %call
}

declare  i32 @cublasSetStream_v2(%struct.cublasContext*, %struct.CUstream_st*)

define  i32 @__pgi_device_cublasGetStream(i8* %h, i64* %stream) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %stream.addr = alloca i64*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i64* %stream, i64** %stream.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i64** %stream.addr, align 8
  %4 = bitcast i64* %3 to %struct.CUstream_st**
  %call = call  i32 @cublasGetStream_v2(%struct.cublasContext* %2, %struct.CUstream_st** %4)
  ret i32 %call
}

declare  i32 @cublasGetStream_v2(%struct.cublasContext*, %struct.CUstream_st**)

define  i32 @__pgi_device_cublasSetPointerMode(i8* %h, i32 %mode) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %mode.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %mode.addr, align 4
  %call = call  i32 @cublasSetPointerMode_v2(%struct.cublasContext* %2, i32 %3)
  ret i32 %call
}

declare  i32 @cublasSetPointerMode_v2(%struct.cublasContext*, i32)

define  i32 @__pgi_device_cublasGetPointerMode(i8* %h, i32* %mode) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %mode.addr = alloca i32*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32* %mode, i32** %mode.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32** %mode.addr, align 8
  %call = call  i32 @cublasGetPointerMode_v2(%struct.cublasContext* %2, i32* %3)
  ret i32 %call
}

declare  i32 @cublasGetPointerMode_v2(%struct.cublasContext*, i32*)

define  i32 @__pgi_device_cublasIsamax(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIsamax_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIsamax_v2(%struct.cublasContext*, i32, float*, i32, i32*)

define  i32 @__pgi_device_cublasIsamin(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIsamin_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIsamin_v2(%struct.cublasContext*, i32, float*, i32, i32*)

define  i32 @__pgi_device_cublasSasum(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to float*
  %call = call  i32 @cublasSasum_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8)
  ret i32 %call
}

declare  i32 @cublasSasum_v2(%struct.cublasContext*, i32, float*, i32, float*)

define  i32 @__pgi_device_cublasSaxpy(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to float*
  %8 = load i32* %incx.addr, align 4
  %9 = load i8** %y.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSaxpy_v2(%struct.cublasContext* %2, i32 %3, float* %5, float* %7, i32 %8, float* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasSaxpy_v2(%struct.cublasContext*, i32, float*, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasScopy(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasScopy_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasScopy_v2(%struct.cublasContext*, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasSdot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to float*
  %call = call  i32 @cublasSdot_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8, i32 %9, float* %11)
  ret i32 %call
}

declare  i32 @cublasSdot_v2(%struct.cublasContext*, i32, float*, i32, float*, i32, float*)

define  i32 @__pgi_device_cublasSnrm2(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to float*
  %call = call  i32 @cublasSnrm2_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8)
  ret i32 %call
}

declare  i32 @cublasSnrm2_v2(%struct.cublasContext*, i32, float*, i32, float*)

define  i32 @__pgi_device_cublasSrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to float*
  %call = call  i32 @cublasSrot_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8, i32 %9, float* %11, float* %13)
  ret i32 %call
}

declare  i32 @cublasSrot_v2(%struct.cublasContext*, i32, float*, i32, float*, i32, float*, float*)

define  i32 @__pgi_device_cublasSrotg(i8* %h, i8* %sa, i8* %sb, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %sa.addr, align 8
  %4 = bitcast i8* %3 to float*
  %5 = load i8** %sb.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %sc.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %ss.addr, align 8
  %10 = bitcast i8* %9 to float*
  %call = call  i32 @cublasSrotg_v2(%struct.cublasContext* %2, float* %4, float* %6, float* %8, float* %10)
  ret i32 %call
}

declare  i32 @cublasSrotg_v2(%struct.cublasContext*, float*, float*, float*, float*)

define  i32 @__pgi_device_cublasSrotm(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %param) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %param.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %param, i8** %param.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %param.addr, align 8
  %11 = bitcast i8* %10 to float*
  %call = call  i32 @cublasSrotm_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8, i32 %9, float* %11)
  ret i32 %call
}

declare  i32 @cublasSrotm_v2(%struct.cublasContext*, i32, float*, i32, float*, i32, float*)

define  i32 @__pgi_device_cublasSrotmg(i8* %h, i8* %d1, i8* %d2, i8* %x1, i8* %y1, i8* %param) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %d1.addr = alloca i8*, align 8
  %d2.addr = alloca i8*, align 8
  %x1.addr = alloca i8*, align 8
  %y1.addr = alloca i8*, align 8
  %param.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %d1, i8** %d1.addr, align 8
  store i8* %d2, i8** %d2.addr, align 8
  store i8* %x1, i8** %x1.addr, align 8
  store i8* %y1, i8** %y1.addr, align 8
  store i8* %param, i8** %param.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %d1.addr, align 8
  %4 = bitcast i8* %3 to float*
  %5 = load i8** %d2.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x1.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %y1.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i8** %param.addr, align 8
  %12 = bitcast i8* %11 to float*
  %call = call  i32 @cublasSrotmg_v2(%struct.cublasContext* %2, float* %4, float* %6, float* %8, float* %10, float* %12)
  ret i32 %call
}

declare  i32 @cublasSrotmg_v2(%struct.cublasContext*, float*, float*, float*, float*, float*)

define  i32 @__pgi_device_cublasSscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to float*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasSscal_v2(%struct.cublasContext* %2, i32 %3, float* %5, float* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasSscal_v2(%struct.cublasContext*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSswap(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSswap_v2(%struct.cublasContext* %2, i32 %3, float* %5, i32 %6, float* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasSswap_v2(%struct.cublasContext*, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasSgbmv(i8* %h, i32 %t, i32 %m, i32 %n, i32 %kl, i32 %ku, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %kl.addr = alloca i32, align 4
  %ku.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %kl, i32* %kl.addr, align 4
  store i32 %ku, i32* %ku.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %kl.addr, align 4
  %7 = load i32* %ku.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %x.addr, align 8
  %14 = bitcast i8* %13 to float*
  %15 = load i32* %incx.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to float*
  %18 = load i8** %y.addr, align 8
  %19 = bitcast i8* %18 to float*
  %20 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSgbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float* %9, float* %11, i32 %12, float* %14, i32 %15, float* %17, float* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasSgbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSgemv(i8* %h, i32 %t, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to float*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to float*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSgemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, float* %7, float* %9, i32 %10, float* %12, i32 %13, float* %15, float* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasSgemv_v2(%struct.cublasContext*, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSger(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to float*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasSger_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11, i32 %12, float* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasSger_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasSsbmv(i8* %h, i32 %uplo, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %k.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to float*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to float*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSsbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, float* %7, float* %9, i32 %10, float* %12, i32 %13, float* %15, float* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasSsbmv_v2(%struct.cublasContext*, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSspmv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %incx.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to float*
  %14 = load i8** %y.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSspmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, float* %10, i32 %11, float* %13, float* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasSspmv_v2(%struct.cublasContext*, i32, i32, float*, float*, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSspr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to float*
  %call = call  i32 @cublasSspr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11)
  ret i32 %call
}

declare  i32 @cublasSspr_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*)

define  i32 @__pgi_device_cublasSspr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to float*
  %call = call  i32 @cublasSspr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11, i32 %12, float* %14)
  ret i32 %call
}

declare  i32 @cublasSspr2_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*, i32, float*)

define  i32 @__pgi_device_cublasSsymv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to float*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to float*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasSsymv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11, i32 %12, float* %14, float* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasSsymv_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSsyr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasSsyr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasSsyr_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasSsyr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to float*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasSsyr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, float* %8, i32 %9, float* %11, i32 %12, float* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasSsyr2_v2(%struct.cublasContext*, i32, i32, float*, float*, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasStbmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float* %9, i32 %10, float* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasStbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasStbsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStbsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float* %9, i32 %10, float* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasStbsv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasStpmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, float* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasStpmv_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasStpsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStpsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, float* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasStpsv_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasStrmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStrmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, i32 %9, float* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasStrmv_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasStrsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasStrsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, i32 %9, float* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasStrsv_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasSgemm(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to float*
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to float*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to float*
  %20 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasSgemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float* %9, float* %11, i32 %12, float* %14, i32 %15, float* %17, float* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasSgemm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSsymm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to float*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to float*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to float*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasSsymm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, float* %10, i32 %11, float* %13, i32 %14, float* %16, float* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasSsymm_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSsyrk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to float*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasSsyrk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, float* %10, i32 %11, float* %13, float* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasSsyrk_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasSsyr2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to float*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to float*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to float*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasSsyr2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, float* %10, i32 %11, float* %13, i32 %14, float* %16, float* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasSsyr2k_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, float*, i32, float*, i32, float*, float*, i32)

define  i32 @__pgi_device_cublasStrmm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i32* %ldb.addr, align 4
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to float*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasStrmm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float* %10, float* %12, i32 %13, float* %15, i32 %16, float* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasStrmm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, float*, float*, i32, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasStrsm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to float*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to float*
  %16 = load i32* %ldb.addr, align 4
  %call = call  i32 @cublasStrsm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float* %10, float* %12, i32 %13, float* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasStrsm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, float*, float*, i32, float*, i32)

define  i32 @__pgi_device_cublasIcamax(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIcamax_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIcamax_v2(%struct.cublasContext*, i32, %struct.float2*, i32, i32*)

define  i32 @__pgi_device_cublasIcamin(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIcamin_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIcamin_v2(%struct.cublasContext*, i32, %struct.float2*, i32, i32*)

define  i32 @__pgi_device_cublasScasum(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to float*
  %call = call  i32 @cublasScasum_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, float* %8)
  ret i32 %call
}

declare  i32 @cublasScasum_v2(%struct.cublasContext*, i32, %struct.float2*, i32, float*)

define  i32 @__pgi_device_cublasCaxpy(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2*
  %8 = load i32* %incx.addr, align 4
  %9 = load i8** %y.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCaxpy_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, %struct.float2* %7, i32 %8, %struct.float2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasCaxpy_v2(%struct.cublasContext*, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCcopy(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCcopy_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasCcopy_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCdotc(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %call = call  i32 @cublasCdotc_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9, %struct.float2* %11)
  ret i32 %call
}

declare  i32 @cublasCdotc_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*)

define  i32 @__pgi_device_cublasCdotu(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %call = call  i32 @cublasCdotu_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9, %struct.float2* %11)
  ret i32 %call
}

declare  i32 @cublasCdotu_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*)

define  i32 @__pgi_device_cublasScnrm2(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to float*
  %call = call  i32 @cublasScnrm2_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, float* %8)
  ret i32 %call
}

declare  i32 @cublasScnrm2_v2(%struct.cublasContext*, i32, %struct.float2*, i32, float*)

define  i32 @__pgi_device_cublasCrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %call = call  i32 @cublasCrot_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9, float* %11, %struct.float2* %13)
  ret i32 %call
}

declare  i32 @cublasCrot_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32, float*, %struct.float2*)

define  i32 @__pgi_device_cublasCsrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to float*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to float*
  %call = call  i32 @cublasCsrot_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9, float* %11, float* %13)
  ret i32 %call
}

declare  i32 @cublasCsrot_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32, float*, float*)

define  i32 @__pgi_device_cublasCrotg(i8* %h, i8* %sa, i8* %sb, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %sa.addr, align 8
  %4 = bitcast i8* %3 to %struct.float2*
  %5 = load i8** %sb.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %sc.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %ss.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %call = call  i32 @cublasCrotg_v2(%struct.cublasContext* %2, %struct.float2* %4, %struct.float2* %6, float* %8, %struct.float2* %10)
  ret i32 %call
}

declare  i32 @cublasCrotg_v2(%struct.cublasContext*, %struct.float2*, %struct.float2*, float*, %struct.float2*)

define  i32 @__pgi_device_cublasCscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCscal_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, %struct.float2* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasCscal_v2(%struct.cublasContext*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCsscal_v2(%struct.cublasContext* %2, i32 %3, float* %5, %struct.float2* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasCsscal_v2(%struct.cublasContext*, i32, float*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCswap(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCswap_v2(%struct.cublasContext* %2, i32 %3, %struct.float2* %5, i32 %6, %struct.float2* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasCswap_v2(%struct.cublasContext*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCgbmv(i8* %h, i32 %t, i32 %m, i32 %n, i32 %kl, i32 %ku, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %kl.addr = alloca i32, align 4
  %ku.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %kl, i32* %kl.addr, align 4
  store i32 %ku, i32* %ku.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %kl.addr, align 4
  %7 = load i32* %ku.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %x.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %incx.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.float2*
  %18 = load i8** %y.addr, align 8
  %19 = bitcast i8* %18 to %struct.float2*
  %20 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCgbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.float2* %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15, %struct.float2* %17, %struct.float2* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasCgbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCgemv(i8* %h, i32 %t, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to %struct.float2*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCgemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.float2* %7, %struct.float2* %9, i32 %10, %struct.float2* %12, i32 %13, %struct.float2* %15, %struct.float2* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasCgemv_v2(%struct.cublasContext*, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCgerc(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCgerc_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasCgerc_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCgeru(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCgeru_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasCgeru_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasChbmv(i8* %h, i32 %uplo, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %k.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to %struct.float2*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasChbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.float2* %7, %struct.float2* %9, i32 %10, %struct.float2* %12, i32 %13, %struct.float2* %15, %struct.float2* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasChbmv_v2(%struct.cublasContext*, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasChemv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to %struct.float2*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasChemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, %struct.float2* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasChemv_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasChpmv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %incx.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i8** %y.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasChpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, %struct.float2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasChpmv_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCher(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCher_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCher_v2(%struct.cublasContext*, i32, i32, float*, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCher2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCher2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasCher2_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasChpr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to float*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %call = call  i32 @cublasChpr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, float* %6, %struct.float2* %8, i32 %9, %struct.float2* %11)
  ret i32 %call
}

declare  i32 @cublasChpr_v2(%struct.cublasContext*, i32, i32, float*, %struct.float2*, i32, %struct.float2*)

define  i32 @__pgi_device_cublasChpr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %call = call  i32 @cublasChpr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14)
  ret i32 %call
}

declare  i32 @cublasChpr2_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*)

define  i32 @__pgi_device_cublasCsymv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to %struct.float2*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasCsymv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, %struct.float2* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasCsymv_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsyr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCsyr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCsyr_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsyr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasCsyr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2* %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasCsyr2_v2(%struct.cublasContext*, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtbmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.float2* %9, i32 %10, %struct.float2* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasCtbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtbsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtbsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.float2* %9, i32 %10, %struct.float2* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasCtbsv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtpmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasCtpmv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtpsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtpsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasCtpsv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtrmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtrmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCtrmv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtrsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasCtrsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, i32 %9, %struct.float2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCtrsv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCgemm(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2*
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.float2*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to %struct.float2*
  %20 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCgemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.float2* %9, %struct.float2* %11, i32 %12, %struct.float2* %14, i32 %15, %struct.float2* %17, %struct.float2* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasCgemm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasChemm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.float2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.float2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasChemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, i32 %14, %struct.float2* %16, %struct.float2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasChemm_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCherk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to float*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to float*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCherk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float* %8, %struct.float2* %10, i32 %11, float* %13, %struct.float2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasCherk_v2(%struct.cublasContext*, i32, i32, i32, i32, float*, %struct.float2*, i32, float*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCher2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to float*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.float2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCher2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, i32 %14, float* %16, %struct.float2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasCher2k_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, float*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsymm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.float2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.float2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCsymm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, i32 %14, %struct.float2* %16, %struct.float2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasCsymm_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsyrk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCsyrk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, %struct.float2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasCsyrk_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCsyr2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.float2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.float2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.float2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCsyr2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2* %8, %struct.float2* %10, i32 %11, %struct.float2* %13, i32 %14, %struct.float2* %16, %struct.float2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasCsyr2k_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtrmm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i32* %ldb.addr, align 4
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.float2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasCtrmm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.float2* %10, %struct.float2* %12, i32 %13, %struct.float2* %15, i32 %16, %struct.float2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasCtrmm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasCtrsm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2*
  %16 = load i32* %ldb.addr, align 4
  %call = call  i32 @cublasCtrsm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.float2* %10, %struct.float2* %12, i32 %13, %struct.float2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasCtrsm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2*, i32, %struct.float2*, i32)

define  i32 @__pgi_device_cublasIdamax(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIdamax_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIdamax_v2(%struct.cublasContext*, i32, double*, i32, i32*)

define  i32 @__pgi_device_cublasIdamin(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIdamin_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIdamin_v2(%struct.cublasContext*, i32, double*, i32, i32*)

define  i32 @__pgi_device_cublasDasum(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to double*
  %call = call  i32 @cublasDasum_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8)
  ret i32 %call
}

declare  i32 @cublasDasum_v2(%struct.cublasContext*, i32, double*, i32, double*)

define  i32 @__pgi_device_cublasDaxpy(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to double*
  %8 = load i32* %incx.addr, align 4
  %9 = load i8** %y.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDaxpy_v2(%struct.cublasContext* %2, i32 %3, double* %5, double* %7, i32 %8, double* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasDaxpy_v2(%struct.cublasContext*, i32, double*, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDcopy(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDcopy_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasDcopy_v2(%struct.cublasContext*, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDdot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to double*
  %call = call  i32 @cublasDdot_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8, i32 %9, double* %11)
  ret i32 %call
}

declare  i32 @cublasDdot_v2(%struct.cublasContext*, i32, double*, i32, double*, i32, double*)

define  i32 @__pgi_device_cublasDnrm2(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to double*
  %call = call  i32 @cublasDnrm2_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8)
  ret i32 %call
}

declare  i32 @cublasDnrm2_v2(%struct.cublasContext*, i32, double*, i32, double*)

define  i32 @__pgi_device_cublasDrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to double*
  %call = call  i32 @cublasDrot_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8, i32 %9, double* %11, double* %13)
  ret i32 %call
}

declare  i32 @cublasDrot_v2(%struct.cublasContext*, i32, double*, i32, double*, i32, double*, double*)

define  i32 @__pgi_device_cublasDrotg(i8* %h, i8* %sa, i8* %sb, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %sa.addr, align 8
  %4 = bitcast i8* %3 to double*
  %5 = load i8** %sb.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %sc.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %ss.addr, align 8
  %10 = bitcast i8* %9 to double*
  %call = call  i32 @cublasDrotg_v2(%struct.cublasContext* %2, double* %4, double* %6, double* %8, double* %10)
  ret i32 %call
}

declare  i32 @cublasDrotg_v2(%struct.cublasContext*, double*, double*, double*, double*)

define  i32 @__pgi_device_cublasDrotm(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %param) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %param.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %param, i8** %param.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %param.addr, align 8
  %11 = bitcast i8* %10 to double*
  %call = call  i32 @cublasDrotm_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8, i32 %9, double* %11)
  ret i32 %call
}

declare  i32 @cublasDrotm_v2(%struct.cublasContext*, i32, double*, i32, double*, i32, double*)

define  i32 @__pgi_device_cublasDrotmg(i8* %h, i8* %d1, i8* %d2, i8* %x1, i8* %y1, i8* %param) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %d1.addr = alloca i8*, align 8
  %d2.addr = alloca i8*, align 8
  %x1.addr = alloca i8*, align 8
  %y1.addr = alloca i8*, align 8
  %param.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %d1, i8** %d1.addr, align 8
  store i8* %d2, i8** %d2.addr, align 8
  store i8* %x1, i8** %x1.addr, align 8
  store i8* %y1, i8** %y1.addr, align 8
  store i8* %param, i8** %param.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %d1.addr, align 8
  %4 = bitcast i8* %3 to double*
  %5 = load i8** %d2.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x1.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %y1.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i8** %param.addr, align 8
  %12 = bitcast i8* %11 to double*
  %call = call  i32 @cublasDrotmg_v2(%struct.cublasContext* %2, double* %4, double* %6, double* %8, double* %10, double* %12)
  ret i32 %call
}

declare  i32 @cublasDrotmg_v2(%struct.cublasContext*, double*, double*, double*, double*, double*)

define  i32 @__pgi_device_cublasDscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to double*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDscal_v2(%struct.cublasContext* %2, i32 %3, double* %5, double* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasDscal_v2(%struct.cublasContext*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDswap(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDswap_v2(%struct.cublasContext* %2, i32 %3, double* %5, i32 %6, double* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasDswap_v2(%struct.cublasContext*, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDgbmv(i8* %h, i32 %t, i32 %m, i32 %n, i32 %kl, i32 %ku, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %kl.addr = alloca i32, align 4
  %ku.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %kl, i32* %kl.addr, align 4
  store i32 %ku, i32* %ku.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %kl.addr, align 4
  %7 = load i32* %ku.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %x.addr, align 8
  %14 = bitcast i8* %13 to double*
  %15 = load i32* %incx.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to double*
  %18 = load i8** %y.addr, align 8
  %19 = bitcast i8* %18 to double*
  %20 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDgbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double* %9, double* %11, i32 %12, double* %14, i32 %15, double* %17, double* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasDgbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDgemv(i8* %h, i32 %t, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to double*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to double*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDgemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, double* %7, double* %9, i32 %10, double* %12, i32 %13, double* %15, double* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasDgemv_v2(%struct.cublasContext*, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDger(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to double*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasDger_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11, i32 %12, double* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasDger_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDsbmv(i8* %h, i32 %uplo, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %k.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to double*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to double*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDsbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, double* %7, double* %9, i32 %10, double* %12, i32 %13, double* %15, double* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasDsbmv_v2(%struct.cublasContext*, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDspmv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %incx.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to double*
  %14 = load i8** %y.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDspmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, double* %10, i32 %11, double* %13, double* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasDspmv_v2(%struct.cublasContext*, i32, i32, double*, double*, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDspr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to double*
  %call = call  i32 @cublasDspr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11)
  ret i32 %call
}

declare  i32 @cublasDspr_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*)

define  i32 @__pgi_device_cublasDspr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to double*
  %call = call  i32 @cublasDspr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11, i32 %12, double* %14)
  ret i32 %call
}

declare  i32 @cublasDspr2_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*, i32, double*)

define  i32 @__pgi_device_cublasDsymv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to double*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to double*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasDsymv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11, i32 %12, double* %14, double* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasDsymv_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDsyr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasDsyr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasDsyr_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDsyr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to double*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasDsyr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, double* %8, i32 %9, double* %11, i32 %12, double* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasDsyr2_v2(%struct.cublasContext*, i32, i32, double*, double*, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDtbmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double* %9, i32 %10, double* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasDtbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDtbsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtbsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double* %9, i32 %10, double* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasDtbsv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDtpmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, double* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasDtpmv_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDtpsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtpsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, double* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasDtpsv_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDtrmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtrmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, i32 %9, double* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasDtrmv_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDtrsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasDtrsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, i32 %9, double* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasDtrsv_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDgemm(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to double*
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to double*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to double*
  %20 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasDgemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double* %9, double* %11, i32 %12, double* %14, i32 %15, double* %17, double* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasDgemm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDsymm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to double*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to double*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to double*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasDsymm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, double* %10, i32 %11, double* %13, i32 %14, double* %16, double* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasDsymm_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDsyrk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to double*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasDsyrk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, double* %10, i32 %11, double* %13, double* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasDsyrk_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDsyr2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to double*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to double*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to double*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasDsyr2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, double* %10, i32 %11, double* %13, i32 %14, double* %16, double* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasDsyr2k_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, double*, i32, double*, i32, double*, double*, i32)

define  i32 @__pgi_device_cublasDtrmm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i32* %ldb.addr, align 4
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to double*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasDtrmm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, double* %10, double* %12, i32 %13, double* %15, i32 %16, double* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasDtrmm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, double*, double*, i32, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasDtrsm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to double*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to double*
  %16 = load i32* %ldb.addr, align 4
  %call = call  i32 @cublasDtrsm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, double* %10, double* %12, i32 %13, double* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasDtrsm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, double*, double*, i32, double*, i32)

define  i32 @__pgi_device_cublasIzamax(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIzamax_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIzamax_v2(%struct.cublasContext*, i32, %struct.double2*, i32, i32*)

define  i32 @__pgi_device_cublasIzamin(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %call = call  i32 @cublasIzamin_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, i32* %8)
  ret i32 %call
}

declare  i32 @cublasIzamin_v2(%struct.cublasContext*, i32, %struct.double2*, i32, i32*)

define  i32 @__pgi_device_cublasDzasum(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to double*
  %call = call  i32 @cublasDzasum_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, double* %8)
  ret i32 %call
}

declare  i32 @cublasDzasum_v2(%struct.cublasContext*, i32, %struct.double2*, i32, double*)

define  i32 @__pgi_device_cublasZaxpy(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2*
  %8 = load i32* %incx.addr, align 4
  %9 = load i8** %y.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZaxpy_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, %struct.double2* %7, i32 %8, %struct.double2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasZaxpy_v2(%struct.cublasContext*, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZcopy(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZcopy_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasZcopy_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZdotc(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %call = call  i32 @cublasZdotc_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9, %struct.double2* %11)
  ret i32 %call
}

declare  i32 @cublasZdotc_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*)

define  i32 @__pgi_device_cublasZdotu(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %result.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %call = call  i32 @cublasZdotu_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9, %struct.double2* %11)
  ret i32 %call
}

declare  i32 @cublasZdotu_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*)

define  i32 @__pgi_device_cublasDznrm2(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %result) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %result.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %result, i8** %result.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %result.addr, align 8
  %8 = bitcast i8* %7 to double*
  %call = call  i32 @cublasDznrm2_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, double* %8)
  ret i32 %call
}

declare  i32 @cublasDznrm2_v2(%struct.cublasContext*, i32, %struct.double2*, i32, double*)

define  i32 @__pgi_device_cublasZrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %call = call  i32 @cublasZrot_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9, double* %11, %struct.double2* %13)
  ret i32 %call
}

declare  i32 @cublasZrot_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32, double*, %struct.double2*)

define  i32 @__pgi_device_cublasZdrot(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %10 = load i8** %sc.addr, align 8
  %11 = bitcast i8* %10 to double*
  %12 = load i8** %ss.addr, align 8
  %13 = bitcast i8* %12 to double*
  %call = call  i32 @cublasZdrot_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9, double* %11, double* %13)
  ret i32 %call
}

declare  i32 @cublasZdrot_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32, double*, double*)

define  i32 @__pgi_device_cublasZrotg(i8* %h, i8* %sa, i8* %sb, i8* %sc, i8* %ss) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %sc.addr = alloca i8*, align 8
  %ss.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  store i8* %sc, i8** %sc.addr, align 8
  store i8* %ss, i8** %ss.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i8** %sa.addr, align 8
  %4 = bitcast i8* %3 to %struct.double2*
  %5 = load i8** %sb.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %sc.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %ss.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %call = call  i32 @cublasZrotg_v2(%struct.cublasContext* %2, %struct.double2* %4, %struct.double2* %6, double* %8, %struct.double2* %10)
  ret i32 %call
}

declare  i32 @cublasZrotg_v2(%struct.cublasContext*, %struct.double2*, %struct.double2*, double*, %struct.double2*)

define  i32 @__pgi_device_cublasZscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZscal_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, %struct.double2* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasZscal_v2(%struct.cublasContext*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZdscal(i8* %h, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double*
  %6 = load i8** %x.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2*
  %8 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZdscal_v2(%struct.cublasContext* %2, i32 %3, double* %5, %struct.double2* %7, i32 %8)
  ret i32 %call
}

declare  i32 @cublasZdscal_v2(%struct.cublasContext*, i32, double*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZswap(i8* %h, i32 %n, i8* %x, i32 %incx, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %x.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2*
  %6 = load i32* %incx.addr, align 4
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZswap_v2(%struct.cublasContext* %2, i32 %3, %struct.double2* %5, i32 %6, %struct.double2* %8, i32 %9)
  ret i32 %call
}

declare  i32 @cublasZswap_v2(%struct.cublasContext*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZgbmv(i8* %h, i32 %t, i32 %m, i32 %n, i32 %kl, i32 %ku, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %kl.addr = alloca i32, align 4
  %ku.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %kl, i32* %kl.addr, align 4
  store i32 %ku, i32* %ku.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %kl.addr, align 4
  %7 = load i32* %ku.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %x.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %incx.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.double2*
  %18 = load i8** %y.addr, align 8
  %19 = bitcast i8* %18 to %struct.double2*
  %20 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZgbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.double2* %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15, %struct.double2* %17, %struct.double2* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasZgbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZgemv(i8* %h, i32 %t, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %t, i32* %t.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %t.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to %struct.double2*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZgemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.double2* %7, %struct.double2* %9, i32 %10, %struct.double2* %12, i32 %13, %struct.double2* %15, %struct.double2* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasZgemv_v2(%struct.cublasContext*, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZgerc(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZgerc_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasZgerc_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZgeru(i8* %h, i32 %m, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZgeru_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasZgeru_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZhbmv(i8* %h, i32 %uplo, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %k.addr, align 4
  %6 = load i8** %alpha.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2*
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %incx.addr, align 4
  %14 = load i8** %beta.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i8** %y.addr, align 8
  %17 = bitcast i8* %16 to %struct.double2*
  %18 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZhbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.double2* %7, %struct.double2* %9, i32 %10, %struct.double2* %12, i32 %13, %struct.double2* %15, %struct.double2* %17, i32 %18)
  ret i32 %call
}

declare  i32 @cublasZhbmv_v2(%struct.cublasContext*, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZhemv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to %struct.double2*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZhemv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, %struct.double2* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasZhemv_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZhpmv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %incx.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i8** %y.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZhpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, %struct.double2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasZhpmv_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZher(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZher_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZher_v2(%struct.cublasContext*, i32, i32, double*, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZher2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZher2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasZher2_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZhpr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %call = call  i32 @cublasZhpr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, double* %6, %struct.double2* %8, i32 %9, %struct.double2* %11)
  ret i32 %call
}

declare  i32 @cublasZhpr_v2(%struct.cublasContext*, i32, i32, double*, %struct.double2*, i32, %struct.double2*)

define  i32 @__pgi_device_cublasZhpr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %call = call  i32 @cublasZhpr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14)
  ret i32 %call
}

declare  i32 @cublasZhpr2_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*)

define  i32 @__pgi_device_cublasZsymv(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %x, i32 %incx, i8* %beta, i8* %y, i32 %incy) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incx.addr, align 4
  %13 = load i8** %beta.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i8** %y.addr, align 8
  %16 = bitcast i8* %15 to %struct.double2*
  %17 = load i32* %incy.addr, align 4
  %call = call  i32 @cublasZsymv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, %struct.double2* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasZsymv_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZsyr(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZsyr_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZsyr_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZsyr2(i8* %h, i32 %uplo, i32 %n, i8* %alpha, i8* %x, i32 %incx, i8* %y, i32 %incy, i8* %a, i32 %lda) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %incy.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %incy, i32* %incy.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %alpha.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2*
  %7 = load i8** %x.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %incx.addr, align 4
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incy.addr, align 4
  %13 = load i8** %a.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %lda.addr, align 4
  %call = call  i32 @cublasZsyr2_v2(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2* %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15)
  ret i32 %call
}

declare  i32 @cublasZsyr2_v2(%struct.cublasContext*, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtbmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtbmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.double2* %9, i32 %10, %struct.double2* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasZtbmv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtbsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i32 %k, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %a.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i32* %lda.addr, align 4
  %11 = load i8** %x.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtbsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.double2* %9, i32 %10, %struct.double2* %12, i32 %13)
  ret i32 %call
}

declare  i32 @cublasZtbsv_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtpmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtpmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasZtpmv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtpsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %x.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtpsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasZtpsv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtrmv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtrmv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZtrmv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtrsv(i8* %h, i32 %u, i32 %t, i32 %d, i32 %n, i8* %a, i32 %lda, i8* %x, i32 %incx) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %u.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %incx.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %u, i32* %u.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %incx, i32* %incx.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %u.addr, align 4
  %4 = load i32* %t.addr, align 4
  %5 = load i32* %d.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %x.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %incx.addr, align 4
  %call = call  i32 @cublasZtrsv_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, i32 %9, %struct.double2* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZtrsv_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZgemm(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2*
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2*
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.double2*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to %struct.double2*
  %20 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZgemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.double2* %9, %struct.double2* %11, i32 %12, %struct.double2* %14, i32 %15, %struct.double2* %17, %struct.double2* %19, i32 %20)
  ret i32 %call
}

declare  i32 @cublasZgemm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZhemm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.double2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.double2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZhemm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, i32 %14, %struct.double2* %16, %struct.double2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasZhemm_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZherk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to double*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZherk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double* %8, %struct.double2* %10, i32 %11, double* %13, %struct.double2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasZherk_v2(%struct.cublasContext*, i32, i32, i32, i32, double*, %struct.double2*, i32, double*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZher2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to double*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.double2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZher2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, i32 %14, double* %16, %struct.double2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasZher2k_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, double*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZsymm(i8* %h, i32 %side, i32 %uplo, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.double2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.double2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZsymm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, i32 %14, %struct.double2* %16, %struct.double2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasZsymm_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZsyrk(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %beta.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i8** %c.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZsyrk_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, %struct.double2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasZsyrk_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZsyr2k(i8* %h, i32 %uplo, i32 %trans, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %uplo.addr, align 4
  %4 = load i32* %trans.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = load i8** %alpha.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2*
  %9 = load i8** %a.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i32* %lda.addr, align 4
  %12 = load i8** %b.addr, align 8
  %13 = bitcast i8* %12 to %struct.double2*
  %14 = load i32* %ldb.addr, align 4
  %15 = load i8** %beta.addr, align 8
  %16 = bitcast i8* %15 to %struct.double2*
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.double2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZsyr2k_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2* %8, %struct.double2* %10, i32 %11, %struct.double2* %13, i32 %14, %struct.double2* %16, %struct.double2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasZsyr2k_v2(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtrmm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %c, i32 %ldc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i32* %ldb.addr, align 4
  %17 = load i8** %c.addr, align 8
  %18 = bitcast i8* %17 to %struct.double2*
  %19 = load i32* %ldc.addr, align 4
  %call = call  i32 @cublasZtrmm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.double2* %10, %struct.double2* %12, i32 %13, %struct.double2* %15, i32 %16, %struct.double2* %18, i32 %19)
  ret i32 %call
}

declare  i32 @cublasZtrmm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasZtrsm(i8* %h, i32 %side, i32 %uplo, i32 %transa, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %transa.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %transa.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2*
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2*
  %16 = load i32* %ldb.addr, align 4
  %call = call  i32 @cublasZtrsm_v2(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.double2* %10, %struct.double2* %12, i32 %13, %struct.double2* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasZtrsm_v2(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2*, i32, %struct.double2*, i32)

define  i32 @__pgi_device_cublasSgemmBatched(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to float*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to float**
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to float**
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to float*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to float**
  %20 = load i32* %ldc.addr, align 4
  %21 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgemmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float* %9, float** %11, i32 %12, float** %14, i32 %15, float* %17, float** %19, i32 %20, i32 %21)
  ret i32 %call
}

declare  i32 @cublasSgemmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, float*, float**, i32, float**, i32, float*, float**, i32, i32)

define  i32 @__pgi_device_cublasSgetrfBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %info.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgetrfBatched(%struct.cublasContext* %2, i32 %3, float** %5, i32 %6, i32* %8, i32* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasSgetrfBatched(%struct.cublasContext*, i32, float**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasSgetriBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %c, i32 %ldc, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %c.addr, align 8
  %10 = bitcast i8* %9 to float**
  %11 = load i32* %ldc.addr, align 4
  %12 = load i8** %info.addr, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgetriBatched(%struct.cublasContext* %2, i32 %3, float** %5, i32 %6, i32* %8, float** %10, i32 %11, i32* %13, i32 %14)
  ret i32 %call
}

declare  i32 @cublasSgetriBatched(%struct.cublasContext*, i32, float**, i32, i32*, float**, i32, i32*, i32)

define  i32 @__pgi_device_cublasSgetrsBatched(i8* %h, i32 %trans, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %ipvt, i8* %b, i32 %ldb, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %nrhs.addr, align 4
  %6 = load i8** %a.addr, align 8
  %7 = bitcast i8* %6 to float**
  %8 = load i32* %lda.addr, align 4
  %9 = load i8** %ipvt.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i8** %b.addr, align 8
  %12 = bitcast i8* %11 to float**
  %13 = load i32* %ldb.addr, align 4
  %14 = load i8** %info.addr, align 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgetrsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, float** %7, i32 %8, i32* %10, float** %12, i32 %13, i32* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasSgetrsBatched(%struct.cublasContext*, i32, i32, i32, float**, i32, i32*, float**, i32, i32*, i32)

define  i32 @__pgi_device_cublasStrsmBatched(i8* %h, i32 %side, i32 %uplo, i32 %trans, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %trans.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to float*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to float**
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to float**
  %16 = load i32* %ldb.addr, align 4
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasStrsmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float* %10, float** %12, i32 %13, float** %15, i32 %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasStrsmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, float*, float**, i32, float**, i32, i32)

define  i32 @__pgi_device_cublasSmatinvBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ainv, i32 %lda_inv, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ainv.addr = alloca i8*, align 8
  %lda_inv.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ainv, i8** %ainv.addr, align 8
  store i32 %lda_inv, i32* %lda_inv.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to float**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ainv.addr, align 8
  %8 = bitcast i8* %7 to float**
  %9 = load i32* %lda_inv.addr, align 4
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSmatinvBatched(%struct.cublasContext* %2, i32 %3, float** %5, i32 %6, float** %8, i32 %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasSmatinvBatched(%struct.cublasContext*, i32, float**, i32, float**, i32, i32*, i32)

define  i32 @__pgi_device_cublasSgeqrfBatched(i8* %h, i32 %m, i32 %n, i8* %a, i32 %lda, i8* %tau, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %tau.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %tau, i8** %tau.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %a.addr, align 8
  %6 = bitcast i8* %5 to float**
  %7 = load i32* %lda.addr, align 4
  %8 = load i8** %tau.addr, align 8
  %9 = bitcast i8* %8 to float**
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgeqrfBatched(%struct.cublasContext* %2, i32 %3, i32 %4, float** %6, i32 %7, float** %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasSgeqrfBatched(%struct.cublasContext*, i32, i32, float**, i32, float**, i32*, i32)

define  i32 @__pgi_device_cublasSgelsBatched(i8* %h, i32 %trans, i32 %m, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %c, i32 %ldc, i8* %info, i8* %dinfo, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %dinfo.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i8* %dinfo, i8** %dinfo.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %nrhs.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to float**
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %c.addr, align 8
  %11 = bitcast i8* %10 to float**
  %12 = load i32* %ldc.addr, align 4
  %13 = load i8** %info.addr, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i8** %dinfo.addr, align 8
  %16 = bitcast i8* %15 to i32*
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasSgelsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, float** %8, i32 %9, float** %11, i32 %12, i32* %14, i32* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasSgelsBatched(%struct.cublasContext*, i32, i32, i32, i32, float**, i32, float**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasDgemmBatched(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to double*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to double**
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to double**
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to double*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to double**
  %20 = load i32* %ldc.addr, align 4
  %21 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgemmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, double* %9, double** %11, i32 %12, double** %14, i32 %15, double* %17, double** %19, i32 %20, i32 %21)
  ret i32 %call
}

declare  i32 @cublasDgemmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, double*, double**, i32, double**, i32, double*, double**, i32, i32)

define  i32 @__pgi_device_cublasDgetrfBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %info.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgetrfBatched(%struct.cublasContext* %2, i32 %3, double** %5, i32 %6, i32* %8, i32* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasDgetrfBatched(%struct.cublasContext*, i32, double**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasDgetriBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %c, i32 %ldc, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %c.addr, align 8
  %10 = bitcast i8* %9 to double**
  %11 = load i32* %ldc.addr, align 4
  %12 = load i8** %info.addr, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgetriBatched(%struct.cublasContext* %2, i32 %3, double** %5, i32 %6, i32* %8, double** %10, i32 %11, i32* %13, i32 %14)
  ret i32 %call
}

declare  i32 @cublasDgetriBatched(%struct.cublasContext*, i32, double**, i32, i32*, double**, i32, i32*, i32)

define  i32 @__pgi_device_cublasDgetrsBatched(i8* %h, i32 %trans, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %ipvt, i8* %b, i32 %ldb, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %nrhs.addr, align 4
  %6 = load i8** %a.addr, align 8
  %7 = bitcast i8* %6 to double**
  %8 = load i32* %lda.addr, align 4
  %9 = load i8** %ipvt.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i8** %b.addr, align 8
  %12 = bitcast i8* %11 to double**
  %13 = load i32* %ldb.addr, align 4
  %14 = load i8** %info.addr, align 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgetrsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, double** %7, i32 %8, i32* %10, double** %12, i32 %13, i32* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasDgetrsBatched(%struct.cublasContext*, i32, i32, i32, double**, i32, i32*, double**, i32, i32*, i32)

define  i32 @__pgi_device_cublasDtrsmBatched(i8* %h, i32 %side, i32 %uplo, i32 %trans, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %trans.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to double*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to double**
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to double**
  %16 = load i32* %ldb.addr, align 4
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDtrsmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, double* %10, double** %12, i32 %13, double** %15, i32 %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasDtrsmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, double*, double**, i32, double**, i32, i32)

define  i32 @__pgi_device_cublasDmatinvBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ainv, i32 %lda_inv, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ainv.addr = alloca i8*, align 8
  %lda_inv.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ainv, i8** %ainv.addr, align 8
  store i32 %lda_inv, i32* %lda_inv.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to double**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ainv.addr, align 8
  %8 = bitcast i8* %7 to double**
  %9 = load i32* %lda_inv.addr, align 4
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDmatinvBatched(%struct.cublasContext* %2, i32 %3, double** %5, i32 %6, double** %8, i32 %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasDmatinvBatched(%struct.cublasContext*, i32, double**, i32, double**, i32, i32*, i32)

define  i32 @__pgi_device_cublasDgeqrfBatched(i8* %h, i32 %m, i32 %n, i8* %a, i32 %lda, i8* %tau, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %tau.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %tau, i8** %tau.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %a.addr, align 8
  %6 = bitcast i8* %5 to double**
  %7 = load i32* %lda.addr, align 4
  %8 = load i8** %tau.addr, align 8
  %9 = bitcast i8* %8 to double**
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgeqrfBatched(%struct.cublasContext* %2, i32 %3, i32 %4, double** %6, i32 %7, double** %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasDgeqrfBatched(%struct.cublasContext*, i32, i32, double**, i32, double**, i32*, i32)

define  i32 @__pgi_device_cublasDgelsBatched(i8* %h, i32 %trans, i32 %m, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %c, i32 %ldc, i8* %info, i8* %dinfo, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %dinfo.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i8* %dinfo, i8** %dinfo.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %nrhs.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to double**
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %c.addr, align 8
  %11 = bitcast i8* %10 to double**
  %12 = load i32* %ldc.addr, align 4
  %13 = load i8** %info.addr, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i8** %dinfo.addr, align 8
  %16 = bitcast i8* %15 to i32*
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasDgelsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, double** %8, i32 %9, double** %11, i32 %12, i32* %14, i32* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasDgelsBatched(%struct.cublasContext*, i32, i32, i32, i32, double**, i32, double**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasCgemmBatched(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2**
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to %struct.float2**
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.float2*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to %struct.float2**
  %20 = load i32* %ldc.addr, align 4
  %21 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgemmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.float2* %9, %struct.float2** %11, i32 %12, %struct.float2** %14, i32 %15, %struct.float2* %17, %struct.float2** %19, i32 %20, i32 %21)
  ret i32 %call
}

declare  i32 @cublasCgemmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2**, i32, %struct.float2**, i32, %struct.float2*, %struct.float2**, i32, i32)

define  i32 @__pgi_device_cublasCgetrfBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %info.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgetrfBatched(%struct.cublasContext* %2, i32 %3, %struct.float2** %5, i32 %6, i32* %8, i32* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasCgetrfBatched(%struct.cublasContext*, i32, %struct.float2**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasCgetriBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %c, i32 %ldc, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %c.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2**
  %11 = load i32* %ldc.addr, align 4
  %12 = load i8** %info.addr, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgetriBatched(%struct.cublasContext* %2, i32 %3, %struct.float2** %5, i32 %6, i32* %8, %struct.float2** %10, i32 %11, i32* %13, i32 %14)
  ret i32 %call
}

declare  i32 @cublasCgetriBatched(%struct.cublasContext*, i32, %struct.float2**, i32, i32*, %struct.float2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasCgetrsBatched(i8* %h, i32 %trans, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %ipvt, i8* %b, i32 %ldb, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %nrhs.addr, align 4
  %6 = load i8** %a.addr, align 8
  %7 = bitcast i8* %6 to %struct.float2**
  %8 = load i32* %lda.addr, align 4
  %9 = load i8** %ipvt.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i8** %b.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2**
  %13 = load i32* %ldb.addr, align 4
  %14 = load i8** %info.addr, align 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgetrsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.float2** %7, i32 %8, i32* %10, %struct.float2** %12, i32 %13, i32* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasCgetrsBatched(%struct.cublasContext*, i32, i32, i32, %struct.float2**, i32, i32*, %struct.float2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasCtrsmBatched(i8* %h, i32 %side, i32 %uplo, i32 %trans, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %trans.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.float2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.float2**
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.float2**
  %16 = load i32* %ldb.addr, align 4
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCtrsmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.float2* %10, %struct.float2** %12, i32 %13, %struct.float2** %15, i32 %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasCtrsmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.float2*, %struct.float2**, i32, %struct.float2**, i32, i32)

define  i32 @__pgi_device_cublasCmatinvBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ainv, i32 %lda_inv, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ainv.addr = alloca i8*, align 8
  %lda_inv.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ainv, i8** %ainv.addr, align 8
  store i32 %lda_inv, i32* %lda_inv.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.float2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ainv.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2**
  %9 = load i32* %lda_inv.addr, align 4
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCmatinvBatched(%struct.cublasContext* %2, i32 %3, %struct.float2** %5, i32 %6, %struct.float2** %8, i32 %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCmatinvBatched(%struct.cublasContext*, i32, %struct.float2**, i32, %struct.float2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasCgeqrfBatched(i8* %h, i32 %m, i32 %n, i8* %a, i32 %lda, i8* %tau, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %tau.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %tau, i8** %tau.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %a.addr, align 8
  %6 = bitcast i8* %5 to %struct.float2**
  %7 = load i32* %lda.addr, align 4
  %8 = load i8** %tau.addr, align 8
  %9 = bitcast i8* %8 to %struct.float2**
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgeqrfBatched(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.float2** %6, i32 %7, %struct.float2** %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasCgeqrfBatched(%struct.cublasContext*, i32, i32, %struct.float2**, i32, %struct.float2**, i32*, i32)

define  i32 @__pgi_device_cublasCgelsBatched(i8* %h, i32 %trans, i32 %m, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %c, i32 %ldc, i8* %info, i8* %dinfo, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %dinfo.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i8* %dinfo, i8** %dinfo.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %nrhs.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.float2**
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %c.addr, align 8
  %11 = bitcast i8* %10 to %struct.float2**
  %12 = load i32* %ldc.addr, align 4
  %13 = load i8** %info.addr, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i8** %dinfo.addr, align 8
  %16 = bitcast i8* %15 to i32*
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasCgelsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.float2** %8, i32 %9, %struct.float2** %11, i32 %12, i32* %14, i32* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasCgelsBatched(%struct.cublasContext*, i32, i32, i32, i32, %struct.float2**, i32, %struct.float2**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasZgemmBatched(i8* %h, i32 %transa, i32 %transb, i32 %m, i32 %n, i32 %k, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i8* %beta, i8* %c, i32 %ldc, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %transa.addr = alloca i32, align 4
  %transb.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %beta.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %transa, i32* %transa.addr, align 4
  store i32 %transb, i32* %transb.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %beta, i8** %beta.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %transa.addr, align 4
  %4 = load i32* %transb.addr, align 4
  %5 = load i32* %m.addr, align 4
  %6 = load i32* %n.addr, align 4
  %7 = load i32* %k.addr, align 4
  %8 = load i8** %alpha.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2*
  %10 = load i8** %a.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2**
  %12 = load i32* %lda.addr, align 4
  %13 = load i8** %b.addr, align 8
  %14 = bitcast i8* %13 to %struct.double2**
  %15 = load i32* %ldb.addr, align 4
  %16 = load i8** %beta.addr, align 8
  %17 = bitcast i8* %16 to %struct.double2*
  %18 = load i8** %c.addr, align 8
  %19 = bitcast i8* %18 to %struct.double2**
  %20 = load i32* %ldc.addr, align 4
  %21 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgemmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, %struct.double2* %9, %struct.double2** %11, i32 %12, %struct.double2** %14, i32 %15, %struct.double2* %17, %struct.double2** %19, i32 %20, i32 %21)
  ret i32 %call
}

declare  i32 @cublasZgemmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2**, i32, %struct.double2**, i32, %struct.double2*, %struct.double2**, i32, i32)

define  i32 @__pgi_device_cublasZgetrfBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %info.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgetrfBatched(%struct.cublasContext* %2, i32 %3, %struct.double2** %5, i32 %6, i32* %8, i32* %10, i32 %11)
  ret i32 %call
}

declare  i32 @cublasZgetrfBatched(%struct.cublasContext*, i32, %struct.double2**, i32, i32*, i32*, i32)

define  i32 @__pgi_device_cublasZgetriBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ipvt, i8* %c, i32 %ldc, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ipvt.addr, align 8
  %8 = bitcast i8* %7 to i32*
  %9 = load i8** %c.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2**
  %11 = load i32* %ldc.addr, align 4
  %12 = load i8** %info.addr, align 8
  %13 = bitcast i8* %12 to i32*
  %14 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgetriBatched(%struct.cublasContext* %2, i32 %3, %struct.double2** %5, i32 %6, i32* %8, %struct.double2** %10, i32 %11, i32* %13, i32 %14)
  ret i32 %call
}

declare  i32 @cublasZgetriBatched(%struct.cublasContext*, i32, %struct.double2**, i32, i32*, %struct.double2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasZgetrsBatched(i8* %h, i32 %trans, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %ipvt, i8* %b, i32 %ldb, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ipvt.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ipvt, i8** %ipvt.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i32* %nrhs.addr, align 4
  %6 = load i8** %a.addr, align 8
  %7 = bitcast i8* %6 to %struct.double2**
  %8 = load i32* %lda.addr, align 4
  %9 = load i8** %ipvt.addr, align 8
  %10 = bitcast i8* %9 to i32*
  %11 = load i8** %b.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2**
  %13 = load i32* %ldb.addr, align 4
  %14 = load i8** %info.addr, align 8
  %15 = bitcast i8* %14 to i32*
  %16 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgetrsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, %struct.double2** %7, i32 %8, i32* %10, %struct.double2** %12, i32 %13, i32* %15, i32 %16)
  ret i32 %call
}

declare  i32 @cublasZgetrsBatched(%struct.cublasContext*, i32, i32, i32, %struct.double2**, i32, i32*, %struct.double2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasZtrsmBatched(i8* %h, i32 %side, i32 %uplo, i32 %trans, i32 %diag, i32 %m, i32 %n, i8* %alpha, i8* %a, i32 %lda, i8* %b, i32 %ldb, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %side.addr = alloca i32, align 4
  %uplo.addr = alloca i32, align 4
  %trans.addr = alloca i32, align 4
  %diag.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %side, i32* %side.addr, align 4
  store i32 %uplo, i32* %uplo.addr, align 4
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %diag, i32* %diag.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %alpha, i8** %alpha.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %side.addr, align 4
  %4 = load i32* %uplo.addr, align 4
  %5 = load i32* %trans.addr, align 4
  %6 = load i32* %diag.addr, align 4
  %7 = load i32* %m.addr, align 4
  %8 = load i32* %n.addr, align 4
  %9 = load i8** %alpha.addr, align 8
  %10 = bitcast i8* %9 to %struct.double2*
  %11 = load i8** %a.addr, align 8
  %12 = bitcast i8* %11 to %struct.double2**
  %13 = load i32* %lda.addr, align 4
  %14 = load i8** %b.addr, align 8
  %15 = bitcast i8* %14 to %struct.double2**
  %16 = load i32* %ldb.addr, align 4
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZtrsmBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, %struct.double2* %10, %struct.double2** %12, i32 %13, %struct.double2** %15, i32 %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasZtrsmBatched(%struct.cublasContext*, i32, i32, i32, i32, i32, i32, %struct.double2*, %struct.double2**, i32, %struct.double2**, i32, i32)

define  i32 @__pgi_device_cublasZmatinvBatched(i8* %h, i32 %n, i8* %a, i32 %lda, i8* %ainv, i32 %lda_inv, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %ainv.addr = alloca i8*, align 8
  %lda_inv.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %ainv, i8** %ainv.addr, align 8
  store i32 %lda_inv, i32* %lda_inv.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %n.addr, align 4
  %4 = load i8** %a.addr, align 8
  %5 = bitcast i8* %4 to %struct.double2**
  %6 = load i32* %lda.addr, align 4
  %7 = load i8** %ainv.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2**
  %9 = load i32* %lda_inv.addr, align 4
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZmatinvBatched(%struct.cublasContext* %2, i32 %3, %struct.double2** %5, i32 %6, %struct.double2** %8, i32 %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZmatinvBatched(%struct.cublasContext*, i32, %struct.double2**, i32, %struct.double2**, i32, i32*, i32)

define  i32 @__pgi_device_cublasZgeqrfBatched(i8* %h, i32 %m, i32 %n, i8* %a, i32 %lda, i8* %tau, i8* %info, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %tau.addr = alloca i8*, align 8
  %info.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %tau, i8** %tau.addr, align 8
  store i8* %info, i8** %info.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %m.addr, align 4
  %4 = load i32* %n.addr, align 4
  %5 = load i8** %a.addr, align 8
  %6 = bitcast i8* %5 to %struct.double2**
  %7 = load i32* %lda.addr, align 4
  %8 = load i8** %tau.addr, align 8
  %9 = bitcast i8* %8 to %struct.double2**
  %10 = load i8** %info.addr, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgeqrfBatched(%struct.cublasContext* %2, i32 %3, i32 %4, %struct.double2** %6, i32 %7, %struct.double2** %9, i32* %11, i32 %12)
  ret i32 %call
}

declare  i32 @cublasZgeqrfBatched(%struct.cublasContext*, i32, i32, %struct.double2**, i32, %struct.double2**, i32*, i32)

define  i32 @__pgi_device_cublasZgelsBatched(i8* %h, i32 %trans, i32 %m, i32 %n, i32 %nrhs, i8* %a, i32 %lda, i8* %c, i32 %ldc, i8* %info, i8* %dinfo, i32 %bc) nounwind alwaysinline {
entry:
  %h.addr = alloca i8*, align 8
  %trans.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %nrhs.addr = alloca i32, align 4
  %a.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %info.addr = alloca i8*, align 8
  %dinfo.addr = alloca i8*, align 8
  %bc.addr = alloca i32, align 4
  store i8* %h, i8** %h.addr, align 8
  store i32 %trans, i32* %trans.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %nrhs, i32* %nrhs.addr, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  store i8* %c, i8** %c.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i8* %info, i8** %info.addr, align 8
  store i8* %dinfo, i8** %dinfo.addr, align 8
  store i32 %bc, i32* %bc.addr, align 4
  %0 = load i8** %h.addr, align 8
  %1 = bitcast i8* %0 to %struct.cublasContext**
  %2 = load %struct.cublasContext** %1, align 8
  %3 = load i32* %trans.addr, align 4
  %4 = load i32* %m.addr, align 4
  %5 = load i32* %n.addr, align 4
  %6 = load i32* %nrhs.addr, align 4
  %7 = load i8** %a.addr, align 8
  %8 = bitcast i8* %7 to %struct.double2**
  %9 = load i32* %lda.addr, align 4
  %10 = load i8** %c.addr, align 8
  %11 = bitcast i8* %10 to %struct.double2**
  %12 = load i32* %ldc.addr, align 4
  %13 = load i8** %info.addr, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i8** %dinfo.addr, align 8
  %16 = bitcast i8* %15 to i32*
  %17 = load i32* %bc.addr, align 4
  %call = call  i32 @cublasZgelsBatched(%struct.cublasContext* %2, i32 %3, i32 %4, i32 %5, i32 %6, %struct.double2** %8, i32 %9, %struct.double2** %11, i32 %12, i32* %14, i32* %16, i32 %17)
  ret i32 %call
}

declare  i32 @cublasZgelsBatched(%struct.cublasContext*, i32, i32, i32, i32, %struct.double2**, i32, %struct.double2**, i32, i32*, i32*, i32)
