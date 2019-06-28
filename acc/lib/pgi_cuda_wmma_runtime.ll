; ModuleID = 'pgi_cuda_wmma_runtime.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx64-unknown"

%struct.__half = type { i16 }
%struct.ushort2 = type { i16, i16 }
%struct.char8 = type { i8, i8, i8, i8, i8, i8, i8, i8 }

define void @__pgi_wmma_ld_a_m16n16k16_rmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.a.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_a_m16n16k16_cmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_b_m16n16k16_rmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.b.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_b_m16n16k16_cmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_c_m16n16k16_r2(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.c.f16.p0i32(i32* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %9 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.c.f16.p0i32(i32* %conv8, i32 %tmp9, i32 1)
  %10 = extractvalue { i32, i32, i32, i32 } %9, 0
  %11 = getelementptr inbounds i32* %conv6, i32 0
  store i32 %10, i32* %11
  %12 = extractvalue { i32, i32, i32, i32 } %9, 1
  %13 = getelementptr inbounds i32* %conv6, i32 1
  store i32 %12, i32* %13
  %14 = extractvalue { i32, i32, i32, i32 } %9, 2
  %15 = getelementptr inbounds i32* %conv6, i32 2
  store i32 %14, i32* %15
  %16 = extractvalue { i32, i32, i32, i32 } %9, 3
  %17 = getelementptr inbounds i32* %conv6, i32 3
  store i32 %16, i32* %17
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.c.f16.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m16n16k16_r2_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.ld.c.f16.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  ret void
}

define void @__pgi_wmma_ld_c_m16n16k16_r4(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.ld.c.f32.p0f32(float* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %17 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.ld.c.f32.p0f32(float* %conv8, i32 %tmp9, i32 1)
  %18 = extractvalue { float, float, float, float, float, float, float, float } %17, 0
  %19 = getelementptr inbounds float* %conv6, i32 0
  store float %18, float* %19
  %20 = extractvalue { float, float, float, float, float, float, float, float } %17, 1
  %21 = getelementptr inbounds float* %conv6, i32 1
  store float %20, float* %21
  %22 = extractvalue { float, float, float, float, float, float, float, float } %17, 2
  %23 = getelementptr inbounds float* %conv6, i32 2
  store float %22, float* %23
  %24 = extractvalue { float, float, float, float, float, float, float, float } %17, 3
  %25 = getelementptr inbounds float* %conv6, i32 3
  store float %24, float* %25
  %26 = extractvalue { float, float, float, float, float, float, float, float } %17, 4
  %27 = getelementptr inbounds float* %conv6, i32 4
  store float %26, float* %27
  %28 = extractvalue { float, float, float, float, float, float, float, float } %17, 5
  %29 = getelementptr inbounds float* %conv6, i32 5
  store float %28, float* %29
  %30 = extractvalue { float, float, float, float, float, float, float, float } %17, 6
  %31 = getelementptr inbounds float* %conv6, i32 6
  store float %30, float* %31
  %32 = extractvalue { float, float, float, float, float, float, float, float } %17, 7
  %33 = getelementptr inbounds float* %conv6, i32 7
  store float %32, float* %33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.ld.c.f32.p0f32(float* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m16n16k16_r4_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.ld.c.f32.p0f32(float* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  ret void
}

define void @__pgi_wmma_ld_a_m32n8k16_rmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.a.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_a_m32n8k16_cmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_b_m32n8k16_rmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.b.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_b_m32n8k16_cmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_c_m32n8k16_r2(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.c.f16.p0i32(i32* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %9 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.c.f16.p0i32(i32* %conv8, i32 %tmp9, i32 1)
  %10 = extractvalue { i32, i32, i32, i32 } %9, 0
  %11 = getelementptr inbounds i32* %conv6, i32 0
  store i32 %10, i32* %11
  %12 = extractvalue { i32, i32, i32, i32 } %9, 1
  %13 = getelementptr inbounds i32* %conv6, i32 1
  store i32 %12, i32* %13
  %14 = extractvalue { i32, i32, i32, i32 } %9, 2
  %15 = getelementptr inbounds i32* %conv6, i32 2
  store i32 %14, i32* %15
  %16 = extractvalue { i32, i32, i32, i32 } %9, 3
  %17 = getelementptr inbounds i32* %conv6, i32 3
  store i32 %16, i32* %17
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.c.f16.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m32n8k16_r2_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.ld.c.f16.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  ret void
}

define void @__pgi_wmma_ld_c_m32n8k16_r4(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.ld.c.f32.p0f32(float* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %17 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.ld.c.f32.p0f32(float* %conv8, i32 %tmp9, i32 1)
  %18 = extractvalue { float, float, float, float, float, float, float, float } %17, 0
  %19 = getelementptr inbounds float* %conv6, i32 0
  store float %18, float* %19
  %20 = extractvalue { float, float, float, float, float, float, float, float } %17, 1
  %21 = getelementptr inbounds float* %conv6, i32 1
  store float %20, float* %21
  %22 = extractvalue { float, float, float, float, float, float, float, float } %17, 2
  %23 = getelementptr inbounds float* %conv6, i32 2
  store float %22, float* %23
  %24 = extractvalue { float, float, float, float, float, float, float, float } %17, 3
  %25 = getelementptr inbounds float* %conv6, i32 3
  store float %24, float* %25
  %26 = extractvalue { float, float, float, float, float, float, float, float } %17, 4
  %27 = getelementptr inbounds float* %conv6, i32 4
  store float %26, float* %27
  %28 = extractvalue { float, float, float, float, float, float, float, float } %17, 5
  %29 = getelementptr inbounds float* %conv6, i32 5
  store float %28, float* %29
  %30 = extractvalue { float, float, float, float, float, float, float, float } %17, 6
  %31 = getelementptr inbounds float* %conv6, i32 6
  store float %30, float* %31
  %32 = extractvalue { float, float, float, float, float, float, float, float } %17, 7
  %33 = getelementptr inbounds float* %conv6, i32 7
  store float %32, float* %33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.ld.c.f32.p0f32(float* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m32n8k16_r4_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.ld.c.f32.p0f32(float* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  ret void
}

define void @__pgi_wmma_ld_a_m8n32k16_rmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.a.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_a_m8n32k16_cmjr(i8* %frag, i8* %p, i32 %lda) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %lda.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %lda, i32* %lda.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %lda.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.a.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_b_m8n32k16_rmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 0)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.b.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_b_m8n32k16_cmjr(i8* %frag, i8* %p, i32 %ldb) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldb.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldb, i32* %ldb.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldb.addr, align 4
  %0 = call { i32, i32, i32, i32, i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.b.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  %9 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 4
  %10 = getelementptr inbounds i32* %conv, i32 4
  store i32 %9, i32* %10
  %11 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 5
  %12 = getelementptr inbounds i32* %conv, i32 5
  store i32 %11, i32* %12
  %13 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 6
  %14 = getelementptr inbounds i32* %conv, i32 6
  store i32 %13, i32* %14
  %15 = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32 } %0, 7
  %16 = getelementptr inbounds i32* %conv, i32 7
  store i32 %15, i32* %16
  ret void
}

define void @__pgi_wmma_ld_c_m8n32k16_r2(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.c.f16.p0i32(i32* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %9 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.c.f16.p0i32(i32* %conv8, i32 %tmp9, i32 1)
  %10 = extractvalue { i32, i32, i32, i32 } %9, 0
  %11 = getelementptr inbounds i32* %conv6, i32 0
  store i32 %10, i32* %11
  %12 = extractvalue { i32, i32, i32, i32 } %9, 1
  %13 = getelementptr inbounds i32* %conv6, i32 1
  store i32 %12, i32* %13
  %14 = extractvalue { i32, i32, i32, i32 } %9, 2
  %15 = getelementptr inbounds i32* %conv6, i32 2
  store i32 %14, i32* %15
  %16 = extractvalue { i32, i32, i32, i32 } %9, 3
  %17 = getelementptr inbounds i32* %conv6, i32 3
  store i32 %16, i32* %17
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.c.f16.p0i32(i32* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m8n32k16_r2_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.ld.c.f16.p0i32(i32* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { i32, i32, i32, i32 } %0, 0
  %2 = getelementptr inbounds i32* %conv, i32 0
  store i32 %1, i32* %2
  %3 = extractvalue { i32, i32, i32, i32 } %0, 1
  %4 = getelementptr inbounds i32* %conv, i32 1
  store i32 %3, i32* %4
  %5 = extractvalue { i32, i32, i32, i32 } %0, 2
  %6 = getelementptr inbounds i32* %conv, i32 2
  store i32 %5, i32* %6
  %7 = extractvalue { i32, i32, i32, i32 } %0, 3
  %8 = getelementptr inbounds i32* %conv, i32 3
  store i32 %7, i32* %8
  ret void
}

define void @__pgi_wmma_ld_c_m8n32k16_r4(i8* %frag, i8* %p, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %p.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.ld.c.f32.p0f32(float* %conv3, i32 %tmp4, i32 0)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %frag.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %p.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %17 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.ld.c.f32.p0f32(float* %conv8, i32 %tmp9, i32 1)
  %18 = extractvalue { float, float, float, float, float, float, float, float } %17, 0
  %19 = getelementptr inbounds float* %conv6, i32 0
  store float %18, float* %19
  %20 = extractvalue { float, float, float, float, float, float, float, float } %17, 1
  %21 = getelementptr inbounds float* %conv6, i32 1
  store float %20, float* %21
  %22 = extractvalue { float, float, float, float, float, float, float, float } %17, 2
  %23 = getelementptr inbounds float* %conv6, i32 2
  store float %22, float* %23
  %24 = extractvalue { float, float, float, float, float, float, float, float } %17, 3
  %25 = getelementptr inbounds float* %conv6, i32 3
  store float %24, float* %25
  %26 = extractvalue { float, float, float, float, float, float, float, float } %17, 4
  %27 = getelementptr inbounds float* %conv6, i32 4
  store float %26, float* %27
  %28 = extractvalue { float, float, float, float, float, float, float, float } %17, 5
  %29 = getelementptr inbounds float* %conv6, i32 5
  store float %28, float* %29
  %30 = extractvalue { float, float, float, float, float, float, float, float } %17, 6
  %31 = getelementptr inbounds float* %conv6, i32 6
  store float %30, float* %31
  %32 = extractvalue { float, float, float, float, float, float, float, float } %17, 7
  %33 = getelementptr inbounds float* %conv6, i32 7
  store float %32, float* %33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.ld.c.f32.p0f32(float* nocapture, i32, i32) #0

define void @__pgi_wmma_ld_c_m8n32k16_r4_cmjr(i8* %frag, i8* %p, i32 %ldc) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %p.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %p, i8** %p.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %p.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.ld.c.f32.p0f32(float* %conv2, i32 %tmp3, i32 1)
  %1 = extractvalue { float, float, float, float, float, float, float, float } %0, 0
  %2 = getelementptr inbounds float* %conv, i32 0
  store float %1, float* %2
  %3 = extractvalue { float, float, float, float, float, float, float, float } %0, 1
  %4 = getelementptr inbounds float* %conv, i32 1
  store float %3, float* %4
  %5 = extractvalue { float, float, float, float, float, float, float, float } %0, 2
  %6 = getelementptr inbounds float* %conv, i32 2
  store float %5, float* %6
  %7 = extractvalue { float, float, float, float, float, float, float, float } %0, 3
  %8 = getelementptr inbounds float* %conv, i32 3
  store float %7, float* %8
  %9 = extractvalue { float, float, float, float, float, float, float, float } %0, 4
  %10 = getelementptr inbounds float* %conv, i32 4
  store float %9, float* %10
  %11 = extractvalue { float, float, float, float, float, float, float, float } %0, 5
  %12 = getelementptr inbounds float* %conv, i32 5
  store float %11, float* %12
  %13 = extractvalue { float, float, float, float, float, float, float, float } %0, 6
  %14 = getelementptr inbounds float* %conv, i32 6
  store float %13, float* %14
  %15 = extractvalue { float, float, float, float, float, float, float, float } %0, 7
  %16 = getelementptr inbounds float* %conv, i32 7
  store float %15, float* %16
  ret void
}

define void @__pgi_wmma_st_c_m16n16k16_r2(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv3, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv3, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv3, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv3, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f16.p0i32(i32* %conv, i32 %tmp4, i32 0, i32 %1, i32 %3, i32 %5, i32 %7)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %8 = getelementptr inbounds i32* %conv8, i32 0
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv8, i32 1
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv8, i32 2
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv8, i32 3
  %15 = load i32* %14
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f16.p0i32(i32* %conv6, i32 %tmp9, i32 1, i32 %9, i32 %11, i32 %13, i32 %15)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m16n16k16.st.c.f16.p0i32(i32* nocapture, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_st_c_m16n16k16_r2_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f16.p0i32(i32* %conv, i32 %tmp3, i32 1, i32 %1, i32 %3, i32 %5, i32 %7)
  ret void
}

define void @__pgi_wmma_st_c_m16n16k16_r4(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv3, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv3, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv3, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv3, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv3, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv3, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv3, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv3, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f32.p0f32(float* %conv, i32 %tmp4, i32 0, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %16 = getelementptr inbounds float* %conv8, i32 0
  %17 = load float* %16
  %18 = getelementptr inbounds float* %conv8, i32 1
  %19 = load float* %18
  %20 = getelementptr inbounds float* %conv8, i32 2
  %21 = load float* %20
  %22 = getelementptr inbounds float* %conv8, i32 3
  %23 = load float* %22
  %24 = getelementptr inbounds float* %conv8, i32 4
  %25 = load float* %24
  %26 = getelementptr inbounds float* %conv8, i32 5
  %27 = load float* %26
  %28 = getelementptr inbounds float* %conv8, i32 6
  %29 = load float* %28
  %30 = getelementptr inbounds float* %conv8, i32 7
  %31 = load float* %30
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f32.p0f32(float* %conv6, i32 %tmp9, i32 1, float %17, float %19, float %21, float %23, float %25, float %27, float %29, float %31)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m16n16k16.st.c.f32.p0f32(float* nocapture, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_st_c_m16n16k16_r4_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv2, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv2, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv2, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv2, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv2, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv2, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv2, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv2, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m16n16k16.st.c.f32.p0f32(float* %conv, i32 %tmp3, i32 1, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  ret void
}

define void @__pgi_wmma_st_c_m32n8k16_r2(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv3, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv3, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv3, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv3, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f16.p0i32(i32* %conv, i32 %tmp4, i32 0, i32 %1, i32 %3, i32 %5, i32 %7)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %8 = getelementptr inbounds i32* %conv8, i32 0
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv8, i32 1
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv8, i32 2
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv8, i32 3
  %15 = load i32* %14
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f16.p0i32(i32* %conv6, i32 %tmp9, i32 1, i32 %9, i32 %11, i32 %13, i32 %15)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m32n8k16.st.c.f16.p0i32(i32* nocapture, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_st_c_m32n8k16_r2_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f16.p0i32(i32* %conv, i32 %tmp3, i32 1, i32 %1, i32 %3, i32 %5, i32 %7)
  ret void
}

define void @__pgi_wmma_st_c_m32n8k16_r4(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv3, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv3, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv3, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv3, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv3, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv3, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv3, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv3, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f32.p0f32(float* %conv, i32 %tmp4, i32 0, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %16 = getelementptr inbounds float* %conv8, i32 0
  %17 = load float* %16
  %18 = getelementptr inbounds float* %conv8, i32 1
  %19 = load float* %18
  %20 = getelementptr inbounds float* %conv8, i32 2
  %21 = load float* %20
  %22 = getelementptr inbounds float* %conv8, i32 3
  %23 = load float* %22
  %24 = getelementptr inbounds float* %conv8, i32 4
  %25 = load float* %24
  %26 = getelementptr inbounds float* %conv8, i32 5
  %27 = load float* %26
  %28 = getelementptr inbounds float* %conv8, i32 6
  %29 = load float* %28
  %30 = getelementptr inbounds float* %conv8, i32 7
  %31 = load float* %30
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f32.p0f32(float* %conv6, i32 %tmp9, i32 1, float %17, float %19, float %21, float %23, float %25, float %27, float %29, float %31)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m32n8k16.st.c.f32.p0f32(float* nocapture, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_st_c_m32n8k16_r4_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv2, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv2, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv2, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv2, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv2, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv2, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv2, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv2, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m32n8k16.st.c.f32.p0f32(float* %conv, i32 %tmp3, i32 1, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  ret void
}

define void @__pgi_wmma_st_c_m8n32k16_r2(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv3, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv3, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv3, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv3, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f16.p0i32(i32* %conv, i32 %tmp4, i32 0, i32 %1, i32 %3, i32 %5, i32 %7)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %tmp9 = load i32* %ldc.addr, align 4
  %8 = getelementptr inbounds i32* %conv8, i32 0
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv8, i32 1
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv8, i32 2
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv8, i32 3
  %15 = load i32* %14
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f16.p0i32(i32* %conv6, i32 %tmp9, i32 1, i32 %9, i32 %11, i32 %13, i32 %15)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m8n32k16.st.c.f16.p0i32(i32* nocapture, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_st_c_m8n32k16_r2_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f16.p0i32(i32* %conv, i32 %tmp3, i32 1, i32 %1, i32 %3, i32 %5, i32 %7)
  ret void
}

define void @__pgi_wmma_st_c_m8n32k16_r4(i8* %p, i8* %frag, i32 %ldc, i32 %layout) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  %layout.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  store i32 %layout, i32* %layout.addr, align 4
  %tmp = load i32* %layout.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i8** %frag.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv3, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv3, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv3, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv3, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv3, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv3, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv3, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv3, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f32.p0f32(float* %conv, i32 %tmp4, i32 0, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp5 = load i8** %p.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %tmp9 = load i32* %ldc.addr, align 4
  %16 = getelementptr inbounds float* %conv8, i32 0
  %17 = load float* %16
  %18 = getelementptr inbounds float* %conv8, i32 1
  %19 = load float* %18
  %20 = getelementptr inbounds float* %conv8, i32 2
  %21 = load float* %20
  %22 = getelementptr inbounds float* %conv8, i32 3
  %23 = load float* %22
  %24 = getelementptr inbounds float* %conv8, i32 4
  %25 = load float* %24
  %26 = getelementptr inbounds float* %conv8, i32 5
  %27 = load float* %26
  %28 = getelementptr inbounds float* %conv8, i32 6
  %29 = load float* %28
  %30 = getelementptr inbounds float* %conv8, i32 7
  %31 = load float* %30
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f32.p0f32(float* %conv6, i32 %tmp9, i32 1, float %17, float %19, float %21, float %23, float %25, float %27, float %29, float %31)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.nvvm.hmma.m8n32k16.st.c.f32.p0f32(float* nocapture, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_st_c_m8n32k16_r4_cmjr(i8* %p, i8* %frag, i32 %ldc) nounwind alwaysinline {
entry:
  %p.addr = alloca i8*, align 8
  %frag.addr = alloca i8*, align 8
  %ldc.addr = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 8
  store i8* %frag, i8** %frag.addr, align 8
  store i32 %ldc, i32* %ldc.addr, align 4
  %tmp = load i8** %p.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %frag.addr, align 8
  %conv2 = bitcast i8* %tmp1 to float*
  %tmp3 = load i32* %ldc.addr, align 4
  %0 = getelementptr inbounds float* %conv2, i32 0
  %1 = load float* %0
  %2 = getelementptr inbounds float* %conv2, i32 1
  %3 = load float* %2
  %4 = getelementptr inbounds float* %conv2, i32 2
  %5 = load float* %4
  %6 = getelementptr inbounds float* %conv2, i32 3
  %7 = load float* %6
  %8 = getelementptr inbounds float* %conv2, i32 4
  %9 = load float* %8
  %10 = getelementptr inbounds float* %conv2, i32 5
  %11 = load float* %10
  %12 = getelementptr inbounds float* %conv2, i32 6
  %13 = load float* %12
  %14 = getelementptr inbounds float* %conv2, i32 7
  %15 = load float* %14
  call void @llvm.nvvm.hmma.m8n32k16.st.c.f32.p0f32(float* %conv, i32 %tmp3, i32 1, float %1, float %3, float %5, float %7, float %9, float %11, float %13, float %15)
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m16n16k16_r2_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m16n16k16_r4_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m16n16k16_r4_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r4_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m16n16k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m16n16k16_r2_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m16n16k16_r2_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m16n16k16.mma.f16.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m32n8k16_r2_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m32n8k16_r4_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m32n8k16_r4_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r4_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m32n8k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m32n8k16_r2_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m32n8k16_r2_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m32n8k16.mma.f16.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m8n32k16_r2_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %ival, align 4
  %tmp = load i32* %ival, align 4
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %tmp, i32* %arrayidx, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %d.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx5 = getelementptr inbounds i32* %conv4, i32 1
  store i32 %tmp2, i32* %arrayidx5, align 4
  %tmp6 = load i32* %ival, align 4
  %tmp7 = load i8** %d.addr, align 8
  %conv8 = bitcast i8* %tmp7 to i32*
  %arrayidx9 = getelementptr inbounds i32* %conv8, i32 2
  store i32 %tmp6, i32* %arrayidx9, align 4
  %tmp10 = load i32* %ival, align 4
  %tmp11 = load i8** %d.addr, align 8
  %conv12 = bitcast i8* %tmp11 to i32*
  %arrayidx13 = getelementptr inbounds i32* %conv12, i32 3
  store i32 %tmp10, i32* %arrayidx13, align 4
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %tmp16 = load i8** %a.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %tmp18 = load i8** %b.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %tmp20 = load i8** %d.addr, align 8
  %conv21 = bitcast i8* %tmp20 to i32*
  %0 = getelementptr inbounds i32* %conv17, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv17, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv17, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv17, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv17, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv17, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv17, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv17, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv19, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv19, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv19, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv19, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv19, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv19, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv19, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv19, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv21, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv21, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv21, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv21, i32 3
  %39 = load i32* %38
  %40 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { i32, i32, i32, i32 } %40, 0
  %42 = getelementptr inbounds i32* %conv15, i32 0
  store i32 %41, i32* %42
  %43 = extractvalue { i32, i32, i32, i32 } %40, 1
  %44 = getelementptr inbounds i32* %conv15, i32 1
  store i32 %43, i32* %44
  %45 = extractvalue { i32, i32, i32, i32 } %40, 2
  %46 = getelementptr inbounds i32* %conv15, i32 2
  store i32 %45, i32* %46
  %47 = extractvalue { i32, i32, i32, i32 } %40, 3
  %48 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %47, i32* %48
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_rmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f16(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f16(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) #0

define void @__pgi_wmma_m8n32k16_r4_rmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f16(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_rmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f16(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_cmjr_r2(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds i32* %conv6, i32 0
  %33 = load i32* %32
  %34 = getelementptr inbounds i32* %conv6, i32 1
  %35 = load i32* %34
  %36 = getelementptr inbounds i32* %conv6, i32 2
  %37 = load i32* %36
  %38 = getelementptr inbounds i32* %conv6, i32 3
  %39 = load i32* %38
  %40 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f16(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, i32 %33, i32 %35, i32 %37, i32 %39)
  %41 = extractvalue { float, float, float, float, float, float, float, float } %40, 0
  %42 = getelementptr inbounds float* %conv, i32 0
  store float %41, float* %42
  %43 = extractvalue { float, float, float, float, float, float, float, float } %40, 1
  %44 = getelementptr inbounds float* %conv, i32 1
  store float %43, float* %44
  %45 = extractvalue { float, float, float, float, float, float, float, float } %40, 2
  %46 = getelementptr inbounds float* %conv, i32 2
  store float %45, float* %46
  %47 = extractvalue { float, float, float, float, float, float, float, float } %40, 3
  %48 = getelementptr inbounds float* %conv, i32 3
  store float %47, float* %48
  %49 = extractvalue { float, float, float, float, float, float, float, float } %40, 4
  %50 = getelementptr inbounds float* %conv, i32 4
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %40, 5
  %52 = getelementptr inbounds float* %conv, i32 5
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %40, 6
  %54 = getelementptr inbounds float* %conv, i32 6
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %40, 7
  %56 = getelementptr inbounds float* %conv, i32 7
  store float %55, float* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

; Function Attrs: nounwind
declare { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m8n32k16_r4_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_rmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_rmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_rmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r4_cmjr_cmjr(i8* %d, i8* %a, i8* %b) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv, i32 %tmp2
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i8** %d.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i8** %a.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i8** %b.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %tmp10 = load i8** %d.addr, align 8
  %conv11 = bitcast i8* %tmp10 to float*
  %0 = getelementptr inbounds i32* %conv7, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv7, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv7, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv7, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv7, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv7, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv7, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv7, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv9, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv9, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv9, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv9, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv9, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv9, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv9, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv9, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv11, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv11, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv11, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv11, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv11, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv11, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv11, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv11, i32 7
  %47 = load float* %46
  %48 = call { float, float, float, float, float, float, float, float } @llvm.nvvm.hmma.m8n32k16.mma.f32.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { float, float, float, float, float, float, float, float } %48, 0
  %50 = getelementptr inbounds float* %conv5, i32 0
  store float %49, float* %50
  %51 = extractvalue { float, float, float, float, float, float, float, float } %48, 1
  %52 = getelementptr inbounds float* %conv5, i32 1
  store float %51, float* %52
  %53 = extractvalue { float, float, float, float, float, float, float, float } %48, 2
  %54 = getelementptr inbounds float* %conv5, i32 2
  store float %53, float* %54
  %55 = extractvalue { float, float, float, float, float, float, float, float } %48, 3
  %56 = getelementptr inbounds float* %conv5, i32 3
  store float %55, float* %56
  %57 = extractvalue { float, float, float, float, float, float, float, float } %48, 4
  %58 = getelementptr inbounds float* %conv5, i32 4
  store float %57, float* %58
  %59 = extractvalue { float, float, float, float, float, float, float, float } %48, 5
  %60 = getelementptr inbounds float* %conv5, i32 5
  store float %59, float* %60
  %61 = extractvalue { float, float, float, float, float, float, float, float } %48, 6
  %62 = getelementptr inbounds float* %conv5, i32 6
  store float %61, float* %62
  %63 = extractvalue { float, float, float, float, float, float, float, float } %48, 7
  %64 = getelementptr inbounds float* %conv5, i32 7
  store float %63, float* %64
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_rmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f32(i32 0, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

; Function Attrs: nounwind
declare { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f32(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float) #0

define void @__pgi_wmma_m8n32k16_r2_rmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f32(i32 1, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_rmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f32(i32 2, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define void @__pgi_wmma_m8n32k16_r2_cmjr_cmjr_r4(i8* %d, i8* %a, i8* %b, i8* %c) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i8*, align 8
  store i8* %d, i8** %d.addr, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %c, i8** %c.addr, align 8
  %tmp = load i8** %d.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i8** %a.addr, align 8
  %conv2 = bitcast i8* %tmp1 to i32*
  %tmp3 = load i8** %b.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i8** %c.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %0 = getelementptr inbounds i32* %conv2, i32 0
  %1 = load i32* %0
  %2 = getelementptr inbounds i32* %conv2, i32 1
  %3 = load i32* %2
  %4 = getelementptr inbounds i32* %conv2, i32 2
  %5 = load i32* %4
  %6 = getelementptr inbounds i32* %conv2, i32 3
  %7 = load i32* %6
  %8 = getelementptr inbounds i32* %conv2, i32 4
  %9 = load i32* %8
  %10 = getelementptr inbounds i32* %conv2, i32 5
  %11 = load i32* %10
  %12 = getelementptr inbounds i32* %conv2, i32 6
  %13 = load i32* %12
  %14 = getelementptr inbounds i32* %conv2, i32 7
  %15 = load i32* %14
  %16 = getelementptr inbounds i32* %conv4, i32 0
  %17 = load i32* %16
  %18 = getelementptr inbounds i32* %conv4, i32 1
  %19 = load i32* %18
  %20 = getelementptr inbounds i32* %conv4, i32 2
  %21 = load i32* %20
  %22 = getelementptr inbounds i32* %conv4, i32 3
  %23 = load i32* %22
  %24 = getelementptr inbounds i32* %conv4, i32 4
  %25 = load i32* %24
  %26 = getelementptr inbounds i32* %conv4, i32 5
  %27 = load i32* %26
  %28 = getelementptr inbounds i32* %conv4, i32 6
  %29 = load i32* %28
  %30 = getelementptr inbounds i32* %conv4, i32 7
  %31 = load i32* %30
  %32 = getelementptr inbounds float* %conv6, i32 0
  %33 = load float* %32
  %34 = getelementptr inbounds float* %conv6, i32 1
  %35 = load float* %34
  %36 = getelementptr inbounds float* %conv6, i32 2
  %37 = load float* %36
  %38 = getelementptr inbounds float* %conv6, i32 3
  %39 = load float* %38
  %40 = getelementptr inbounds float* %conv6, i32 4
  %41 = load float* %40
  %42 = getelementptr inbounds float* %conv6, i32 5
  %43 = load float* %42
  %44 = getelementptr inbounds float* %conv6, i32 6
  %45 = load float* %44
  %46 = getelementptr inbounds float* %conv6, i32 7
  %47 = load float* %46
  %48 = call { i32, i32, i32, i32 } @llvm.nvvm.hmma.m8n32k16.mma.f16.f32(i32 3, i32 0, i32 %1, i32 %3, i32 %5, i32 %7, i32 %9, i32 %11, i32 %13, i32 %15, i32 %17, i32 %19, i32 %21, i32 %23, i32 %25, i32 %27, i32 %29, i32 %31, float %33, float %35, float %37, float %39, float %41, float %43, float %45, float %47)
  %49 = extractvalue { i32, i32, i32, i32 } %48, 0
  %50 = getelementptr inbounds i32* %conv, i32 0
  store i32 %49, i32* %50
  %51 = extractvalue { i32, i32, i32, i32 } %48, 1
  %52 = getelementptr inbounds i32* %conv, i32 1
  store i32 %51, i32* %52
  %53 = extractvalue { i32, i32, i32, i32 } %48, 2
  %54 = getelementptr inbounds i32* %conv, i32 2
  store i32 %53, i32* %54
  %55 = extractvalue { i32, i32, i32, i32 } %48, 3
  %56 = getelementptr inbounds i32* %conv, i32 3
  store i32 %55, i32* %56
  ret void
}

define float @__pgi_half2float(i16 zeroext %h) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %h.addr = alloca i16, align 2
  %val = alloca float, align 4
  store i16 %h, i16* %h.addr, align 2
  %tmp = load i16* %h.addr, align 2
  %0 = call float asm sideeffect "cvt.f32.f16 $0, $1;", "=f,h"(i16 %tmp) #0
  store float %0, float* %val, align 4
  %tmp1 = load float* %val, align 4
  store float %tmp1, float* %retval, align 4
  %1 = load float* %retval, align 4
  ret float %1
}

define zeroext i16 @__pgi_float2us_rn(float %x) nounwind alwaysinline {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca float, align 4
  %val = alloca i16, align 2
  store float %x, float* %x.addr, align 4
  %tmp = load float* %x.addr, align 4
  %0 = call i16 asm sideeffect "cvt.rn.f16.f32 $0, $1;", "=h,f"(float %tmp) #0
  store i16 %0, i16* %val, align 2
  %tmp1 = load i16* %val, align 2
  store i16 %tmp1, i16* %retval, align 2
  %1 = load i16* %retval, align 2
  ret i16 %1
}

define %struct.__half @__pgi_float2half_rn(float %x) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca float, align 4
  %val = alloca %struct.__half, align 2
  store float %x, float* %x.addr, align 4
  %conv = bitcast %struct.__half* %val to i16*
  %tmp = load float* %x.addr, align 4
  %0 = call i16 asm sideeffect "cvt.rn.f16.f32 $0, $1;", "=h,f"(float %tmp) #0
  store i16 %0, i16* %conv, align 2
  %1 = load %struct.__half* %val, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define i32 @__pgi_float2half2_rn(float %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca float, align 4
  %val = alloca i32, align 4
  store float %x, float* %x.addr, align 4
  %tmp = load float* %x.addr, align 4
  %0 = call i32 asm sideeffect "{.reg .f16 low;\0Acvt.rn.f16.f32 low, $1;\0Amov.b32 $0, {low,low};}\0A", "=r,f"(float %tmp) #0
  store i32 %0, i32* %val, align 4
  %tmp1 = load i32* %val, align 4
  store i32 %tmp1, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define void @__pgi_real2_assign2real4(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %a = alloca i16, align 2
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i16* %a, align 2
  %call = call float @__pgi_half2float(i16 zeroext %tmp2)
  %tmp3 = load i8** %y.addr, align 8
  %conv4 = bitcast i8* %tmp3 to float*
  %arrayidx = getelementptr inbounds float* %conv4, i32 0
  store float %call, float* %arrayidx, align 4
  ret void
}

define void @__pgi_real4_assign2real2(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %a = alloca float, align 4
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %tmp1 = load float* %conv, align 4
  store float %tmp1, float* %a, align 4
  %tmp2 = load float* %a, align 4
  %call = call zeroext i16 @__pgi_float2us_rn(float %tmp2)
  %tmp3 = load i8** %y.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i16*
  %arrayidx = getelementptr inbounds i16* %conv4, i32 0
  store i16 %call, i16* %arrayidx, align 2
  ret void
}

define void @__pgi_halves2half2(i8* %z, i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %z.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i8* %z, i8** %z.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  %tmp5 = load i16* %a, align 2
  %tmp6 = load i16* %b, align 2
  %0 = call i32 asm sideeffect "mov.b32 $0, {$1, $2};", "=r,h,h"(i16 %tmp5, i16 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  %tmp8 = load i8** %z.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i32*
  %arrayidx = getelementptr inbounds i32* %conv9, i32 0
  store i32 %tmp7, i32* %arrayidx, align 4
  ret void
}

define %struct.ushort2 @__pgi_make_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val2 = alloca %struct.ushort2, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  %tmp2 = getelementptr inbounds %struct.ushort2* %val2, i32 0, i32 0
  store i16 %tmp1, i16* %tmp2, align 4
  %tmp3 = load i8** %y.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i16*
  %tmp5 = load i16* %conv4, align 2
  %tmp6 = getelementptr inbounds %struct.ushort2* %val2, i32 0, i32 1
  store i16 %tmp5, i16* %tmp6, align 2
  %0 = load %struct.ushort2* %val2, align 4
  store %struct.ushort2 %0, %struct.ushort2* %retval, align 4
  %1 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %1
}

define i32 @__pgi_make_v2real2from1(i16 zeroext %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i16, align 2
  %val = alloca i32, align 4
  store i16 %x, i16* %x.addr, align 2
  %tmp = load i16* %x.addr, align 2
  %tmp1 = load i16* %x.addr, align 2
  %0 = call i32 asm sideeffect "mov.b32 $0, {$1, $2};", "=r,h,h"(i16 %tmp, i16 %tmp1) #0
  store i32 %0, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  store i32 %tmp2, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define void @__pgi_wmma_fill_frag_accr2(i8* %frag, i8* %val) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %val, i8** %val.addr, align 8
  %tmp = load i8** %val.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %tmp1)
  store i32 %call, i32* %ival, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %frag.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx = getelementptr inbounds i32* %conv4, i32 0
  store i32 %tmp2, i32* %arrayidx, align 4
  %tmp5 = load i32* %ival, align 4
  %tmp6 = load i8** %frag.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %arrayidx8 = getelementptr inbounds i32* %conv7, i32 1
  store i32 %tmp5, i32* %arrayidx8, align 4
  %tmp9 = load i32* %ival, align 4
  %tmp10 = load i8** %frag.addr, align 8
  %conv11 = bitcast i8* %tmp10 to i32*
  %arrayidx12 = getelementptr inbounds i32* %conv11, i32 2
  store i32 %tmp9, i32* %arrayidx12, align 4
  %tmp13 = load i32* %ival, align 4
  %tmp14 = load i8** %frag.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %arrayidx16 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %tmp13, i32* %arrayidx16, align 4
  ret void
}

define void @__pgi_wmma_fill_frag_accr4(i8* %frag, float %val) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store float %val, float* %val.addr, align 4
  %tmp = load float* %val.addr, align 4
  %tmp1 = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp1 to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  store float %tmp, float* %arrayidx, align 4
  %tmp2 = load float* %val.addr, align 4
  %tmp3 = load i8** %frag.addr, align 8
  %conv4 = bitcast i8* %tmp3 to float*
  %arrayidx5 = getelementptr inbounds float* %conv4, i32 1
  store float %tmp2, float* %arrayidx5, align 4
  %tmp6 = load float* %val.addr, align 4
  %tmp7 = load i8** %frag.addr, align 8
  %conv8 = bitcast i8* %tmp7 to float*
  %arrayidx9 = getelementptr inbounds float* %conv8, i32 2
  store float %tmp6, float* %arrayidx9, align 4
  %tmp10 = load float* %val.addr, align 4
  %tmp11 = load i8** %frag.addr, align 8
  %conv12 = bitcast i8* %tmp11 to float*
  %arrayidx13 = getelementptr inbounds float* %conv12, i32 3
  store float %tmp10, float* %arrayidx13, align 4
  %tmp14 = load float* %val.addr, align 4
  %tmp15 = load i8** %frag.addr, align 8
  %conv16 = bitcast i8* %tmp15 to float*
  %arrayidx17 = getelementptr inbounds float* %conv16, i32 4
  store float %tmp14, float* %arrayidx17, align 4
  %tmp18 = load float* %val.addr, align 4
  %tmp19 = load i8** %frag.addr, align 8
  %conv20 = bitcast i8* %tmp19 to float*
  %arrayidx21 = getelementptr inbounds float* %conv20, i32 5
  store float %tmp18, float* %arrayidx21, align 4
  %tmp22 = load float* %val.addr, align 4
  %tmp23 = load i8** %frag.addr, align 8
  %conv24 = bitcast i8* %tmp23 to float*
  %arrayidx25 = getelementptr inbounds float* %conv24, i32 6
  store float %tmp22, float* %arrayidx25, align 4
  %tmp26 = load float* %val.addr, align 4
  %tmp27 = load i8** %frag.addr, align 8
  %conv28 = bitcast i8* %tmp27 to float*
  %arrayidx29 = getelementptr inbounds float* %conv28, i32 7
  store float %tmp26, float* %arrayidx29, align 4
  ret void
}

define void @__pgi_wmma_fill_frag_ab(i8* %frag, i8* %val) nounwind alwaysinline {
entry:
  %frag.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %ival = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  store i8* %val, i8** %val.addr, align 8
  %tmp = load i8** %val.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %tmp1)
  store i32 %call, i32* %ival, align 4
  %tmp2 = load i32* %ival, align 4
  %tmp3 = load i8** %frag.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %arrayidx = getelementptr inbounds i32* %conv4, i32 0
  store i32 %tmp2, i32* %arrayidx, align 4
  %tmp5 = load i32* %ival, align 4
  %tmp6 = load i8** %frag.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %arrayidx8 = getelementptr inbounds i32* %conv7, i32 1
  store i32 %tmp5, i32* %arrayidx8, align 4
  %tmp9 = load i32* %ival, align 4
  %tmp10 = load i8** %frag.addr, align 8
  %conv11 = bitcast i8* %tmp10 to i32*
  %arrayidx12 = getelementptr inbounds i32* %conv11, i32 2
  store i32 %tmp9, i32* %arrayidx12, align 4
  %tmp13 = load i32* %ival, align 4
  %tmp14 = load i8** %frag.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i32*
  %arrayidx16 = getelementptr inbounds i32* %conv15, i32 3
  store i32 %tmp13, i32* %arrayidx16, align 4
  %tmp17 = load i32* %ival, align 4
  %tmp18 = load i8** %frag.addr, align 8
  %conv19 = bitcast i8* %tmp18 to i32*
  %arrayidx20 = getelementptr inbounds i32* %conv19, i32 4
  store i32 %tmp17, i32* %arrayidx20, align 4
  %tmp21 = load i32* %ival, align 4
  %tmp22 = load i8** %frag.addr, align 8
  %conv23 = bitcast i8* %tmp22 to i32*
  %arrayidx24 = getelementptr inbounds i32* %conv23, i32 5
  store i32 %tmp21, i32* %arrayidx24, align 4
  %tmp25 = load i32* %ival, align 4
  %tmp26 = load i8** %frag.addr, align 8
  %conv27 = bitcast i8* %tmp26 to i32*
  %arrayidx28 = getelementptr inbounds i32* %conv27, i32 6
  store i32 %tmp25, i32* %arrayidx28, align 4
  %tmp29 = load i32* %ival, align 4
  %tmp30 = load i8** %frag.addr, align 8
  %conv31 = bitcast i8* %tmp30 to i32*
  %arrayidx32 = getelementptr inbounds i32* %conv31, i32 7
  store i32 %tmp29, i32* %arrayidx32, align 4
  ret void
}

define void @__pgi_wmma_copy_frag_accr2(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  %tmp1 = load i32* %arrayidx, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %arrayidx4 = getelementptr inbounds i32* %conv3, i32 0
  store i32 %tmp1, i32* %arrayidx4, align 4
  %tmp5 = load i8** %x.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %arrayidx7 = getelementptr inbounds i32* %conv6, i32 1
  %tmp8 = load i32* %arrayidx7, align 4
  %tmp9 = load i8** %y.addr, align 8
  %conv10 = bitcast i8* %tmp9 to i32*
  %arrayidx11 = getelementptr inbounds i32* %conv10, i32 1
  store i32 %tmp8, i32* %arrayidx11, align 4
  %tmp12 = load i8** %x.addr, align 8
  %conv13 = bitcast i8* %tmp12 to i32*
  %arrayidx14 = getelementptr inbounds i32* %conv13, i32 2
  %tmp15 = load i32* %arrayidx14, align 4
  %tmp16 = load i8** %y.addr, align 8
  %conv17 = bitcast i8* %tmp16 to i32*
  %arrayidx18 = getelementptr inbounds i32* %conv17, i32 2
  store i32 %tmp15, i32* %arrayidx18, align 4
  %tmp19 = load i8** %x.addr, align 8
  %conv20 = bitcast i8* %tmp19 to i32*
  %arrayidx21 = getelementptr inbounds i32* %conv20, i32 3
  %tmp22 = load i32* %arrayidx21, align 4
  %tmp23 = load i8** %y.addr, align 8
  %conv24 = bitcast i8* %tmp23 to i32*
  %arrayidx25 = getelementptr inbounds i32* %conv24, i32 3
  store i32 %tmp22, i32* %arrayidx25, align 4
  ret void
}

define void @__pgi_wmma_copy_frag_accr4(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  %tmp1 = load float* %arrayidx, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %arrayidx4 = getelementptr inbounds float* %conv3, i32 0
  store float %tmp1, float* %arrayidx4, align 4
  %tmp5 = load i8** %x.addr, align 8
  %conv6 = bitcast i8* %tmp5 to float*
  %arrayidx7 = getelementptr inbounds float* %conv6, i32 1
  %tmp8 = load float* %arrayidx7, align 4
  %tmp9 = load i8** %y.addr, align 8
  %conv10 = bitcast i8* %tmp9 to float*
  %arrayidx11 = getelementptr inbounds float* %conv10, i32 1
  store float %tmp8, float* %arrayidx11, align 4
  %tmp12 = load i8** %x.addr, align 8
  %conv13 = bitcast i8* %tmp12 to float*
  %arrayidx14 = getelementptr inbounds float* %conv13, i32 2
  %tmp15 = load float* %arrayidx14, align 4
  %tmp16 = load i8** %y.addr, align 8
  %conv17 = bitcast i8* %tmp16 to float*
  %arrayidx18 = getelementptr inbounds float* %conv17, i32 2
  store float %tmp15, float* %arrayidx18, align 4
  %tmp19 = load i8** %x.addr, align 8
  %conv20 = bitcast i8* %tmp19 to float*
  %arrayidx21 = getelementptr inbounds float* %conv20, i32 3
  %tmp22 = load float* %arrayidx21, align 4
  %tmp23 = load i8** %y.addr, align 8
  %conv24 = bitcast i8* %tmp23 to float*
  %arrayidx25 = getelementptr inbounds float* %conv24, i32 3
  store float %tmp22, float* %arrayidx25, align 4
  %tmp26 = load i8** %x.addr, align 8
  %conv27 = bitcast i8* %tmp26 to float*
  %arrayidx28 = getelementptr inbounds float* %conv27, i32 4
  %tmp29 = load float* %arrayidx28, align 4
  %tmp30 = load i8** %y.addr, align 8
  %conv31 = bitcast i8* %tmp30 to float*
  %arrayidx32 = getelementptr inbounds float* %conv31, i32 4
  store float %tmp29, float* %arrayidx32, align 4
  %tmp33 = load i8** %x.addr, align 8
  %conv34 = bitcast i8* %tmp33 to float*
  %arrayidx35 = getelementptr inbounds float* %conv34, i32 5
  %tmp36 = load float* %arrayidx35, align 4
  %tmp37 = load i8** %y.addr, align 8
  %conv38 = bitcast i8* %tmp37 to float*
  %arrayidx39 = getelementptr inbounds float* %conv38, i32 5
  store float %tmp36, float* %arrayidx39, align 4
  %tmp40 = load i8** %x.addr, align 8
  %conv41 = bitcast i8* %tmp40 to float*
  %arrayidx42 = getelementptr inbounds float* %conv41, i32 6
  %tmp43 = load float* %arrayidx42, align 4
  %tmp44 = load i8** %y.addr, align 8
  %conv45 = bitcast i8* %tmp44 to float*
  %arrayidx46 = getelementptr inbounds float* %conv45, i32 6
  store float %tmp43, float* %arrayidx46, align 4
  %tmp47 = load i8** %x.addr, align 8
  %conv48 = bitcast i8* %tmp47 to float*
  %arrayidx49 = getelementptr inbounds float* %conv48, i32 7
  %tmp50 = load float* %arrayidx49, align 4
  %tmp51 = load i8** %y.addr, align 8
  %conv52 = bitcast i8* %tmp51 to float*
  %arrayidx53 = getelementptr inbounds float* %conv52, i32 7
  store float %tmp50, float* %arrayidx53, align 4
  ret void
}

define %struct.char8 @__pgi_wmma_cmpeq_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpeq_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpeq_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp oeq float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpeq_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpeq_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp oeq float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpne_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpne_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpne_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp une float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpne_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpne_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp une float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmplt_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.lt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmplt_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.lt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmplt_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp olt float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmplt_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.lt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmplt_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp olt float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpgt_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.gt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpgt_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.gt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpgt_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp ogt float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpgt_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.gt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpgt_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp ogt float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmple_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.le.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmple_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.le.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmple_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp ole float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmple_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.le.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmple_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp ole float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpge_cm16n16k16r2s(i8* %sa, float %bval) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %bval.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %bval, float* %bval.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load float* %bval.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i8** %sa.addr, align 8
  %conv4 = bitcast i8* %tmp3 to i32*
  %tmp5 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv4, i32 %tmp5
  %tmp6 = load i32* %arrayidx, align 4
  store i32 %tmp6, i32* %a, align 4
  %tmp7 = load i32* %a, align 4
  %tmp8 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ge.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp7, i32 %tmp8) #0
  store i32 %0, i32* %val, align 4
  %tmp9 = load i32* %val, align 4
  %and = and i32 %tmp9, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  %tmp11 = load i8** %lres, align 8
  %tmp12 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp12
  %arrayidx13 = getelementptr inbounds i8* %tmp11, i32 %mul
  store i8 %conv10, i8* %arrayidx13, align 1
  %tmp14 = load i32* %val, align 4
  %and15 = and i32 %tmp14, -65536
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %cond.true17, label %cond.false18

cond.true17:                                      ; preds = %cond.end
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true17
  %cond20 = phi i32 [ 1, %cond.true17 ], [ 0, %cond.false18 ]
  %conv21 = trunc i32 %cond20 to i8
  %tmp22 = load i8** %lres, align 8
  %tmp23 = load i32* %i, align 4
  %mul24 = mul nsw i32 2, %tmp23
  %add = add nsw i32 %mul24, 1
  %arrayidx25 = getelementptr inbounds i8* %tmp22, i32 %add
  store i8 %conv21, i8* %arrayidx25, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %tmp26 = load i32* %i, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpge_cm16n16k16r2sr2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %val = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  %tmp = load i8** %sb.addr, align 8
  %tmp1 = load i8* %tmp, align 1
  %conv2 = sext i8 %tmp1 to i16
  %call = call i32 @__pgi_make_v2real2from1(i16 zeroext %conv2)
  store i32 %call, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp3 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp3, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i8** %sa.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv6, i32 %tmp7
  %tmp8 = load i32* %arrayidx, align 4
  store i32 %tmp8, i32* %a, align 4
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ge.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp9, i32 %tmp10) #0
  store i32 %0, i32* %val, align 4
  %tmp11 = load i32* %val, align 4
  %and = and i32 %tmp11, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv12 = trunc i32 %cond to i8
  %tmp13 = load i8** %lres, align 8
  %tmp14 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp14
  %arrayidx15 = getelementptr inbounds i8* %tmp13, i32 %mul
  store i8 %conv12, i8* %arrayidx15, align 1
  %tmp16 = load i32* %val, align 4
  %and17 = and i32 %tmp16, -65536
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true19, label %cond.false20

cond.true19:                                      ; preds = %cond.end
  br label %cond.end21

cond.false20:                                     ; preds = %cond.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true19
  %cond22 = phi i32 [ 1, %cond.true19 ], [ 0, %cond.false20 ]
  %conv23 = trunc i32 %cond22 to i8
  %tmp24 = load i8** %lres, align 8
  %tmp25 = load i32* %i, align 4
  %mul26 = mul nsw i32 2, %tmp25
  %add = add nsw i32 %mul26, 1
  %arrayidx27 = getelementptr inbounds i8* %tmp24, i32 %add
  store i8 %conv23, i8* %arrayidx27, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end21
  %tmp28 = load i32* %i, align 4
  %inc = add nsw i32 %tmp28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpge_cm16n16k16r4s(i8* %sa, float %val) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %val.addr = alloca float, align 4
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store float %val, float* %val.addr, align 4
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load float* %val.addr, align 4
  %cmp7 = fcmp oge float %tmp5, %tmp6
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv9 = trunc i32 %cond to i8
  %tmp10 = load i8** %lres, align 8
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8* %tmp10, i32 %tmp11
  store i8 %conv9, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define %struct.char8 @__pgi_wmma_cmpge_cm16n16k16r2(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %val = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv3, i32 %tmp4
  %tmp5 = load i32* %arrayidx, align 4
  store i32 %tmp5, i32* %a, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to i32*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i32* %conv7, i32 %tmp8
  %tmp10 = load i32* %arrayidx9, align 4
  store i32 %tmp10, i32* %b, align 4
  %tmp11 = load i32* %a, align 4
  %tmp12 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ge.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp11, i32 %tmp12) #0
  store i32 %0, i32* %val, align 4
  %tmp13 = load i32* %val, align 4
  %and = and i32 %tmp13, 65535
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv14 = trunc i32 %cond to i8
  %tmp15 = load i8** %lres, align 8
  %tmp16 = load i32* %i, align 4
  %mul = mul nsw i32 2, %tmp16
  %arrayidx17 = getelementptr inbounds i8* %tmp15, i32 %mul
  store i8 %conv14, i8* %arrayidx17, align 1
  %tmp18 = load i32* %val, align 4
  %and19 = and i32 %tmp18, -65536
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %cond.end
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i32 [ 1, %cond.true21 ], [ 0, %cond.false22 ]
  %conv25 = trunc i32 %cond24 to i8
  %tmp26 = load i8** %lres, align 8
  %tmp27 = load i32* %i, align 4
  %mul28 = mul nsw i32 2, %tmp27
  %add = add nsw i32 %mul28, 1
  %arrayidx29 = getelementptr inbounds i8* %tmp26, i32 %add
  store i8 %conv25, i8* %arrayidx29, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %1 = load %struct.char8* %llres, align 8
  store %struct.char8 %1, %struct.char8* %retval, align 8
  %2 = load %struct.char8* %retval, align 8
  ret %struct.char8 %2
}

define %struct.char8 @__pgi_wmma_cmpge_cm16n16k16r4(i8* %sa, i8* %sb) nounwind alwaysinline {
entry:
  %retval = alloca %struct.char8, align 8
  %sa.addr = alloca i8*, align 8
  %sb.addr = alloca i8*, align 8
  %llres = alloca %struct.char8, align 8
  %lres = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %sa, i8** %sa.addr, align 8
  store i8* %sb, i8** %sb.addr, align 8
  %conv = bitcast %struct.char8* %llres to i8*
  store i8* %conv, i8** %lres, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i8** %sa.addr, align 8
  %conv3 = bitcast i8* %tmp2 to float*
  %tmp4 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds float* %conv3, i32 %tmp4
  %tmp5 = load float* %arrayidx, align 4
  %tmp6 = load i8** %sb.addr, align 8
  %conv7 = bitcast i8* %tmp6 to float*
  %tmp8 = load i32* %i, align 4
  %arrayidx9 = getelementptr inbounds float* %conv7, i32 %tmp8
  %tmp10 = load float* %arrayidx9, align 4
  %cmp11 = fcmp oge float %tmp5, %tmp10
  br i1 %cmp11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ 0, %cond.false ]
  %conv13 = trunc i32 %cond to i8
  %tmp14 = load i8** %lres, align 8
  %tmp15 = load i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8* %tmp14, i32 %tmp15
  store i8 %conv13, i8* %arrayidx16, align 1
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = load %struct.char8* %llres, align 8
  store %struct.char8 %0, %struct.char8* %retval, align 8
  %1 = load %struct.char8* %retval, align 8
  ret %struct.char8 %1
}

define i32 @__pgi_wmma_any_wmmalogical1(i8* %lvals) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %lvals.addr = alloca i8*, align 8
  %lcount = alloca i32, align 4
  %lnbr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %lvals, i8** %lvals.addr, align 8
  store i32 0, i32* %lcount, align 4
  store i32 0, i32* %lnbr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %lvals.addr, align 8
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i8* %tmp1, i32 %tmp2
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %lcount, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %lcount, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp5 = load i32* %i, align 4
  %inc6 = add nsw i32 %tmp5, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = load i32* %lcount, align 4
  %call = call i32 @__pgi_shfl_xori2(i32 %tmp7, i32 1)
  store i32 %call, i32* %lnbr, align 4
  %tmp8 = load i32* %lcount, align 4
  %tmp9 = load i32* %lnbr, align 4
  %add = add nsw i32 %tmp8, %tmp9
  store i32 %add, i32* %lcount, align 4
  %tmp10 = load i32* %lcount, align 4
  %call11 = call i32 @__pgi_shfl_xori2(i32 %tmp10, i32 2)
  store i32 %call11, i32* %lnbr, align 4
  %tmp12 = load i32* %lcount, align 4
  %tmp13 = load i32* %lnbr, align 4
  %add14 = add nsw i32 %tmp12, %tmp13
  store i32 %add14, i32* %lcount, align 4
  %tmp15 = load i32* %lcount, align 4
  %call16 = call i32 @__pgi_shfl_xori2(i32 %tmp15, i32 4)
  store i32 %call16, i32* %lnbr, align 4
  %tmp17 = load i32* %lcount, align 4
  %tmp18 = load i32* %lnbr, align 4
  %add19 = add nsw i32 %tmp17, %tmp18
  store i32 %add19, i32* %lcount, align 4
  %tmp20 = load i32* %lcount, align 4
  %call21 = call i32 @__pgi_shfl_xori2(i32 %tmp20, i32 8)
  store i32 %call21, i32* %lnbr, align 4
  %tmp22 = load i32* %lcount, align 4
  %tmp23 = load i32* %lnbr, align 4
  %add24 = add nsw i32 %tmp22, %tmp23
  store i32 %add24, i32* %lcount, align 4
  %tmp25 = load i32* %lcount, align 4
  %call26 = call i32 @__pgi_shfl_xori2(i32 %tmp25, i32 16)
  store i32 %call26, i32* %lnbr, align 4
  %tmp27 = load i32* %lcount, align 4
  %tmp28 = load i32* %lnbr, align 4
  %add29 = add nsw i32 %tmp27, %tmp28
  store i32 %add29, i32* %lcount, align 4
  %tmp30 = load i32* %lcount, align 4
  %cmp31 = icmp sgt i32 %tmp30, 0
  %conv = zext i1 %cmp31 to i32
  store i32 %conv, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

declare i32 @__pgi_shfl_xori2(i32, i32)

define i32 @__pgi_wmma_all_wmmalogical1(i8* %lvals) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %lvals.addr = alloca i8*, align 8
  %lcount = alloca i32, align 4
  %lnbr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %lvals, i8** %lvals.addr, align 8
  store i32 0, i32* %lcount, align 4
  store i32 0, i32* %lnbr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %lvals.addr, align 8
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i8* %tmp1, i32 %tmp2
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %lcount, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %lcount, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp5 = load i32* %i, align 4
  %inc6 = add nsw i32 %tmp5, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = load i32* %lcount, align 4
  %call = call i32 @__pgi_shfl_xori2(i32 %tmp7, i32 1)
  store i32 %call, i32* %lnbr, align 4
  %tmp8 = load i32* %lcount, align 4
  %tmp9 = load i32* %lnbr, align 4
  %add = add nsw i32 %tmp8, %tmp9
  store i32 %add, i32* %lcount, align 4
  %tmp10 = load i32* %lcount, align 4
  %call11 = call i32 @__pgi_shfl_xori2(i32 %tmp10, i32 2)
  store i32 %call11, i32* %lnbr, align 4
  %tmp12 = load i32* %lcount, align 4
  %tmp13 = load i32* %lnbr, align 4
  %add14 = add nsw i32 %tmp12, %tmp13
  store i32 %add14, i32* %lcount, align 4
  %tmp15 = load i32* %lcount, align 4
  %call16 = call i32 @__pgi_shfl_xori2(i32 %tmp15, i32 4)
  store i32 %call16, i32* %lnbr, align 4
  %tmp17 = load i32* %lcount, align 4
  %tmp18 = load i32* %lnbr, align 4
  %add19 = add nsw i32 %tmp17, %tmp18
  store i32 %add19, i32* %lcount, align 4
  %tmp20 = load i32* %lcount, align 4
  %call21 = call i32 @__pgi_shfl_xori2(i32 %tmp20, i32 8)
  store i32 %call21, i32* %lnbr, align 4
  %tmp22 = load i32* %lcount, align 4
  %tmp23 = load i32* %lnbr, align 4
  %add24 = add nsw i32 %tmp22, %tmp23
  store i32 %add24, i32* %lcount, align 4
  %tmp25 = load i32* %lcount, align 4
  %call26 = call i32 @__pgi_shfl_xori2(i32 %tmp25, i32 16)
  store i32 %call26, i32* %lnbr, align 4
  %tmp27 = load i32* %lcount, align 4
  %tmp28 = load i32* %lnbr, align 4
  %add29 = add nsw i32 %tmp27, %tmp28
  store i32 %add29, i32* %lcount, align 4
  %tmp30 = load i32* %lcount, align 4
  %cmp31 = icmp eq i32 %tmp30, 256
  %conv = zext i1 %cmp31 to i32
  store i32 %conv, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_wmma_count_wmmalogical1(i8* %lvals) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %lvals.addr = alloca i8*, align 8
  %lcount = alloca i32, align 4
  %lnbr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %lvals, i8** %lvals.addr, align 8
  store i32 0, i32* %lcount, align 4
  store i32 0, i32* %lnbr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %lvals.addr, align 8
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i8* %tmp1, i32 %tmp2
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp4 = load i32* %lcount, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %lcount, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp5 = load i32* %i, align 4
  %inc6 = add nsw i32 %tmp5, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp7 = load i32* %lcount, align 4
  %call = call i32 @__pgi_shfl_xori2(i32 %tmp7, i32 1)
  store i32 %call, i32* %lnbr, align 4
  %tmp8 = load i32* %lcount, align 4
  %tmp9 = load i32* %lnbr, align 4
  %add = add nsw i32 %tmp8, %tmp9
  store i32 %add, i32* %lcount, align 4
  %tmp10 = load i32* %lcount, align 4
  %call11 = call i32 @__pgi_shfl_xori2(i32 %tmp10, i32 2)
  store i32 %call11, i32* %lnbr, align 4
  %tmp12 = load i32* %lcount, align 4
  %tmp13 = load i32* %lnbr, align 4
  %add14 = add nsw i32 %tmp12, %tmp13
  store i32 %add14, i32* %lcount, align 4
  %tmp15 = load i32* %lcount, align 4
  %call16 = call i32 @__pgi_shfl_xori2(i32 %tmp15, i32 4)
  store i32 %call16, i32* %lnbr, align 4
  %tmp17 = load i32* %lcount, align 4
  %tmp18 = load i32* %lnbr, align 4
  %add19 = add nsw i32 %tmp17, %tmp18
  store i32 %add19, i32* %lcount, align 4
  %tmp20 = load i32* %lcount, align 4
  %call21 = call i32 @__pgi_shfl_xori2(i32 %tmp20, i32 8)
  store i32 %call21, i32* %lnbr, align 4
  %tmp22 = load i32* %lcount, align 4
  %tmp23 = load i32* %lnbr, align 4
  %add24 = add nsw i32 %tmp22, %tmp23
  store i32 %add24, i32* %lcount, align 4
  %tmp25 = load i32* %lcount, align 4
  %call26 = call i32 @__pgi_shfl_xori2(i32 %tmp25, i32 16)
  store i32 %call26, i32* %lnbr, align 4
  %tmp27 = load i32* %lcount, align 4
  %tmp28 = load i32* %lnbr, align 4
  %add29 = add nsw i32 %tmp27, %tmp28
  store i32 %add29, i32* %lcount, align 4
  %tmp30 = load i32* %lcount, align 4
  store i32 %tmp30, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define void @__pgi_wmma_merge_cm16n16k16r2sr2m(i8* %d, i8* %t, i8* %f, i8* %l) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %t.addr = alloca i8*, align 8
  %f.addr = alloca i8*, align 8
  %l.addr = alloca i8*, align 8
  %ts = alloca i16, align 2
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store i8* %t, i8** %t.addr, align 8
  store i8* %f, i8** %f.addr, align 8
  store i8* %l, i8** %l.addr, align 8
  %tmp = load i8** %t.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %arrayidx = getelementptr inbounds i16* %conv, i32 0
  %tmp1 = load i16* %arrayidx, align 2
  store i16 %tmp1, i16* %ts, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %l.addr, align 8
  %tmp5 = load i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8* %tmp4, i32 %tmp5
  %tmp7 = load i8* %arrayidx6, align 1
  %tobool = icmp ne i8 %tmp7, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %tmp8 = load i16* %ts, align 2
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %tmp9 = load i8** %f.addr, align 8
  %conv10 = bitcast i8* %tmp9 to i16*
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i16* %conv10, i32 %tmp11
  %tmp13 = load i16* %arrayidx12, align 2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %tmp8, %cond.true ], [ %tmp13, %cond.false ]
  %tmp14 = load i8** %d.addr, align 8
  %conv15 = bitcast i8* %tmp14 to i16*
  %tmp16 = load i32* %i, align 4
  %arrayidx17 = getelementptr inbounds i16* %conv15, i32 %tmp16
  store i16 %cond, i16* %arrayidx17, align 2
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp18 = load i32* %i, align 4
  %inc = add nsw i32 %tmp18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define void @__pgi_wmma_merge_cm16n16k16r4sr4m(i8* %d, float %t, i8* %f, i8* %l) nounwind alwaysinline {
entry:
  %d.addr = alloca i8*, align 8
  %t.addr = alloca float, align 4
  %f.addr = alloca i8*, align 8
  %l.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %d, i8** %d.addr, align 8
  store float %t, float* %t.addr, align 4
  store i8* %f, i8** %f.addr, align 8
  store i8* %l, i8** %l.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %l.addr, align 8
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i8* %tmp1, i32 %tmp2
  %tmp3 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %tmp4 = load float* %t.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %tmp5 = load i8** %f.addr, align 8
  %conv = bitcast i8* %tmp5 to float*
  %tmp6 = load i32* %i, align 4
  %arrayidx7 = getelementptr inbounds float* %conv, i32 %tmp6
  %tmp8 = load float* %arrayidx7, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi float [ %tmp4, %cond.true ], [ %tmp8, %cond.false ]
  %tmp9 = load i8** %d.addr, align 8
  %conv10 = bitcast i8* %tmp9 to float*
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds float* %conv10, i32 %tmp11
  store float %cond, float* %arrayidx12, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp13 = load i32* %i, align 4
  %inc = add nsw i32 %tmp13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define %struct.__half @__pgi_wmma_add_real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.__half, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  %conv5 = bitcast %struct.__half* %val to i16*
  %tmp6 = load i16* %a, align 2
  %tmp7 = load i16* %b, align 2
  %0 = call i16 asm sideeffect "add.f16 $0, $1, $2;", "=h,h,h"(i16 %tmp6, i16 %tmp7) #0
  store i16 %0, i16* %conv5, align 2
  %1 = load %struct.__half* %val, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define %struct.__half @__pgi_wmma_sub_real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.__half, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  %conv5 = bitcast %struct.__half* %val to i16*
  %tmp6 = load i16* %a, align 2
  %tmp7 = load i16* %b, align 2
  %0 = call i16 asm sideeffect "sub.f16 $0, $1, $2;", "=h,h,h"(i16 %tmp6, i16 %tmp7) #0
  store i16 %0, i16* %conv5, align 2
  %1 = load %struct.__half* %val, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define %struct.__half @__pgi_wmma_mul_real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.__half, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  %conv5 = bitcast %struct.__half* %val to i16*
  %tmp6 = load i16* %a, align 2
  %tmp7 = load i16* %b, align 2
  %0 = call i16 asm sideeffect "mul.f16 $0, $1, $2;", "=h,h,h"(i16 %tmp6, i16 %tmp7) #0
  store i16 %0, i16* %conv5, align 2
  %1 = load %struct.__half* %val, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define %struct.__half @__pgi_wmma_div_real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %fa = alloca float, align 4
  %fb = alloca float, align 4
  %fv = alloca float, align 4
  %rcp = alloca float, align 4
  %abs = alloca i16, align 2
  %val = alloca %struct.__half, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %den = alloca i16, align 2
  %err = alloca float, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  store i16 143, i16* %den, align 2
  %tmp5 = load i16* %a, align 2
  %call = call float @__pgi_half2float(i16 zeroext %tmp5)
  store float %call, float* %fa, align 4
  %tmp6 = load i16* %b, align 2
  %call7 = call float @__pgi_half2float(i16 zeroext %tmp6)
  store float %call7, float* %fb, align 4
  %tmp8 = load float* %fb, align 4
  %0 = call float asm sideeffect "rcp.approx.f32 $0, $1;", "=f,f"(float %tmp8) #0
  store float %0, float* %rcp, align 4
  %tmp9 = load float* %rcp, align 4
  %tmp10 = load float* %fa, align 4
  %mul = fmul float %tmp9, %tmp10
  store float %mul, float* %fv, align 4
  %tmp11 = load float* %fv, align 4
  %call12 = call %struct.__half @__pgi_float2half_rn(float %tmp11)
  store %struct.__half %call12, %struct.__half* %val, align 2
  %conv13 = bitcast %struct.__half* %val to i16*
  %tmp14 = load i16* %conv13, align 2
  %conv15 = zext i16 %tmp14 to i32
  %and = and i32 %conv15, 32767
  %conv16 = trunc i32 %and to i16
  store i16 %conv16, i16* %abs, align 2
  %tmp17 = load i16* %abs, align 2
  %conv18 = zext i16 %tmp17 to i32
  %cmp = icmp slt i32 %conv18, 143
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp20 = load i16* %abs, align 2
  %tobool = icmp ne i16 %tmp20, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  %cmp21 = icmp eq i32 %lnot.ext, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %1 = phi i1 [ false, %entry ], [ %cmp21, %land.rhs ]
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  %tmp23 = load float* %fb, align 4
  %neg = fsub float -0.000000e+00, %tmp23
  %tmp24 = load float* %fv, align 4
  %tmp25 = load float* %fa, align 4
  %call26 = call float @__fmaf_rn(float %neg, float %tmp24, float %tmp25)
  store float %call26, float* %err, align 4
  %tmp27 = load float* %rcp, align 4
  %tmp28 = load float* %err, align 4
  %tmp29 = load float* %fv, align 4
  %call30 = call float @__fmaf_rn(float %tmp27, float %tmp28, float %tmp29)
  store float %call30, float* %fv, align 4
  %tmp31 = load float* %fv, align 4
  %call32 = call %struct.__half @__pgi_float2half_rn(float %tmp31)
  store %struct.__half %call32, %struct.__half* %val, align 2
  br label %if.end

if.end:                                           ; preds = %if.then, %land.end
  %2 = load %struct.__half* %val, align 2
  store %struct.__half %2, %struct.__half* %retval, align 2
  %3 = load %struct.__half* %retval, align 2
  ret %struct.__half %3
}

declare float @__fmaf_rn(float, float, float)

define %struct.__half @__pgi_wmma_fma_real2(i8* %x, i8* %y, i8* %z) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i8*, align 8
  %val = alloca %struct.__half, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %z, i8** %z.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i16*
  %tmp4 = load i16* %conv3, align 2
  store i16 %tmp4, i16* %b, align 2
  %tmp5 = load i8** %z.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i16*
  %tmp7 = load i16* %conv6, align 2
  store i16 %tmp7, i16* %c, align 2
  %conv8 = bitcast %struct.__half* %val to i16*
  %tmp9 = load i16* %a, align 2
  %tmp10 = load i16* %b, align 2
  %tmp11 = load i16* %c, align 2
  %0 = call i16 asm sideeffect "fma.rn.f16 $0, $1, $2, $3;", "=h,h,h,h"(i16 %tmp9, i16 %tmp10, i16 %tmp11) #0
  store i16 %0, i16* %conv8, align 2
  %1 = load %struct.__half* %val, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define %struct.__half @__pgi_wmma_realint_real2(i32 %x, i32 %kind) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca i32, align 4
  %kind.addr = alloca i32, align 4
  %h = alloca %struct.__half, align 2
  store i32 %x, i32* %x.addr, align 4
  store i32 %kind, i32* %kind.addr, align 4
  %conv = bitcast %struct.__half* %h to i16*
  store i16 0, i16* %conv, align 2
  %tmp = load i32* %kind.addr, align 4
  %cmp = icmp eq i32 %tmp, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %conv2 = bitcast %struct.__half* %h to i16*
  %tmp3 = load i32* %x.addr, align 4
  %0 = call i16 asm sideeffect "cvt.rn.f16.s32 $0, $1;", "=h,r"(i32 %tmp3) #0
  store i16 %0, i16* %conv2, align 2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct.__half* %h, align 2
  store %struct.__half %1, %struct.__half* %retval, align 2
  %2 = load %struct.__half* %retval, align 2
  ret %struct.__half %2
}

define %struct.__half @__pgi_wmma_realreal_real2(float %x, i32 %kind) nounwind alwaysinline {
entry:
  %retval = alloca %struct.__half, align 2
  %x.addr = alloca float, align 4
  %kind.addr = alloca i32, align 4
  %h = alloca %struct.__half, align 2
  store float %x, float* %x.addr, align 4
  store i32 %kind, i32* %kind.addr, align 4
  %conv = bitcast %struct.__half* %h to i16*
  store i16 0, i16* %conv, align 2
  %tmp = load i32* %kind.addr, align 4
  %cmp = icmp eq i32 %tmp, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load float* %x.addr, align 4
  %call = call %struct.__half @__pgi_float2half_rn(float %tmp2)
  store %struct.__half %call, %struct.__half* %h, align 2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %0 = load %struct.__half* %h, align 2
  store %struct.__half %0, %struct.__half* %retval, align 2
  %1 = load %struct.__half* %retval, align 2
  ret %struct.__half %1
}

define float @__pgi_wmma_realreal2_real(i8* %x, i32 %kind) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %x.addr = alloca i8*, align 8
  %kind.addr = alloca i32, align 4
  %a = alloca i16, align 2
  store i8* %x, i8** %x.addr, align 8
  store i32 %kind, i32* %kind.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i16*
  %tmp1 = load i16* %conv, align 2
  store i16 %tmp1, i16* %a, align 2
  %tmp2 = load i16* %a, align 2
  %call = call float @__pgi_half2float(i16 zeroext %tmp2)
  store float %call, float* %retval, align 4
  %0 = load float* %retval, align 4
  ret float %0
}

define %struct.ushort2 @__pgi_negate_v2real2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %a, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %b, align 4
  %conv2 = bitcast %struct.ushort2* %val to i32*
  %tmp3 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "sub.f16x2 $0, $1, $2;", "=r,r,r"(i32 0, i32 %tmp3) #0
  store i32 %0, i32* %conv2, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define %struct.ushort2 @__pgi_add_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %conv5 = bitcast %struct.ushort2* %val to i32*
  %tmp6 = load i32* %a, align 4
  %tmp7 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "add.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp6, i32 %tmp7) #0
  store i32 %0, i32* %conv5, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define %struct.ushort2 @__pgi_sub_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %conv5 = bitcast %struct.ushort2* %val to i32*
  %tmp6 = load i32* %a, align 4
  %tmp7 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "sub.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp6, i32 %tmp7) #0
  store i32 %0, i32* %conv5, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define %struct.ushort2 @__pgi_mul_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %conv5 = bitcast %struct.ushort2* %val to i32*
  %tmp6 = load i32* %a, align 4
  %tmp7 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "mul.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp6, i32 %tmp7) #0
  store i32 %0, i32* %conv5, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define %struct.ushort2 @__pgi_div_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca %struct.__half, align 2
  %b = alloca %struct.__half, align 2
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %tmp1 = load i8** %y.addr, align 8
  %call = call %struct.__half @__pgi_wmma_div_real2(i8* %tmp, i8* %tmp1)
  store %struct.__half %call, %struct.__half* %a, align 2
  %tmp2 = load i8** %x.addr, align 8
  %add.ptr = getelementptr inbounds i8* %tmp2, i32 2
  %tmp3 = load i8** %y.addr, align 8
  %add.ptr4 = getelementptr inbounds i8* %tmp3, i32 2
  %call5 = call %struct.__half @__pgi_wmma_div_real2(i8* %add.ptr, i8* %add.ptr4)
  store %struct.__half %call5, %struct.__half* %b, align 2
  %conv = bitcast %struct.ushort2* %val to i32*
  %conv6 = bitcast %struct.__half* %a to i16*
  %tmp7 = load i16* %conv6, align 2
  %conv8 = bitcast %struct.__half* %b to i16*
  %tmp9 = load i16* %conv8, align 2
  %0 = call i32 asm sideeffect "mov.b32 $0, {$1, $2};", "=r,h,h"(i16 %tmp7, i16 %tmp9) #0
  store i32 %0, i32* %conv, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define %struct.ushort2 @__pgi_fma_v2real2(i8* %x, i8* %y, i8* %z) nounwind alwaysinline {
entry:
  %retval = alloca %struct.ushort2, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i8*, align 8
  %val = alloca %struct.ushort2, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %z, i8** %z.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i8** %z.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %tmp7 = load i32* %conv6, align 4
  store i32 %tmp7, i32* %c, align 4
  %conv8 = bitcast %struct.ushort2* %val to i32*
  %tmp9 = load i32* %a, align 4
  %tmp10 = load i32* %b, align 4
  %tmp11 = load i32* %c, align 4
  %0 = call i32 asm sideeffect "fma.rn.f16x2 $0, $1, $2, $3;", "=r,r,r,r"(i32 %tmp9, i32 %tmp10, i32 %tmp11) #0
  store i32 %0, i32* %conv8, align 4
  %1 = load %struct.ushort2* %val, align 4
  store %struct.ushort2 %1, %struct.ushort2* %retval, align 4
  %2 = load %struct.ushort2* %retval, align 4
  ret %struct.ushort2 %2
}

define i32 @__pgi_wmma_cmpeq_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpne_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %a, i32 %b) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* %b.addr, align 4
  %0 = call i32 asm sideeffect "set.gt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp, i32 %tmp1) #0
  store i32 %0, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  store i32 %tmp2, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpgt_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %call = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp5, i32 %tmp6)
  store i32 %call, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_wmma_cmplt_v2real2_byvalue(i32 %a, i32 %b) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %tmp1 = load i32* %b.addr, align 4
  %0 = call i32 asm sideeffect "set.lt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp, i32 %tmp1) #0
  store i32 %0, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  store i32 %tmp2, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmplt_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %call = call i32 @__pgi_wmma_cmplt_v2real2_byvalue(i32 %tmp5, i32 %tmp6)
  store i32 %call, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_wmma_cmpge_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ge.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmple_v2real2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.le.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpeq_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpne_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpgt_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.gt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmplt_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.lt.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmpge_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ge.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_wmma_cmple_v2realr(i8* %x, float %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca float, align 4
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store float %y, float* %y.addr, align 4
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load float* %y.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp2)
  store i32 %call, i32* %b, align 4
  %tmp3 = load i32* %a, align 4
  %tmp4 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.le.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp3, i32 %tmp4) #0
  store i32 %0, i32* %val, align 4
  %tmp5 = load i32* %val, align 4
  store i32 %tmp5, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_lognot_v2logical2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  %xor = xor i32 %tmp2, 1006648320
  store i32 %xor, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_logand_v2logical2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %and = and i32 %tmp5, %tmp6
  store i32 %and, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_logor_v2logical2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %or = or i32 %tmp5, %tmp6
  store i32 %or, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define i32 @__pgi_logeqv_v2logical2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.eq.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_logneqv_v2logical2(i8* %x, i8* %y) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %a, align 4
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %tmp4 = load i32* %conv3, align 4
  store i32 %tmp4, i32* %b, align 4
  %tmp5 = load i32* %a, align 4
  %tmp6 = load i32* %b, align 4
  %0 = call i32 asm sideeffect "set.ne.f16x2.f16x2 $0, $1, $2;", "=r,r,r"(i32 %tmp5, i32 %tmp6) #0
  store i32 %0, i32* %val, align 4
  %tmp7 = load i32* %val, align 4
  store i32 %tmp7, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_any_v2logical2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  %and = and i32 %tmp2, -65536
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = load i32* %val, align 4
  %and4 = and i32 %tmp3, 65535
  %tobool5 = icmp ne i32 %and4, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %tobool5, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  store i32 %lor.ext, i32* %val, align 4
  %tmp6 = load i32* %val, align 4
  store i32 %tmp6, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_all_v2logical2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %val, align 4
  %tmp2 = load i32* %val, align 4
  %and = and i32 %tmp2, -65536
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp3 = load i32* %val, align 4
  %and4 = and i32 %tmp3, 65535
  %tobool5 = icmp ne i32 %and4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %tobool5, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  store i32 %land.ext, i32* %val, align 4
  %tmp6 = load i32* %val, align 4
  store i32 %tmp6, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

define i32 @__pgi_count_v2logical2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %count = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %tmp1 = load i32* %conv, align 4
  store i32 %tmp1, i32* %val, align 4
  store i32 0, i32* %count, align 4
  %tmp2 = load i32* %val, align 4
  %and = and i32 %tmp2, -65536
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp3 = load i32* %count, align 4
  %inc = add i32 %tmp3, 1
  store i32 %inc, i32* %count, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp4 = load i32* %val, align 4
  %and5 = and i32 %tmp4, 65535
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %tmp8 = load i32* %count, align 4
  %inc9 = add i32 %tmp8, 1
  store i32 %inc9, i32* %count, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.end
  %tmp11 = load i32* %count, align 4
  store i32 %tmp11, i32* %retval, align 4
  %0 = load i32* %retval, align 4
  ret i32 %0
}

define zeroext i16 @__pgi_maxval_cm16n16k16r2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %y = alloca i32, align 4
  %cres = alloca i32, align 4
  %i = alloca i32, align 4
  %i31 = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  %tmp1 = load i32* %arrayidx, align 4
  store i32 %tmp1, i32* %val, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %x.addr, align 8
  %conv5 = bitcast i8* %tmp4 to i32*
  %tmp6 = load i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i32* %conv5, i32 %tmp6
  %tmp8 = load i32* %arrayidx7, align 4
  store i32 %tmp8, i32* %y, align 4
  %tmp9 = load i32* %val, align 4
  %tmp10 = load i32* %y, align 4
  %call = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp9, i32 %tmp10)
  store i32 %call, i32* %cres, align 4
  %tmp11 = load i32* %cres, align 4
  %and = and i32 %tmp11, 65535
  %cmp12 = icmp ne i32 %and, 0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp14 = load i32* %cres, align 4
  %or = or i32 %tmp14, 65535
  store i32 %or, i32* %cres, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %tmp15 = load i32* %cres, align 4
  %and16 = and i32 %tmp15, -65536
  %cmp17 = icmp ne i32 %and16, 0
  br i1 %cmp17, label %if.then19, label %if.end22

if.then19:                                        ; preds = %if.end
  %tmp20 = load i32* %cres, align 4
  %or21 = or i32 %tmp20, -65536
  store i32 %or21, i32* %cres, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %if.end
  %tmp23 = load i32* %val, align 4
  %tmp24 = load i32* %cres, align 4
  %and25 = and i32 %tmp23, %tmp24
  %tmp26 = load i32* %y, align 4
  %tmp27 = load i32* %cres, align 4
  %not = xor i32 %tmp27, -1
  %and28 = and i32 %tmp26, %not
  %or29 = or i32 %and25, %and28
  store i32 %or29, i32* %val, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i31, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc67, %for.end
  %tmp33 = load i32* %i31, align 4
  %cmp34 = icmp slt i32 %tmp33, 32
  br i1 %cmp34, label %for.body36, label %for.end69

for.body36:                                       ; preds = %for.cond32
  %tmp37 = load i32* %val, align 4
  %tmp38 = load i32* %i31, align 4
  %call39 = call i32 @__pgi_shfl_xori2(i32 %tmp37, i32 %tmp38)
  store i32 %call39, i32* %y, align 4
  %tmp40 = load i32* %val, align 4
  %tmp41 = load i32* %y, align 4
  %call42 = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp40, i32 %tmp41)
  store i32 %call42, i32* %cres, align 4
  %tmp43 = load i32* %cres, align 4
  %and44 = and i32 %tmp43, 65535
  %cmp45 = icmp ne i32 %and44, 0
  br i1 %cmp45, label %if.then47, label %if.end50

if.then47:                                        ; preds = %for.body36
  %tmp48 = load i32* %cres, align 4
  %or49 = or i32 %tmp48, 65535
  store i32 %or49, i32* %cres, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then47, %for.body36
  %tmp51 = load i32* %cres, align 4
  %and52 = and i32 %tmp51, -65536
  %cmp53 = icmp ne i32 %and52, 0
  br i1 %cmp53, label %if.then55, label %if.end58

if.then55:                                        ; preds = %if.end50
  %tmp56 = load i32* %cres, align 4
  %or57 = or i32 %tmp56, -65536
  store i32 %or57, i32* %cres, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then55, %if.end50
  %tmp59 = load i32* %val, align 4
  %tmp60 = load i32* %cres, align 4
  %and61 = and i32 %tmp59, %tmp60
  %tmp62 = load i32* %y, align 4
  %tmp63 = load i32* %cres, align 4
  %not64 = xor i32 %tmp63, -1
  %and65 = and i32 %tmp62, %not64
  %or66 = or i32 %and61, %and65
  store i32 %or66, i32* %val, align 4
  br label %for.inc67

for.inc67:                                        ; preds = %if.end58
  %tmp68 = load i32* %i31, align 4
  %mul = mul nsw i32 %tmp68, 2
  store i32 %mul, i32* %i31, align 4
  br label %for.cond32

for.end69:                                        ; preds = %for.cond32
  %tmp70 = load i32* %val, align 4
  %and71 = and i32 %tmp70, -65536
  %shr = lshr i32 %and71, 16
  %tmp72 = load i32* %val, align 4
  %and73 = and i32 %tmp72, 65535
  %shl = shl i32 %and73, 16
  %or74 = or i32 %shr, %shl
  store i32 %or74, i32* %y, align 4
  %tmp75 = load i32* %val, align 4
  %tmp76 = load i32* %y, align 4
  %call77 = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp75, i32 %tmp76)
  store i32 %call77, i32* %cres, align 4
  %tmp78 = load i32* %cres, align 4
  %and79 = and i32 %tmp78, 65535
  %cmp80 = icmp ne i32 %and79, 0
  br i1 %cmp80, label %if.then82, label %if.else

if.then82:                                        ; preds = %for.end69
  %tmp83 = load i32* %val, align 4
  %and84 = and i32 %tmp83, 65535
  %conv85 = trunc i32 %and84 to i16
  store i16 %conv85, i16* %retval, align 2
  br label %return

if.else:                                          ; preds = %for.end69
  %tmp86 = load i32* %y, align 4
  %and87 = and i32 %tmp86, 65535
  %conv88 = trunc i32 %and87 to i16
  store i16 %conv88, i16* %retval, align 2
  br label %return

return:                                           ; preds = %if.else, %if.then82
  %0 = load i16* %retval, align 2
  ret i16 %0
}

define float @__pgi_maxval_cm16n16k16r4(i8* %frag) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %frag.addr = alloca i8*, align 8
  %val = alloca float, align 4
  %nbr = alloca float, align 4
  %i = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  %tmp1 = load float* %arrayidx, align 4
  store float %tmp1, float* %val, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %frag.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i32* %i, align 4
  %arrayidx7 = getelementptr inbounds float* %conv5, i32 %tmp6
  %tmp8 = load float* %arrayidx7, align 4
  %tmp9 = load float* %val, align 4
  %cmp10 = fcmp ogt float %tmp8, %tmp9
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp12 = load i8** %frag.addr, align 8
  %conv13 = bitcast i8* %tmp12 to float*
  %tmp14 = load i32* %i, align 4
  %arrayidx15 = getelementptr inbounds float* %conv13, i32 %tmp14
  %tmp16 = load float* %arrayidx15, align 4
  store float %tmp16, float* %val, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp18 = load float* %val, align 4
  %call = call float @__pgi_shfl_xorf2(float %tmp18, i32 1)
  store float %call, float* %nbr, align 4
  %tmp19 = load float* %nbr, align 4
  %tmp20 = load float* %val, align 4
  %cmp21 = fcmp ogt float %tmp19, %tmp20
  br i1 %cmp21, label %if.then23, label %if.end25

if.then23:                                        ; preds = %for.end
  %tmp24 = load float* %nbr, align 4
  store float %tmp24, float* %val, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %for.end
  %tmp26 = load float* %val, align 4
  %call27 = call float @__pgi_shfl_xorf2(float %tmp26, i32 2)
  store float %call27, float* %nbr, align 4
  %tmp28 = load float* %nbr, align 4
  %tmp29 = load float* %val, align 4
  %cmp30 = fcmp ogt float %tmp28, %tmp29
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end25
  %tmp33 = load float* %nbr, align 4
  store float %tmp33, float* %val, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end25
  %tmp35 = load float* %val, align 4
  %call36 = call float @__pgi_shfl_xorf2(float %tmp35, i32 4)
  store float %call36, float* %nbr, align 4
  %tmp37 = load float* %nbr, align 4
  %tmp38 = load float* %val, align 4
  %cmp39 = fcmp ogt float %tmp37, %tmp38
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end34
  %tmp42 = load float* %nbr, align 4
  store float %tmp42, float* %val, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end34
  %tmp44 = load float* %val, align 4
  %call45 = call float @__pgi_shfl_xorf2(float %tmp44, i32 8)
  store float %call45, float* %nbr, align 4
  %tmp46 = load float* %nbr, align 4
  %tmp47 = load float* %val, align 4
  %cmp48 = fcmp ogt float %tmp46, %tmp47
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.end43
  %tmp51 = load float* %nbr, align 4
  store float %tmp51, float* %val, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.end43
  %tmp53 = load float* %val, align 4
  %call54 = call float @__pgi_shfl_xorf2(float %tmp53, i32 16)
  store float %call54, float* %nbr, align 4
  %tmp55 = load float* %nbr, align 4
  %tmp56 = load float* %val, align 4
  %cmp57 = fcmp ogt float %tmp55, %tmp56
  br i1 %cmp57, label %if.then59, label %if.end61

if.then59:                                        ; preds = %if.end52
  %tmp60 = load float* %nbr, align 4
  store float %tmp60, float* %val, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then59, %if.end52
  %tmp62 = load float* %val, align 4
  store float %tmp62, float* %retval, align 4
  %0 = load float* %retval, align 4
  ret float %0
}

declare float @__pgi_shfl_xorf2(float, i32)

define zeroext i16 @__pgi_maxval_cm16n16k16r2_wm(i8* %x, i8* %mask) nounwind alwaysinline {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca i8*, align 8
  %mask.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %y = alloca i32, align 4
  %cres = alloca i32, align 4
  %i = alloca i32, align 4
  %i39 = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i8* %mask, i8** %mask.addr, align 8
  store i32 -67044352, i32* %val, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %tmp2 = load i32* %i, align 4
  %arrayidx = getelementptr inbounds i32* %conv, i32 %tmp2
  %tmp3 = load i32* %arrayidx, align 4
  store i32 %tmp3, i32* %y, align 4
  %tmp4 = load i32* %val, align 4
  %tmp5 = load i32* %y, align 4
  %call = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp4, i32 %tmp5)
  store i32 %call, i32* %cres, align 4
  %tmp6 = load i32* %cres, align 4
  %and = and i32 %tmp6, 65535
  %cmp7 = icmp ne i32 %and, 0
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %tmp9 = load i8** %mask.addr, align 8
  %ptrincdec = getelementptr inbounds i8* %tmp9, i32 1
  store i8* %ptrincdec, i8** %mask.addr, align 8
  %tmp10 = load i8* %tmp9, align 1
  %conv11 = sext i8 %tmp10 to i32
  %cmp12 = icmp eq i32 %conv11, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %0 = phi i1 [ true, %for.body ], [ %cmp12, %lor.rhs ]
  br i1 %0, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end
  %tmp14 = load i32* %cres, align 4
  %or = or i32 %tmp14, 65535
  store i32 %or, i32* %cres, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.end
  %tmp15 = load i32* %cres, align 4
  %and16 = and i32 %tmp15, -65536
  %cmp17 = icmp ne i32 %and16, 0
  br i1 %cmp17, label %lor.end26, label %lor.rhs19

lor.rhs19:                                        ; preds = %if.end
  %tmp20 = load i8** %mask.addr, align 8
  %ptrincdec21 = getelementptr inbounds i8* %tmp20, i32 1
  store i8* %ptrincdec21, i8** %mask.addr, align 8
  %tmp22 = load i8* %tmp20, align 1
  %conv23 = sext i8 %tmp22 to i32
  %cmp24 = icmp eq i32 %conv23, 0
  br label %lor.end26

lor.end26:                                        ; preds = %lor.rhs19, %if.end
  %1 = phi i1 [ true, %if.end ], [ %cmp24, %lor.rhs19 ]
  br i1 %1, label %if.then27, label %if.end30

if.then27:                                        ; preds = %lor.end26
  %tmp28 = load i32* %cres, align 4
  %or29 = or i32 %tmp28, -65536
  store i32 %or29, i32* %cres, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %lor.end26
  %tmp31 = load i32* %val, align 4
  %tmp32 = load i32* %cres, align 4
  %and33 = and i32 %tmp31, %tmp32
  %tmp34 = load i32* %y, align 4
  %tmp35 = load i32* %cres, align 4
  %not = xor i32 %tmp35, -1
  %and36 = and i32 %tmp34, %not
  %or37 = or i32 %and33, %and36
  store i32 %or37, i32* %val, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end30
  %tmp38 = load i32* %i, align 4
  %inc = add nsw i32 %tmp38, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i39, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc75, %for.end
  %tmp41 = load i32* %i39, align 4
  %cmp42 = icmp slt i32 %tmp41, 32
  br i1 %cmp42, label %for.body44, label %for.end77

for.body44:                                       ; preds = %for.cond40
  %tmp45 = load i32* %val, align 4
  %tmp46 = load i32* %i39, align 4
  %call47 = call i32 @__pgi_shfl_xori2(i32 %tmp45, i32 %tmp46)
  store i32 %call47, i32* %y, align 4
  %tmp48 = load i32* %val, align 4
  %tmp49 = load i32* %y, align 4
  %call50 = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp48, i32 %tmp49)
  store i32 %call50, i32* %cres, align 4
  %tmp51 = load i32* %cres, align 4
  %and52 = and i32 %tmp51, 65535
  %cmp53 = icmp ne i32 %and52, 0
  br i1 %cmp53, label %if.then55, label %if.end58

if.then55:                                        ; preds = %for.body44
  %tmp56 = load i32* %cres, align 4
  %or57 = or i32 %tmp56, 65535
  store i32 %or57, i32* %cres, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then55, %for.body44
  %tmp59 = load i32* %cres, align 4
  %and60 = and i32 %tmp59, -65536
  %cmp61 = icmp ne i32 %and60, 0
  br i1 %cmp61, label %if.then63, label %if.end66

if.then63:                                        ; preds = %if.end58
  %tmp64 = load i32* %cres, align 4
  %or65 = or i32 %tmp64, -65536
  store i32 %or65, i32* %cres, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then63, %if.end58
  %tmp67 = load i32* %val, align 4
  %tmp68 = load i32* %cres, align 4
  %and69 = and i32 %tmp67, %tmp68
  %tmp70 = load i32* %y, align 4
  %tmp71 = load i32* %cres, align 4
  %not72 = xor i32 %tmp71, -1
  %and73 = and i32 %tmp70, %not72
  %or74 = or i32 %and69, %and73
  store i32 %or74, i32* %val, align 4
  br label %for.inc75

for.inc75:                                        ; preds = %if.end66
  %tmp76 = load i32* %i39, align 4
  %mul = mul nsw i32 %tmp76, 2
  store i32 %mul, i32* %i39, align 4
  br label %for.cond40

for.end77:                                        ; preds = %for.cond40
  %tmp78 = load i32* %val, align 4
  %and79 = and i32 %tmp78, -65536
  %shr = lshr i32 %and79, 16
  %tmp80 = load i32* %val, align 4
  %and81 = and i32 %tmp80, 65535
  %shl = shl i32 %and81, 16
  %or82 = or i32 %shr, %shl
  store i32 %or82, i32* %y, align 4
  %tmp83 = load i32* %val, align 4
  %tmp84 = load i32* %y, align 4
  %call85 = call i32 @__pgi_wmma_cmpgt_v2real2_byvalue(i32 %tmp83, i32 %tmp84)
  store i32 %call85, i32* %cres, align 4
  %tmp86 = load i32* %cres, align 4
  %and87 = and i32 %tmp86, 65535
  %cmp88 = icmp ne i32 %and87, 0
  br i1 %cmp88, label %if.then90, label %if.else

if.then90:                                        ; preds = %for.end77
  %tmp91 = load i32* %val, align 4
  %and92 = and i32 %tmp91, 65535
  %conv93 = trunc i32 %and92 to i16
  store i16 %conv93, i16* %retval, align 2
  br label %return

if.else:                                          ; preds = %for.end77
  %tmp94 = load i32* %y, align 4
  %and95 = and i32 %tmp94, 65535
  %conv96 = trunc i32 %and95 to i16
  store i16 %conv96, i16* %retval, align 2
  br label %return

return:                                           ; preds = %if.else, %if.then90
  %2 = load i16* %retval, align 2
  ret i16 %2
}

define float @__pgi_maxabsval_cm16n16k16r4(i8* %frag) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %frag.addr = alloca i8*, align 8
  %val = alloca float, align 4
  %nbr = alloca float, align 4
  %i = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  %tmp1 = load float* %arrayidx, align 4
  store float %tmp1, float* %val, align 4
  %tmp2 = load float* %val, align 4
  %conv3 = fpext float %tmp2 to double
  %cmp = fcmp olt double %conv3, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp5 = load float* %val, align 4
  %neg = fsub float -0.000000e+00, %tmp5
  store float %neg, float* %val, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 8
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load i8** %frag.addr, align 8
  %conv10 = bitcast i8* %tmp9 to float*
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds float* %conv10, i32 %tmp11
  %tmp13 = load float* %arrayidx12, align 4
  store float %tmp13, float* %nbr, align 4
  %tmp14 = load float* %nbr, align 4
  %conv15 = fpext float %tmp14 to double
  %cmp16 = fcmp olt double %conv15, 0.000000e+00
  br i1 %cmp16, label %if.then18, label %if.end21

if.then18:                                        ; preds = %for.body
  %tmp19 = load float* %nbr, align 4
  %neg20 = fsub float -0.000000e+00, %tmp19
  store float %neg20, float* %nbr, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then18, %for.body
  %tmp22 = load float* %nbr, align 4
  %tmp23 = load float* %val, align 4
  %cmp24 = fcmp ogt float %tmp22, %tmp23
  br i1 %cmp24, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end21
  %tmp27 = load float* %nbr, align 4
  store float %tmp27, float* %val, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end21
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %tmp29 = load i32* %i, align 4
  %inc = add nsw i32 %tmp29, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp30 = load float* %val, align 4
  %call = call float @__pgi_shfl_xorf2(float %tmp30, i32 1)
  store float %call, float* %nbr, align 4
  %tmp31 = load float* %nbr, align 4
  %tmp32 = load float* %val, align 4
  %cmp33 = fcmp ogt float %tmp31, %tmp32
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %for.end
  %tmp36 = load float* %nbr, align 4
  store float %tmp36, float* %val, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %for.end
  %tmp38 = load float* %val, align 4
  %call39 = call float @__pgi_shfl_xorf2(float %tmp38, i32 2)
  store float %call39, float* %nbr, align 4
  %tmp40 = load float* %nbr, align 4
  %tmp41 = load float* %val, align 4
  %cmp42 = fcmp ogt float %tmp40, %tmp41
  br i1 %cmp42, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.end37
  %tmp45 = load float* %nbr, align 4
  store float %tmp45, float* %val, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.end37
  %tmp47 = load float* %val, align 4
  %call48 = call float @__pgi_shfl_xorf2(float %tmp47, i32 4)
  store float %call48, float* %nbr, align 4
  %tmp49 = load float* %nbr, align 4
  %tmp50 = load float* %val, align 4
  %cmp51 = fcmp ogt float %tmp49, %tmp50
  br i1 %cmp51, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.end46
  %tmp54 = load float* %nbr, align 4
  store float %tmp54, float* %val, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.end46
  %tmp56 = load float* %val, align 4
  %call57 = call float @__pgi_shfl_xorf2(float %tmp56, i32 8)
  store float %call57, float* %nbr, align 4
  %tmp58 = load float* %nbr, align 4
  %tmp59 = load float* %val, align 4
  %cmp60 = fcmp ogt float %tmp58, %tmp59
  br i1 %cmp60, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.end55
  %tmp63 = load float* %nbr, align 4
  store float %tmp63, float* %val, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %if.end55
  %tmp65 = load float* %val, align 4
  %call66 = call float @__pgi_shfl_xorf2(float %tmp65, i32 16)
  store float %call66, float* %nbr, align 4
  %tmp67 = load float* %nbr, align 4
  %tmp68 = load float* %val, align 4
  %cmp69 = fcmp ogt float %tmp67, %tmp68
  br i1 %cmp69, label %if.then71, label %if.end73

if.then71:                                        ; preds = %if.end64
  %tmp72 = load float* %nbr, align 4
  store float %tmp72, float* %val, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %if.end64
  %tmp74 = load float* %val, align 4
  store float %tmp74, float* %retval, align 4
  %0 = load float* %retval, align 4
  ret float %0
}

define zeroext i16 @__pgi_minval_cm16n16k16r2(i8* %x) nounwind alwaysinline {
entry:
  %retval = alloca i16, align 2
  %x.addr = alloca i8*, align 8
  %val = alloca i32, align 4
  %y = alloca i32, align 4
  %cres = alloca i32, align 4
  %i = alloca i32, align 4
  %i31 = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  %tmp1 = load i32* %arrayidx, align 4
  store i32 %tmp1, i32* %val, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %x.addr, align 8
  %conv5 = bitcast i8* %tmp4 to i32*
  %tmp6 = load i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i32* %conv5, i32 %tmp6
  %tmp8 = load i32* %arrayidx7, align 4
  store i32 %tmp8, i32* %y, align 4
  %tmp9 = load i32* %val, align 4
  %tmp10 = load i32* %y, align 4
  %call = call i32 @__pgi_wmma_cmplt_v2real2_byvalue(i32 %tmp9, i32 %tmp10)
  store i32 %call, i32* %cres, align 4
  %tmp11 = load i32* %cres, align 4
  %and = and i32 %tmp11, 65535
  %cmp12 = icmp ne i32 %and, 0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp14 = load i32* %cres, align 4
  %or = or i32 %tmp14, 65535
  store i32 %or, i32* %cres, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %tmp15 = load i32* %cres, align 4
  %and16 = and i32 %tmp15, -65536
  %cmp17 = icmp ne i32 %and16, 0
  br i1 %cmp17, label %if.then19, label %if.end22

if.then19:                                        ; preds = %if.end
  %tmp20 = load i32* %cres, align 4
  %or21 = or i32 %tmp20, -65536
  store i32 %or21, i32* %cres, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then19, %if.end
  %tmp23 = load i32* %val, align 4
  %tmp24 = load i32* %cres, align 4
  %and25 = and i32 %tmp23, %tmp24
  %tmp26 = load i32* %y, align 4
  %tmp27 = load i32* %cres, align 4
  %not = xor i32 %tmp27, -1
  %and28 = and i32 %tmp26, %not
  %or29 = or i32 %and25, %and28
  store i32 %or29, i32* %val, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %tmp30 = load i32* %i, align 4
  %inc = add nsw i32 %tmp30, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %i31, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc67, %for.end
  %tmp33 = load i32* %i31, align 4
  %cmp34 = icmp slt i32 %tmp33, 32
  br i1 %cmp34, label %for.body36, label %for.end69

for.body36:                                       ; preds = %for.cond32
  %tmp37 = load i32* %val, align 4
  %tmp38 = load i32* %i31, align 4
  %call39 = call i32 @__pgi_shfl_xori2(i32 %tmp37, i32 %tmp38)
  store i32 %call39, i32* %y, align 4
  %tmp40 = load i32* %val, align 4
  %tmp41 = load i32* %y, align 4
  %call42 = call i32 @__pgi_wmma_cmplt_v2real2_byvalue(i32 %tmp40, i32 %tmp41)
  store i32 %call42, i32* %cres, align 4
  %tmp43 = load i32* %cres, align 4
  %and44 = and i32 %tmp43, 65535
  %cmp45 = icmp ne i32 %and44, 0
  br i1 %cmp45, label %if.then47, label %if.end50

if.then47:                                        ; preds = %for.body36
  %tmp48 = load i32* %cres, align 4
  %or49 = or i32 %tmp48, 65535
  store i32 %or49, i32* %cres, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then47, %for.body36
  %tmp51 = load i32* %cres, align 4
  %and52 = and i32 %tmp51, -65536
  %cmp53 = icmp ne i32 %and52, 0
  br i1 %cmp53, label %if.then55, label %if.end58

if.then55:                                        ; preds = %if.end50
  %tmp56 = load i32* %cres, align 4
  %or57 = or i32 %tmp56, -65536
  store i32 %or57, i32* %cres, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then55, %if.end50
  %tmp59 = load i32* %val, align 4
  %tmp60 = load i32* %cres, align 4
  %and61 = and i32 %tmp59, %tmp60
  %tmp62 = load i32* %y, align 4
  %tmp63 = load i32* %cres, align 4
  %not64 = xor i32 %tmp63, -1
  %and65 = and i32 %tmp62, %not64
  %or66 = or i32 %and61, %and65
  store i32 %or66, i32* %val, align 4
  br label %for.inc67

for.inc67:                                        ; preds = %if.end58
  %tmp68 = load i32* %i31, align 4
  %mul = mul nsw i32 %tmp68, 2
  store i32 %mul, i32* %i31, align 4
  br label %for.cond32

for.end69:                                        ; preds = %for.cond32
  %tmp70 = load i32* %val, align 4
  %and71 = and i32 %tmp70, -65536
  %shr = lshr i32 %and71, 16
  %tmp72 = load i32* %val, align 4
  %and73 = and i32 %tmp72, 65535
  %shl = shl i32 %and73, 16
  %or74 = or i32 %shr, %shl
  store i32 %or74, i32* %y, align 4
  %tmp75 = load i32* %val, align 4
  %tmp76 = load i32* %y, align 4
  %call77 = call i32 @__pgi_wmma_cmplt_v2real2_byvalue(i32 %tmp75, i32 %tmp76)
  store i32 %call77, i32* %cres, align 4
  %tmp78 = load i32* %cres, align 4
  %and79 = and i32 %tmp78, 65535
  %cmp80 = icmp ne i32 %and79, 0
  br i1 %cmp80, label %if.then82, label %if.else

if.then82:                                        ; preds = %for.end69
  %tmp83 = load i32* %val, align 4
  %and84 = and i32 %tmp83, 65535
  %conv85 = trunc i32 %and84 to i16
  store i16 %conv85, i16* %retval, align 2
  br label %return

if.else:                                          ; preds = %for.end69
  %tmp86 = load i32* %y, align 4
  %and87 = and i32 %tmp86, 65535
  %conv88 = trunc i32 %and87 to i16
  store i16 %conv88, i16* %retval, align 2
  br label %return

return:                                           ; preds = %if.else, %if.then82
  %0 = load i16* %retval, align 2
  ret i16 %0
}

define float @__pgi_minval_cm16n16k16r4(i8* %frag) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %frag.addr = alloca i8*, align 8
  %val = alloca float, align 4
  %nbr = alloca float, align 4
  %i = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  %tmp1 = load float* %arrayidx, align 4
  store float %tmp1, float* %val, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp2, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i8** %frag.addr, align 8
  %conv5 = bitcast i8* %tmp4 to float*
  %tmp6 = load i32* %i, align 4
  %arrayidx7 = getelementptr inbounds float* %conv5, i32 %tmp6
  %tmp8 = load float* %arrayidx7, align 4
  %tmp9 = load float* %val, align 4
  %cmp10 = fcmp olt float %tmp8, %tmp9
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp12 = load i8** %frag.addr, align 8
  %conv13 = bitcast i8* %tmp12 to float*
  %tmp14 = load i32* %i, align 4
  %arrayidx15 = getelementptr inbounds float* %conv13, i32 %tmp14
  %tmp16 = load float* %arrayidx15, align 4
  store float %tmp16, float* %val, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp17 = load i32* %i, align 4
  %inc = add nsw i32 %tmp17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp18 = load float* %val, align 4
  %call = call float @__pgi_shfl_xorf2(float %tmp18, i32 1)
  store float %call, float* %nbr, align 4
  %tmp19 = load float* %nbr, align 4
  %tmp20 = load float* %val, align 4
  %cmp21 = fcmp olt float %tmp19, %tmp20
  br i1 %cmp21, label %if.then23, label %if.end25

if.then23:                                        ; preds = %for.end
  %tmp24 = load float* %nbr, align 4
  store float %tmp24, float* %val, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %for.end
  %tmp26 = load float* %val, align 4
  %call27 = call float @__pgi_shfl_xorf2(float %tmp26, i32 2)
  store float %call27, float* %nbr, align 4
  %tmp28 = load float* %nbr, align 4
  %tmp29 = load float* %val, align 4
  %cmp30 = fcmp olt float %tmp28, %tmp29
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end25
  %tmp33 = load float* %nbr, align 4
  store float %tmp33, float* %val, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end25
  %tmp35 = load float* %val, align 4
  %call36 = call float @__pgi_shfl_xorf2(float %tmp35, i32 4)
  store float %call36, float* %nbr, align 4
  %tmp37 = load float* %nbr, align 4
  %tmp38 = load float* %val, align 4
  %cmp39 = fcmp olt float %tmp37, %tmp38
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end34
  %tmp42 = load float* %nbr, align 4
  store float %tmp42, float* %val, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end34
  %tmp44 = load float* %val, align 4
  %call45 = call float @__pgi_shfl_xorf2(float %tmp44, i32 8)
  store float %call45, float* %nbr, align 4
  %tmp46 = load float* %nbr, align 4
  %tmp47 = load float* %val, align 4
  %cmp48 = fcmp olt float %tmp46, %tmp47
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.end43
  %tmp51 = load float* %nbr, align 4
  store float %tmp51, float* %val, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.end43
  %tmp53 = load float* %val, align 4
  %call54 = call float @__pgi_shfl_xorf2(float %tmp53, i32 16)
  store float %call54, float* %nbr, align 4
  %tmp55 = load float* %nbr, align 4
  %tmp56 = load float* %val, align 4
  %cmp57 = fcmp olt float %tmp55, %tmp56
  br i1 %cmp57, label %if.then59, label %if.end61

if.then59:                                        ; preds = %if.end52
  %tmp60 = load float* %nbr, align 4
  store float %tmp60, float* %val, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then59, %if.end52
  %tmp62 = load float* %val, align 4
  store float %tmp62, float* %retval, align 4
  %0 = load float* %retval, align 4
  ret float %0
}

define float @__pgi_minabsval_cm16n16k16r4(i8* %frag) nounwind alwaysinline {
entry:
  %retval = alloca float, align 4
  %frag.addr = alloca i8*, align 8
  %val = alloca float, align 4
  %nbr = alloca float, align 4
  %i = alloca i32, align 4
  store i8* %frag, i8** %frag.addr, align 8
  %tmp = load i8** %frag.addr, align 8
  %conv = bitcast i8* %tmp to float*
  %arrayidx = getelementptr inbounds float* %conv, i32 0
  %tmp1 = load float* %arrayidx, align 4
  store float %tmp1, float* %val, align 4
  %tmp2 = load float* %val, align 4
  %conv3 = fpext float %tmp2 to double
  %cmp = fcmp olt double %conv3, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp5 = load float* %val, align 4
  %neg = fsub float -0.000000e+00, %tmp5
  store float %neg, float* %val, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %tmp6 = load i32* %i, align 4
  %cmp7 = icmp slt i32 %tmp6, 8
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load i8** %frag.addr, align 8
  %conv10 = bitcast i8* %tmp9 to float*
  %tmp11 = load i32* %i, align 4
  %arrayidx12 = getelementptr inbounds float* %conv10, i32 %tmp11
  %tmp13 = load float* %arrayidx12, align 4
  store float %tmp13, float* %nbr, align 4
  %tmp14 = load float* %nbr, align 4
  %conv15 = fpext float %tmp14 to double
  %cmp16 = fcmp olt double %conv15, 0.000000e+00
  br i1 %cmp16, label %if.then18, label %if.end21

if.then18:                                        ; preds = %for.body
  %tmp19 = load float* %nbr, align 4
  %neg20 = fsub float -0.000000e+00, %tmp19
  store float %neg20, float* %nbr, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then18, %for.body
  %tmp22 = load float* %nbr, align 4
  %tmp23 = load float* %val, align 4
  %cmp24 = fcmp olt float %tmp22, %tmp23
  br i1 %cmp24, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end21
  %tmp27 = load float* %nbr, align 4
  store float %tmp27, float* %val, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %if.end21
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %tmp29 = load i32* %i, align 4
  %inc = add nsw i32 %tmp29, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp30 = load float* %val, align 4
  %call = call float @__pgi_shfl_xorf2(float %tmp30, i32 1)
  store float %call, float* %nbr, align 4
  %tmp31 = load float* %nbr, align 4
  %tmp32 = load float* %val, align 4
  %cmp33 = fcmp olt float %tmp31, %tmp32
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %for.end
  %tmp36 = load float* %nbr, align 4
  store float %tmp36, float* %val, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %for.end
  %tmp38 = load float* %val, align 4
  %call39 = call float @__pgi_shfl_xorf2(float %tmp38, i32 2)
  store float %call39, float* %nbr, align 4
  %tmp40 = load float* %nbr, align 4
  %tmp41 = load float* %val, align 4
  %cmp42 = fcmp olt float %tmp40, %tmp41
  br i1 %cmp42, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.end37
  %tmp45 = load float* %nbr, align 4
  store float %tmp45, float* %val, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.end37
  %tmp47 = load float* %val, align 4
  %call48 = call float @__pgi_shfl_xorf2(float %tmp47, i32 4)
  store float %call48, float* %nbr, align 4
  %tmp49 = load float* %nbr, align 4
  %tmp50 = load float* %val, align 4
  %cmp51 = fcmp olt float %tmp49, %tmp50
  br i1 %cmp51, label %if.then53, label %if.end55

if.then53:                                        ; preds = %if.end46
  %tmp54 = load float* %nbr, align 4
  store float %tmp54, float* %val, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then53, %if.end46
  %tmp56 = load float* %val, align 4
  %call57 = call float @__pgi_shfl_xorf2(float %tmp56, i32 8)
  store float %call57, float* %nbr, align 4
  %tmp58 = load float* %nbr, align 4
  %tmp59 = load float* %val, align 4
  %cmp60 = fcmp olt float %tmp58, %tmp59
  br i1 %cmp60, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.end55
  %tmp63 = load float* %nbr, align 4
  store float %tmp63, float* %val, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %if.end55
  %tmp65 = load float* %val, align 4
  %call66 = call float @__pgi_shfl_xorf2(float %tmp65, i32 16)
  store float %call66, float* %nbr, align 4
  %tmp67 = load float* %nbr, align 4
  %tmp68 = load float* %val, align 4
  %cmp69 = fcmp olt float %tmp67, %tmp68
  br i1 %cmp69, label %if.then71, label %if.end73

if.then71:                                        ; preds = %if.end64
  %tmp72 = load float* %nbr, align 4
  store float %tmp72, float* %val, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then71, %if.end64
  %tmp74 = load float* %val, align 4
  store float %tmp74, float* %retval, align 4
  %0 = load float* %retval, align 4
  ret float %0
}

define i32 @__isGlobal(i8* %ptr) nounwind alwaysinline {
entry:
  %retval = alloca i32, align 4
  %ptr.addr = alloca i8*, align 8
  %ret = alloca i32, align 4
  store i8* %ptr, i8** %ptr.addr, align 8
  %tmp = load i8** %ptr.addr, align 8
  %0 = call i32 asm sideeffect "{ \0A\09    .reg .pred p; \0A\09    isspacep.global p, $1; \0A\09    selp.u32 $0, 1, 0, p;  \0A\09} \0A\09", "=r,l"(i8* %tmp) #0
  store i32 %0, i32* %ret, align 4
  %tmp1 = load i32* %ret, align 4
  %cmp = icmp ugt i32 %tmp1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8** %ptr.addr, align 8
  %conv = ptrtoint i8* %tmp2 to i32
  %or = or i32 %conv, 256
  %call = call i32 @__ffs(i32 %or)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* %ret, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %tmp3, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  %1 = load i32* %retval, align 4
  ret i32 %1
}

declare i32 @__ffs(i32)

define void @__pgi_assgn1_v2real2(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = ptrtoint i8* %tmp to i32
  %or = or i32 %conv, 16
  %call = call i32 @__ffs(i32 %or)
  %cmp = icmp sgt i32 %call, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i8** %x.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %arrayidx = getelementptr inbounds i32* %conv3, i32 0
  %tmp4 = load i32* %arrayidx, align 4
  %tmp5 = load i8** %y.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %arrayidx7 = getelementptr inbounds i32* %conv6, i32 0
  store i32 %tmp4, i32* %arrayidx7, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp8 = load i8** %y.addr, align 8
  %tmp9 = load i8** %x.addr, align 8
  %tmp10 = load i8** %x.addr, align 8
  %add.ptr = getelementptr inbounds i8* %tmp10, i32 2
  call void @__pgi_halves2half2(i8* %tmp8, i8* %tmp9, i8* %add.ptr)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @__pgi_assgn2_v2real2(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %y.addr, align 8
  %conv = ptrtoint i8* %tmp to i32
  %or = or i32 %conv, 16
  %call = call i32 @__ffs(i32 %or)
  %cmp = icmp sgt i32 %call, 2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp2 = load i8** %x.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i32*
  %arrayidx = getelementptr inbounds i32* %conv3, i32 0
  %tmp4 = load i32* %arrayidx, align 4
  %tmp5 = load i8** %y.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i32*
  %arrayidx7 = getelementptr inbounds i32* %conv6, i32 0
  store i32 %tmp4, i32* %arrayidx7, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp8 = load i8** %x.addr, align 8
  %conv9 = bitcast i8* %tmp8 to i16*
  %arrayidx10 = getelementptr inbounds i16* %conv9, i32 0
  %tmp11 = load i16* %arrayidx10, align 2
  %tmp12 = load i8** %y.addr, align 8
  %conv13 = bitcast i8* %tmp12 to i16*
  %arrayidx14 = getelementptr inbounds i16* %conv13, i32 0
  store i16 %tmp11, i16* %arrayidx14, align 2
  %tmp15 = load i8** %x.addr, align 8
  %conv16 = bitcast i8* %tmp15 to i16*
  %arrayidx17 = getelementptr inbounds i16* %conv16, i32 1
  %tmp18 = load i16* %arrayidx17, align 2
  %tmp19 = load i8** %y.addr, align 8
  %conv20 = bitcast i8* %tmp19 to i16*
  %arrayidx21 = getelementptr inbounds i16* %conv20, i32 1
  store i16 %tmp18, i16* %arrayidx21, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

define void @__pgi_assgn3_v2real2(i8* %y, float %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca float, align 4
  store i8* %y, i8** %y.addr, align 8
  store float %x, float* %x.addr, align 4
  %tmp = load float* %x.addr, align 4
  %call = call i32 @__pgi_float2half2_rn(float %tmp)
  %tmp1 = load i8** %y.addr, align 8
  %conv = bitcast i8* %tmp1 to i32*
  %arrayidx = getelementptr inbounds i32* %conv, i32 0
  store i32 %call, i32* %arrayidx, align 4
  ret void
}

define void @__pgi_assgn_v8real2(i8* %y, i8* %x) nounwind alwaysinline {
entry:
  %y.addr = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %y, i8** %y.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %tmp = load i8** %x.addr, align 8
  %conv = bitcast i8* %tmp to i64*
  %arrayidx = getelementptr inbounds i64* %conv, i32 0
  %tmp1 = load i64* %arrayidx, align 8
  %tmp2 = load i8** %y.addr, align 8
  %conv3 = bitcast i8* %tmp2 to i64*
  %arrayidx4 = getelementptr inbounds i64* %conv3, i32 0
  store i64 %tmp1, i64* %arrayidx4, align 8
  %tmp5 = load i8** %x.addr, align 8
  %conv6 = bitcast i8* %tmp5 to i64*
  %arrayidx7 = getelementptr inbounds i64* %conv6, i32 1
  %tmp8 = load i64* %arrayidx7, align 8
  %tmp9 = load i8** %y.addr, align 8
  %conv10 = bitcast i8* %tmp9 to i64*
  %arrayidx11 = getelementptr inbounds i64* %conv10, i32 1
  store i64 %tmp8, i64* %arrayidx11, align 8
  ret void
}

attributes #0 = { nounwind }
