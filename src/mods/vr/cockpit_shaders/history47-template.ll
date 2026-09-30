;
; Note: shader requires additional functionality:
;       64-Bit integer
;       64-bit Atomics on Typed Resources
;
;
; Input signature:
;
; Name                 Index   Mask Register SysValue  Format   Used
; -------------------- ----- ------ -------- -------- ------- ------
; no parameters
;
; Output signature:
;
; Name                 Index   Mask Register SysValue  Format   Used
; -------------------- ----- ------ -------- -------- ------- ------
; no parameters
; shader hash: 7aea79a42bfe35f5a4fc8638f14895a3
;
; Pipeline Runtime Information: 
;
;PSVRuntimeInfo:
; Compute Shader
; NumThreads=(16,16,1)
; MinimumExpectedWaveLaneCount: 0
; MaximumExpectedWaveLaneCount: 4294967295
; UsesViewID: false
; SigInputElements: 0
; SigOutputElements: 0
; SigPatchConstOrPrimElements: 0
; SigInputVectors: 0
; SigOutputVectors[0]: 0
; SigOutputVectors[1]: 0
; SigOutputVectors[2]: 0
; SigOutputVectors[3]: 0
; EntryFunctionName: main
;
;
; Buffer Definitions:
;
; cbuffer matrices
; {
;
;   struct hostlayout.matrices
;   {
;
;       column_major float4x4 _DestWorldToView;       ; Offset:    0
;       column_major float4x4 _DestViewToWorld;       ; Offset:   64
;       column_major float4x4 _DestViewToClip;        ; Offset:  128
;       column_major float4x4 _DestClipToView;        ; Offset:  192
;       column_major float4x4 _DestWorldToClip;       ; Offset:  256
;       column_major float4x4 _DestClipToWorld;       ; Offset:  320
;       column_major float4x4 _SrcWorldToView;        ; Offset:  384
;       column_major float4x4 _SrcViewToWorld;        ; Offset:  448
;       column_major float4x4 _SrcViewToClip;         ; Offset:  512
;       column_major float4x4 _SrcClipToView;         ; Offset:  576
;       column_major float4x4 _SrcWorldToClip;        ; Offset:  640
;       column_major float4x4 _SrcClipToWorld;        ; Offset:  704
;       column_major float4x4 _SrcWorldToViewPrev;    ; Offset:  768
;       column_major float4x4 _SrcViewToWorldPrev;    ; Offset:  832
;       column_major float4x4 _SrcViewToClipPrev;     ; Offset:  896
;       column_major float4x4 _SrcClipToViewPrev;     ; Offset:  960
;       column_major float4x4 _SrcWorldToClipPrev;    ; Offset: 1024
;       column_major float4x4 _SrcClipToWorldPrev;    ; Offset: 1088
;       column_major float4x4 _DestWorldToViewPrev;   ; Offset: 1152
;       column_major float4x4 _DestViewToWorldPrev;   ; Offset: 1216
;       column_major float4x4 _DestViewToClipPrev;    ; Offset: 1280
;       column_major float4x4 _DestClipToViewPrev;    ; Offset: 1344
;       column_major float4x4 _DestWorldToClipPrev;   ; Offset: 1408
;       column_major float4x4 _DestClipToWorldPrev;   ; Offset: 1472
;       column_major float4x4 _UIEyeWorldToView;      ; Offset: 1536
;       column_major float4x4 _UIEyeViewToWorld;      ; Offset: 1600
;       column_major float4x4 _UIEyeViewToClip;       ; Offset: 1664
;       column_major float4x4 _UIEyeClipToView;       ; Offset: 1728
;       column_major float4x4 _UIEyeWorldToClip;      ; Offset: 1792
;       column_major float4x4 _UIEyeClipToWorld;      ; Offset: 1856
;       column_major float4x4 _CamWorldToView;        ; Offset: 1920
;       column_major float4x4 _CamViewToWorld;        ; Offset: 1984
;       column_major float4x4 _CamViewToClip;         ; Offset: 2048
;       column_major float4x4 _CamClipToView;         ; Offset: 2112
;       column_major float4x4 _CamWorldToClip;        ; Offset: 2176
;       column_major float4x4 _CamClipToWorld;        ; Offset: 2240
;       float4 _UIQuadPosViewSpace;                   ; Offset: 2304
;       float2 _UIScale;                              ; Offset: 2320
;       float4 _MotionScale;                          ; Offset: 2336
;       float4 _RenderSizes;                          ; Offset: 2352
;       float4 _FoveatedArea;                         ; Offset: 2368
;       float _AspectRatio;                           ; Offset: 2384
;       float _IgnoreMotionThreshold;                 ; Offset: 2388
;       int _EyeIndex;                                ; Offset: 2392
;       int _SkipUIElements;                          ; Offset: 2396
;       int _UseMotionVectors;                        ; Offset: 2400
;       int _UseEyeMask;                              ; Offset: 2404
;       int _IsPreviousFrame;                         ; Offset: 2408
;       int _MotionVectorsType;                       ; Offset: 2412
;       int _Debug;                                   ; Offset: 2416
;       int _IsFoveated;                              ; Offset: 2420
;       int _IsMoving;                                ; Offset: 2424
;       int _IsRotating;                              ; Offset: 2428
;       uint _ShadingRate;                            ; Offset: 2432
;       int _IsUsingUEVelocity;                       ; Offset: 2436
;   
;   } matrices;                                       ; Offset:    0 Size:  2440
;
; }
;
;
; Resource Bindings:
;
; Name                                 Type  Format         Dim      ID      HLSL Bind  Count
; ------------------------------ ---------- ------- ----------- ------- -------------- ------
; matrices                          cbuffer      NA          NA     CB0            cb0     1
; pointSampler                      sampler      NA          NA      S0      s0,space1     1
; _SrcDepthTex                      texture     f32          2d      T0             t1     1
; _SrcEyeMaskTex                    texture     u32          2d      T1             t3     1
; _UIColorAndAlphaTex               texture     f32          2d      T2      t0,space1     1
; _CountTex1                            UAV     u32          2d      U0      u0,space1     1
; _CountTex2                            UAV     u32          2d      U1      u1,space1     1
; _OccludedMaskTex                      UAV     u32          2d      U2      u2,space1     1
; _ReprojectedDataPacked                UAV     u32          2d      U3      u0,space3     1
;
target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.Handle = type { i8* }
%dx.types.ResBind = type { i32, i32, i32, i8 }
%dx.types.ResourceProperties = type { i32, i32 }
%dx.types.CBufRet.f32 = type { float, float, float, float }
%dx.types.CBufRet.i32 = type { i32, i32, i32, i32 }
%dx.types.ResRet.f32 = type { float, float, float, float, i32 }
%dx.types.ResRet.i32 = type { i32, i32, i32, i32, i32 }
%"class.Texture2D<float>" = type { float, %"class.Texture2D<float>::mips_type" }
%"class.Texture2D<float>::mips_type" = type { i32 }
%"class.Texture2D<unsigned int>" = type { i32, %"class.Texture2D<unsigned int>::mips_type" }
%"class.Texture2D<unsigned int>::mips_type" = type { i32 }
%"class.Texture2D<vector<float, 4> >" = type { <4 x float>, %"class.Texture2D<vector<float, 4> >::mips_type" }
%"class.Texture2D<vector<float, 4> >::mips_type" = type { i32 }
%"class.RWTexture2D<unsigned int>" = type { i32 }
%"class.RWTexture2D<unsigned long long>" = type { i64 }
%hostlayout.matrices = type { [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], <4 x float>, <2 x float>, <4 x float>, <4 x float>, <4 x float>, float, float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.SamplerState = type { i32 }

define void @main() {
  %1 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 0, i32 0, i32 3, i8 1 }, i32 0, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %2 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 2, i32 2, i32 1, i8 1 }, i32 2, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %3 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 1, i32 1, i32 1, i8 1 }, i32 1, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %4 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 0, i32 0, i32 1, i8 1 }, i32 0, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %5 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 0, i32 0, i32 1, i8 0 }, i32 0, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %6 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 3, i32 3, i32 0, i8 0 }, i32 3, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %7 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 1, i32 1, i32 0, i8 0 }, i32 1, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %8 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 0, i32 0, i32 1, i8 3 }, i32 0, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %9 = call %dx.types.Handle @dx.op.createHandleFromBinding(i32 217, %dx.types.ResBind { i32 0, i32 0, i32 0, i8 2 }, i32 0, i1 false)  ; CreateHandleFromBinding(bind,index,nonUniformIndex)
  %10 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %9, %dx.types.ResourceProperties { i32 13, i32 2440 })  ; AnnotateHandle(res,props)  resource: CBuffer
  %11 = call i32 @dx.op.threadId.i32(i32 93, i32 0)  ; ThreadId(component)
  %12 = call i32 @dx.op.threadId.i32(i32 93, i32 1)  ; ThreadId(component)
  %13 = uitofp i32 %11 to float
  %14 = uitofp i32 %12 to float
  %15 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %16 = extractvalue %dx.types.CBufRet.f32 %15, 0
  %17 = extractvalue %dx.types.CBufRet.f32 %15, 1
  %18 = fcmp fast oge float %13, %16
  %19 = fcmp fast oge float %14, %17
  %20 = or i1 %18, %19
  br i1 %20, label %353, label %21

; <label>:21                                      ; preds = %0
  %22 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %10, i32 149)  ; CBufferLoadLegacy(handle,regIndex)
  %23 = extractvalue %dx.types.CBufRet.i32 %22, 3
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %36

; <label>:25                                      ; preds = %21
  %26 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %5, %dx.types.ResourceProperties { i32 2, i32 1033 })  ; AnnotateHandle(res,props)  resource: Texture2D<4xF32>
  %27 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %26, i32 0, i32 %11, i32 %12, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %28 = extractvalue %dx.types.ResRet.f32 %27, 3
  %29 = fcmp fast ogt float %28, 0.000000e+00
  br i1 %29, label %30, label %36

; <label>:30                                      ; preds = %25
  %31 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %10, i32 151)  ; CBufferLoadLegacy(handle,regIndex)
  %32 = extractvalue %dx.types.CBufRet.i32 %31, 0
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %353, label %34

; <label>:34                                      ; preds = %30
  %35 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %2, %dx.types.ResourceProperties { i32 4098, i32 261 })  ; AnnotateHandle(res,props)  resource: RWTexture2D<U32>
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %35, i32 %11, i32 %12, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %353

; <label>:36                                      ; preds = %25, %21
  %37 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %10, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %38 = extractvalue %dx.types.CBufRet.i32 %37, 1
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %47

; <label>:40                                      ; preds = %36
  %41 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %6, %dx.types.ResourceProperties { i32 2, i32 261 })  ; AnnotateHandle(res,props)  resource: Texture2D<U32>
  %42 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %41, i32 0, i32 %11, i32 %12, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %43 = extractvalue %dx.types.ResRet.i32 %42, 0
  %44 = icmp eq i32 %43, 0
  %45 = icmp eq i32 %43, 10
  %46 = or i1 %44, %45
  br i1 %46, label %353, label %47

; <label>:47                                      ; preds = %40, %36
  %48 = fadd fast float %13, 5.000000e-01
  %49 = fadd fast float %14, 5.000000e-01
  %50 = extractvalue %dx.types.CBufRet.f32 %15, 2
  %51 = extractvalue %dx.types.CBufRet.f32 %15, 3
  %52 = fmul fast float %50, %48
  %53 = fmul fast float %51, %49
  %54 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %7, %dx.types.ResourceProperties { i32 2, i32 265 })  ; AnnotateHandle(res,props)  resource: Texture2D<F32>
  %55 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %8, %dx.types.ResourceProperties { i32 14, i32 0 })  ; AnnotateHandle(res,props)  resource: SamplerState
  %56 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %54, %dx.types.Handle %55, float %52, float %53, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %57 = extractvalue %dx.types.ResRet.f32 %56, 0
  %58 = extractvalue %dx.types.CBufRet.i32 %37, 2
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %81, label %60

; <label>:60                                      ; preds = %47
  %61 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 92)  ; CBufferLoadLegacy(handle,regIndex)
  %62 = extractvalue %dx.types.CBufRet.f32 %61, 0
  %63 = extractvalue %dx.types.CBufRet.f32 %61, 1
  %64 = extractvalue %dx.types.CBufRet.f32 %61, 2
  %65 = extractvalue %dx.types.CBufRet.f32 %61, 3
  %66 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 93)  ; CBufferLoadLegacy(handle,regIndex)
  %67 = extractvalue %dx.types.CBufRet.f32 %66, 0
  %68 = extractvalue %dx.types.CBufRet.f32 %66, 1
  %69 = extractvalue %dx.types.CBufRet.f32 %66, 2
  %70 = extractvalue %dx.types.CBufRet.f32 %66, 3
  %71 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 94)  ; CBufferLoadLegacy(handle,regIndex)
  %72 = extractvalue %dx.types.CBufRet.f32 %71, 0
  %73 = extractvalue %dx.types.CBufRet.f32 %71, 1
  %74 = extractvalue %dx.types.CBufRet.f32 %71, 2
  %75 = extractvalue %dx.types.CBufRet.f32 %71, 3
  %76 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 95)  ; CBufferLoadLegacy(handle,regIndex)
  %77 = extractvalue %dx.types.CBufRet.f32 %76, 0
  %78 = extractvalue %dx.types.CBufRet.f32 %76, 1
  %79 = extractvalue %dx.types.CBufRet.f32 %76, 2
  %80 = extractvalue %dx.types.CBufRet.f32 %76, 3
  br label %102

; <label>:81                                      ; preds = %47
  %82 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 44)  ; CBufferLoadLegacy(handle,regIndex)
  %83 = extractvalue %dx.types.CBufRet.f32 %82, 0
  %84 = extractvalue %dx.types.CBufRet.f32 %82, 1
  %85 = extractvalue %dx.types.CBufRet.f32 %82, 2
  %86 = extractvalue %dx.types.CBufRet.f32 %82, 3
  %87 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 45)  ; CBufferLoadLegacy(handle,regIndex)
  %88 = extractvalue %dx.types.CBufRet.f32 %87, 0
  %89 = extractvalue %dx.types.CBufRet.f32 %87, 1
  %90 = extractvalue %dx.types.CBufRet.f32 %87, 2
  %91 = extractvalue %dx.types.CBufRet.f32 %87, 3
  %92 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 46)  ; CBufferLoadLegacy(handle,regIndex)
  %93 = extractvalue %dx.types.CBufRet.f32 %92, 0
  %94 = extractvalue %dx.types.CBufRet.f32 %92, 1
  %95 = extractvalue %dx.types.CBufRet.f32 %92, 2
  %96 = extractvalue %dx.types.CBufRet.f32 %92, 3
  %97 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 47)  ; CBufferLoadLegacy(handle,regIndex)
  %98 = extractvalue %dx.types.CBufRet.f32 %97, 0
  %99 = extractvalue %dx.types.CBufRet.f32 %97, 1
  %100 = extractvalue %dx.types.CBufRet.f32 %97, 2
  %101 = extractvalue %dx.types.CBufRet.f32 %97, 3
  br label %102

; <label>:102                                     ; preds = %81, %60
  %103 = phi float [ %62, %60 ], [ %83, %81 ]
  %104 = phi float [ %63, %60 ], [ %84, %81 ]
  %105 = phi float [ %64, %60 ], [ %85, %81 ]
  %106 = phi float [ %65, %60 ], [ %86, %81 ]
  %107 = phi float [ %67, %60 ], [ %88, %81 ]
  %108 = phi float [ %68, %60 ], [ %89, %81 ]
  %109 = phi float [ %69, %60 ], [ %90, %81 ]
  %110 = phi float [ %70, %60 ], [ %91, %81 ]
  %111 = phi float [ %72, %60 ], [ %93, %81 ]
  %112 = phi float [ %73, %60 ], [ %94, %81 ]
  %113 = phi float [ %74, %60 ], [ %95, %81 ]
  %114 = phi float [ %75, %60 ], [ %96, %81 ]
  %115 = phi float [ %77, %60 ], [ %98, %81 ]
  %116 = phi float [ %78, %60 ], [ %99, %81 ]
  %117 = phi float [ %79, %60 ], [ %100, %81 ]
  %118 = phi float [ %80, %60 ], [ %101, %81 ]
  %119 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 16)  ; CBufferLoadLegacy(handle,regIndex)
  %120 = extractvalue %dx.types.CBufRet.f32 %119, 0
  %121 = extractvalue %dx.types.CBufRet.f32 %119, 1
  %122 = extractvalue %dx.types.CBufRet.f32 %119, 2
  %123 = extractvalue %dx.types.CBufRet.f32 %119, 3
  %124 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 17)  ; CBufferLoadLegacy(handle,regIndex)
  %125 = extractvalue %dx.types.CBufRet.f32 %124, 0
  %126 = extractvalue %dx.types.CBufRet.f32 %124, 1
  %127 = extractvalue %dx.types.CBufRet.f32 %124, 2
  %128 = extractvalue %dx.types.CBufRet.f32 %124, 3
  %129 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 18)  ; CBufferLoadLegacy(handle,regIndex)
  %130 = extractvalue %dx.types.CBufRet.f32 %129, 0
  %131 = extractvalue %dx.types.CBufRet.f32 %129, 1
  %132 = extractvalue %dx.types.CBufRet.f32 %129, 2
  %133 = extractvalue %dx.types.CBufRet.f32 %129, 3
  %134 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 19)  ; CBufferLoadLegacy(handle,regIndex)
  %135 = extractvalue %dx.types.CBufRet.f32 %134, 0
  %136 = extractvalue %dx.types.CBufRet.f32 %134, 1
  %137 = extractvalue %dx.types.CBufRet.f32 %134, 2
  %138 = extractvalue %dx.types.CBufRet.f32 %134, 3
  br i1 %59, label %258, label %139

; <label>:139                                     ; preds = %102
  %140 = icmp eq i32 %38, 0
  br i1 %140, label %146, label %141

; <label>:141                                     ; preds = %139
  %142 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %6, %dx.types.ResourceProperties { i32 2, i32 261 })  ; AnnotateHandle(res,props)  resource: Texture2D<U32>
  %143 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %142, i32 0, i32 %11, i32 %12, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %144 = extractvalue %dx.types.ResRet.i32 %143, 0
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %258

; <label>:146                                     ; preds = %141, %139
  %147 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 35)  ; CBufferLoadLegacy(handle,regIndex)
  %148 = extractvalue %dx.types.CBufRet.f32 %147, 2
  %149 = fadd fast float %57, 0x3EB0C6F7A0000000
  %150 = fdiv fast float %148, %149
  %151 = fcmp fast olt float %150, 1.000000e+00
  br i1 %151, label %152, label %258

; <label>:152                                     ; preds = %146
  %153 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 76)  ; CBufferLoadLegacy(handle,regIndex)
  %154 = extractvalue %dx.types.CBufRet.f32 %153, 0
  %155 = extractvalue %dx.types.CBufRet.f32 %153, 1
  %156 = extractvalue %dx.types.CBufRet.f32 %153, 2
  %157 = extractvalue %dx.types.CBufRet.f32 %153, 3
  %158 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 77)  ; CBufferLoadLegacy(handle,regIndex)
  %159 = extractvalue %dx.types.CBufRet.f32 %158, 0
  %160 = extractvalue %dx.types.CBufRet.f32 %158, 1
  %161 = extractvalue %dx.types.CBufRet.f32 %158, 2
  %162 = extractvalue %dx.types.CBufRet.f32 %158, 3
  %163 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 78)  ; CBufferLoadLegacy(handle,regIndex)
  %164 = extractvalue %dx.types.CBufRet.f32 %163, 0
  %165 = extractvalue %dx.types.CBufRet.f32 %163, 1
  %166 = extractvalue %dx.types.CBufRet.f32 %163, 2
  %167 = extractvalue %dx.types.CBufRet.f32 %163, 3
  %168 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 79)  ; CBufferLoadLegacy(handle,regIndex)
  %169 = extractvalue %dx.types.CBufRet.f32 %168, 3
  %170 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 7)  ; CBufferLoadLegacy(handle,regIndex)
  %171 = extractvalue %dx.types.CBufRet.f32 %170, 0
  %172 = extractvalue %dx.types.CBufRet.f32 %170, 1
  %173 = extractvalue %dx.types.CBufRet.f32 %170, 2
  %previous0 = extractvalue %dx.types.CBufRet.f32 %168, 0
  %compensated0 = fadd float %171, 0.000000e+00
  %previous1 = extractvalue %dx.types.CBufRet.f32 %168, 1
  %compensated1 = fadd float %172, 0.000000e+00
  %previous2 = extractvalue %dx.types.CBufRet.f32 %168, 2
  %compensated2 = fadd float %173, 0.000000e+00
  %174 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 84)  ; CBufferLoadLegacy(handle,regIndex)
  %175 = extractvalue %dx.types.CBufRet.f32 %174, 0
  %176 = extractvalue %dx.types.CBufRet.f32 %174, 1
  %177 = extractvalue %dx.types.CBufRet.f32 %174, 2
  %178 = extractvalue %dx.types.CBufRet.f32 %174, 3
  %179 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 85)  ; CBufferLoadLegacy(handle,regIndex)
  %180 = extractvalue %dx.types.CBufRet.f32 %179, 0
  %181 = extractvalue %dx.types.CBufRet.f32 %179, 1
  %182 = extractvalue %dx.types.CBufRet.f32 %179, 2
  %183 = extractvalue %dx.types.CBufRet.f32 %179, 3
  %184 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 86)  ; CBufferLoadLegacy(handle,regIndex)
  %185 = extractvalue %dx.types.CBufRet.f32 %184, 0
  %186 = extractvalue %dx.types.CBufRet.f32 %184, 1
  %187 = extractvalue %dx.types.CBufRet.f32 %184, 2
  %188 = extractvalue %dx.types.CBufRet.f32 %184, 3
  %189 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %10, i32 87)  ; CBufferLoadLegacy(handle,regIndex)
  %190 = extractvalue %dx.types.CBufRet.f32 %189, 0
  %191 = extractvalue %dx.types.CBufRet.f32 %189, 1
  %192 = extractvalue %dx.types.CBufRet.f32 %189, 2
  %193 = extractvalue %dx.types.CBufRet.f32 %189, 3
  %194 = fmul fast float %175, %154
  %195 = call float @dx.op.tertiary.f32(i32 46, float %159, float %176, float %194)  ; FMad(a,b,c)
  %196 = call float @dx.op.tertiary.f32(i32 46, float %164, float %177, float %195)  ; FMad(a,b,c)
  %197 = call float @dx.op.tertiary.f32(i32 46, float %compensated0, float %178, float %196)  ; FMad(a,b,c)
  %198 = fmul fast float %180, %154
  %199 = call float @dx.op.tertiary.f32(i32 46, float %159, float %181, float %198)  ; FMad(a,b,c)
  %200 = call float @dx.op.tertiary.f32(i32 46, float %164, float %182, float %199)  ; FMad(a,b,c)
  %201 = call float @dx.op.tertiary.f32(i32 46, float %compensated0, float %183, float %200)  ; FMad(a,b,c)
  %202 = fmul fast float %185, %154
  %203 = call float @dx.op.tertiary.f32(i32 46, float %159, float %186, float %202)  ; FMad(a,b,c)
  %204 = call float @dx.op.tertiary.f32(i32 46, float %164, float %187, float %203)  ; FMad(a,b,c)
  %205 = call float @dx.op.tertiary.f32(i32 46, float %compensated0, float %188, float %204)  ; FMad(a,b,c)
  %206 = fmul fast float %190, %154
  %207 = call float @dx.op.tertiary.f32(i32 46, float %159, float %191, float %206)  ; FMad(a,b,c)
  %208 = call float @dx.op.tertiary.f32(i32 46, float %164, float %192, float %207)  ; FMad(a,b,c)
  %209 = call float @dx.op.tertiary.f32(i32 46, float %compensated0, float %193, float %208)  ; FMad(a,b,c)
  %210 = fmul fast float %175, %155
  %211 = call float @dx.op.tertiary.f32(i32 46, float %160, float %176, float %210)  ; FMad(a,b,c)
  %212 = call float @dx.op.tertiary.f32(i32 46, float %165, float %177, float %211)  ; FMad(a,b,c)
  %213 = call float @dx.op.tertiary.f32(i32 46, float %compensated1, float %178, float %212)  ; FMad(a,b,c)
  %214 = fmul fast float %180, %155
  %215 = call float @dx.op.tertiary.f32(i32 46, float %160, float %181, float %214)  ; FMad(a,b,c)
  %216 = call float @dx.op.tertiary.f32(i32 46, float %165, float %182, float %215)  ; FMad(a,b,c)
  %217 = call float @dx.op.tertiary.f32(i32 46, float %compensated1, float %183, float %216)  ; FMad(a,b,c)
  %218 = fmul fast float %185, %155
  %219 = call float @dx.op.tertiary.f32(i32 46, float %160, float %186, float %218)  ; FMad(a,b,c)
  %220 = call float @dx.op.tertiary.f32(i32 46, float %165, float %187, float %219)  ; FMad(a,b,c)
  %221 = call float @dx.op.tertiary.f32(i32 46, float %compensated1, float %188, float %220)  ; FMad(a,b,c)
  %222 = fmul fast float %190, %155
  %223 = call float @dx.op.tertiary.f32(i32 46, float %160, float %191, float %222)  ; FMad(a,b,c)
  %224 = call float @dx.op.tertiary.f32(i32 46, float %165, float %192, float %223)  ; FMad(a,b,c)
  %225 = call float @dx.op.tertiary.f32(i32 46, float %compensated1, float %193, float %224)  ; FMad(a,b,c)
  %226 = fmul fast float %175, %156
  %227 = call float @dx.op.tertiary.f32(i32 46, float %161, float %176, float %226)  ; FMad(a,b,c)
  %228 = call float @dx.op.tertiary.f32(i32 46, float %166, float %177, float %227)  ; FMad(a,b,c)
  %229 = call float @dx.op.tertiary.f32(i32 46, float %compensated2, float %178, float %228)  ; FMad(a,b,c)
  %230 = fmul fast float %180, %156
  %231 = call float @dx.op.tertiary.f32(i32 46, float %161, float %181, float %230)  ; FMad(a,b,c)
  %232 = call float @dx.op.tertiary.f32(i32 46, float %166, float %182, float %231)  ; FMad(a,b,c)
  %233 = call float @dx.op.tertiary.f32(i32 46, float %compensated2, float %183, float %232)  ; FMad(a,b,c)
  %234 = fmul fast float %185, %156
  %235 = call float @dx.op.tertiary.f32(i32 46, float %161, float %186, float %234)  ; FMad(a,b,c)
  %236 = call float @dx.op.tertiary.f32(i32 46, float %166, float %187, float %235)  ; FMad(a,b,c)
  %237 = call float @dx.op.tertiary.f32(i32 46, float %compensated2, float %188, float %236)  ; FMad(a,b,c)
  %238 = fmul fast float %190, %156
  %239 = call float @dx.op.tertiary.f32(i32 46, float %161, float %191, float %238)  ; FMad(a,b,c)
  %240 = call float @dx.op.tertiary.f32(i32 46, float %166, float %192, float %239)  ; FMad(a,b,c)
  %241 = call float @dx.op.tertiary.f32(i32 46, float %compensated2, float %193, float %240)  ; FMad(a,b,c)
  %242 = fmul fast float %175, %157
  %243 = call float @dx.op.tertiary.f32(i32 46, float %162, float %176, float %242)  ; FMad(a,b,c)
  %244 = call float @dx.op.tertiary.f32(i32 46, float %167, float %177, float %243)  ; FMad(a,b,c)
  %245 = call float @dx.op.tertiary.f32(i32 46, float %169, float %178, float %244)  ; FMad(a,b,c)
  %246 = fmul fast float %180, %157
  %247 = call float @dx.op.tertiary.f32(i32 46, float %162, float %181, float %246)  ; FMad(a,b,c)
  %248 = call float @dx.op.tertiary.f32(i32 46, float %167, float %182, float %247)  ; FMad(a,b,c)
  %249 = call float @dx.op.tertiary.f32(i32 46, float %169, float %183, float %248)  ; FMad(a,b,c)
  %250 = fmul fast float %185, %157
  %251 = call float @dx.op.tertiary.f32(i32 46, float %162, float %186, float %250)  ; FMad(a,b,c)
  %252 = call float @dx.op.tertiary.f32(i32 46, float %167, float %187, float %251)  ; FMad(a,b,c)
  %253 = call float @dx.op.tertiary.f32(i32 46, float %169, float %188, float %252)  ; FMad(a,b,c)
  %254 = fmul fast float %190, %157
  %255 = call float @dx.op.tertiary.f32(i32 46, float %162, float %191, float %254)  ; FMad(a,b,c)
  %256 = call float @dx.op.tertiary.f32(i32 46, float %167, float %192, float %255)  ; FMad(a,b,c)
  %257 = call float @dx.op.tertiary.f32(i32 46, float %169, float %193, float %256)  ; FMad(a,b,c)
  br label %258

; <label>:258                                     ; preds = %152, %146, %141, %102
  %259 = phi float [ %103, %141 ], [ %103, %102 ], [ %197, %152 ], [ %103, %146 ]
  %260 = phi float [ %104, %141 ], [ %104, %102 ], [ %213, %152 ], [ %104, %146 ]
  %261 = phi float [ %105, %141 ], [ %105, %102 ], [ %229, %152 ], [ %105, %146 ]
  %262 = phi float [ %106, %141 ], [ %106, %102 ], [ %245, %152 ], [ %106, %146 ]
  %263 = phi float [ %107, %141 ], [ %107, %102 ], [ %201, %152 ], [ %107, %146 ]
  %264 = phi float [ %108, %141 ], [ %108, %102 ], [ %217, %152 ], [ %108, %146 ]
  %265 = phi float [ %109, %141 ], [ %109, %102 ], [ %233, %152 ], [ %109, %146 ]
  %266 = phi float [ %110, %141 ], [ %110, %102 ], [ %249, %152 ], [ %110, %146 ]
  %267 = phi float [ %111, %141 ], [ %111, %102 ], [ %205, %152 ], [ %111, %146 ]
  %268 = phi float [ %112, %141 ], [ %112, %102 ], [ %221, %152 ], [ %112, %146 ]
  %269 = phi float [ %113, %141 ], [ %113, %102 ], [ %237, %152 ], [ %113, %146 ]
  %270 = phi float [ %114, %141 ], [ %114, %102 ], [ %253, %152 ], [ %114, %146 ]
  %271 = phi float [ %115, %141 ], [ %115, %102 ], [ %209, %152 ], [ %115, %146 ]
  %272 = phi float [ %116, %141 ], [ %116, %102 ], [ %225, %152 ], [ %116, %146 ]
  %273 = phi float [ %117, %141 ], [ %117, %102 ], [ %241, %152 ], [ %117, %146 ]
  %274 = phi float [ %118, %141 ], [ %118, %102 ], [ %257, %152 ], [ %118, %146 ]
  %275 = fsub fast float 1.000000e+00, %53
  %276 = fmul fast float %52, 2.000000e+00
  %277 = fmul fast float %275, 2.000000e+00
  %278 = fadd fast float %276, -1.000000e+00
  %279 = fadd fast float %277, -1.000000e+00
  %280 = fmul fast float %259, %278
  %281 = call float @dx.op.tertiary.f32(i32 46, float %263, float %279, float %280)  ; FMad(a,b,c)
  %282 = call float @dx.op.tertiary.f32(i32 46, float %267, float %57, float %281)  ; FMad(a,b,c)
  %283 = fadd fast float %282, %271
  %284 = fmul fast float %260, %278
  %285 = call float @dx.op.tertiary.f32(i32 46, float %264, float %279, float %284)  ; FMad(a,b,c)
  %286 = call float @dx.op.tertiary.f32(i32 46, float %268, float %57, float %285)  ; FMad(a,b,c)
  %287 = fadd fast float %286, %272
  %288 = fmul fast float %261, %278
  %289 = call float @dx.op.tertiary.f32(i32 46, float %265, float %279, float %288)  ; FMad(a,b,c)
  %290 = call float @dx.op.tertiary.f32(i32 46, float %269, float %57, float %289)  ; FMad(a,b,c)
  %291 = fadd fast float %290, %273
  %292 = fmul fast float %262, %278
  %293 = call float @dx.op.tertiary.f32(i32 46, float %266, float %279, float %292)  ; FMad(a,b,c)
  %294 = call float @dx.op.tertiary.f32(i32 46, float %270, float %57, float %293)  ; FMad(a,b,c)
  %295 = fadd fast float %294, %274
  %296 = fmul fast float %283, %120
  %297 = call float @dx.op.tertiary.f32(i32 46, float %125, float %287, float %296)  ; FMad(a,b,c)
  %298 = call float @dx.op.tertiary.f32(i32 46, float %130, float %291, float %297)  ; FMad(a,b,c)
  %299 = call float @dx.op.tertiary.f32(i32 46, float %135, float %295, float %298)  ; FMad(a,b,c)
  %300 = fmul fast float %283, %121
  %301 = call float @dx.op.tertiary.f32(i32 46, float %126, float %287, float %300)  ; FMad(a,b,c)
  %302 = call float @dx.op.tertiary.f32(i32 46, float %131, float %291, float %301)  ; FMad(a,b,c)
  %303 = call float @dx.op.tertiary.f32(i32 46, float %136, float %295, float %302)  ; FMad(a,b,c)
  %304 = fmul fast float %283, %122
  %305 = call float @dx.op.tertiary.f32(i32 46, float %127, float %287, float %304)  ; FMad(a,b,c)
  %306 = call float @dx.op.tertiary.f32(i32 46, float %132, float %291, float %305)  ; FMad(a,b,c)
  %307 = call float @dx.op.tertiary.f32(i32 46, float %137, float %295, float %306)  ; FMad(a,b,c)
  %308 = fmul fast float %283, %123
  %309 = call float @dx.op.tertiary.f32(i32 46, float %128, float %287, float %308)  ; FMad(a,b,c)
  %310 = call float @dx.op.tertiary.f32(i32 46, float %133, float %291, float %309)  ; FMad(a,b,c)
  %311 = call float @dx.op.tertiary.f32(i32 46, float %138, float %295, float %310)  ; FMad(a,b,c)
  %312 = fdiv fast float %299, %311
  %313 = fdiv fast float %303, %311
  %314 = fadd fast float %312, 1.000000e+00
  %315 = fadd fast float %313, 1.000000e+00
  %316 = fmul fast float %314, 5.000000e-01
  %317 = fmul fast float %315, 5.000000e-01
  %318 = fsub fast float 1.000000e+00, %317
  %319 = fdiv fast float %307, %311
  %320 = call float @dx.op.binary.f32(i32 35, float %319, float 0.000000e+00)  ; FMax(a,b)
  %321 = fcmp fast olt float %316, 0.000000e+00
  %322 = fcmp fast olt float %318, 0.000000e+00
  %323 = or i1 %321, %322
  %324 = fcmp fast oge float %316, 1.000000e+00
  %325 = or i1 %324, %323
  %326 = xor i1 %325, true
  %327 = fcmp ult float %318, 1.000000e+00
  %328 = and i1 %327, %326
  br i1 %328, label %329, label %353

; <label>:329                                     ; preds = %258
  %330 = fmul fast float %316, %16
  %331 = fadd fast float %330, -5.000000e-01
  %332 = call float @dx.op.unary.f32(i32 26, float %331)  ; Round_ne(value)
  %333 = fptoui float %332 to i32
  %334 = fmul fast float %318, %17
  %335 = fadd fast float %334, -5.000000e-01
  %336 = call float @dx.op.unary.f32(i32 26, float %335)  ; Round_ne(value)
  %337 = fptoui float %336 to i32
  br i1 %59, label %340, label %338

; <label>:338                                     ; preds = %329
  %339 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %4, %dx.types.ResourceProperties { i32 4098, i32 261 })  ; AnnotateHandle(res,props)  resource: RWTexture2D<U32>
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %339, i32 %333, i32 %337, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %342

; <label>:340                                     ; preds = %329
  %341 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %3, %dx.types.ResourceProperties { i32 4098, i32 261 })  ; AnnotateHandle(res,props)  resource: RWTexture2D<U32>
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %341, i32 %333, i32 %337, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %342

; <label>:342                                     ; preds = %340, %338
  %343 = and i32 %11, 65535
  %344 = shl i32 %12, 16
  %345 = or i32 %344, %343
  %346 = bitcast float %320 to i32
  %347 = zext i32 %345 to i64
  %348 = zext i32 %346 to i64
  %349 = shl nuw i64 %348, 32
  %350 = or i64 %349, %347
  %351 = call %dx.types.Handle @dx.op.annotateHandle(i32 216, %dx.types.Handle %1, %dx.types.ResourceProperties { i32 4098, i32 261 })  ; AnnotateHandle(res,props)  resource: RWTexture2D<U32>
  %352 = call i64 @dx.op.atomicBinOp.i64(i32 78, %dx.types.Handle %351, i32 7, i32 %333, i32 %337, i32 undef, i64 %350)  ; AtomicBinOp(handle,atomicOp,offset0,offset1,offset2,newValue)
  br label %353

; <label>:353                                     ; preds = %342, %258, %40, %34, %30, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @dx.op.threadId.i32(i32, i32) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32, i8) #2

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32, %dx.types.Handle, %dx.types.Handle, float, float, float, float, i32, i32, i32, float) #1

; Function Attrs: nounwind readnone
declare float @dx.op.binary.f32(i32, float, float) #0

; Function Attrs: nounwind readnone
declare float @dx.op.unary.f32(i32, float) #0

; Function Attrs: nounwind
declare i64 @dx.op.atomicBinOp.i64(i32, %dx.types.Handle, i32, i32, i32, i32, i64) #2

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readnone
declare float @dx.op.tertiary.f32(i32, float, float, float) #0

; Function Attrs: nounwind readnone
declare %dx.types.Handle @dx.op.annotateHandle(i32, %dx.types.Handle, %dx.types.ResourceProperties) #0

; Function Attrs: nounwind readnone
declare %dx.types.Handle @dx.op.createHandleFromBinding(i32, %dx.types.ResBind, i32, i1) #0

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind readonly }
attributes #2 = { nounwind }

!llvm.ident = !{!0}
!dx.version = !{!1}
!dx.valver = !{!2}
!dx.shaderModel = !{!3}
!dx.resources = !{!4}
!dx.entryPoints = !{!21}

!0 = !{!"dxcoob 1.8.2502.11 (239921522)"}
!1 = !{i32 1, i32 6}
!2 = !{i32 1, i32 8}
!3 = !{!"cs", i32 6, i32 6}
!4 = !{!5, !11, !17, !19}
!5 = !{!6, !8, !10}
!6 = !{i32 0, %"class.Texture2D<float>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i32 0, !7}
!7 = !{i32 0, i32 9}
!8 = !{i32 1, %"class.Texture2D<unsigned int>"* undef, !"", i32 0, i32 3, i32 1, i32 2, i32 0, !9}
!9 = !{i32 0, i32 5}
!10 = !{i32 2, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 1, i32 0, i32 1, i32 2, i32 0, !7}
!11 = !{!12, !13, !14, !15}
!12 = !{i32 0, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !9}
!13 = !{i32 1, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 1, i32 1, i32 2, i1 false, i1 false, i1 false, !9}
!14 = !{i32 2, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 2, i32 1, i32 2, i1 false, i1 false, i1 false, !9}
!15 = !{i32 3, %"class.RWTexture2D<unsigned long long>"* undef, !"", i32 3, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !16}
!16 = !{i32 0, i32 5, i32 3, i32 1}
!17 = !{!18}
!18 = !{i32 0, %hostlayout.matrices* undef, !"", i32 0, i32 0, i32 1, i32 2440, null}
!19 = !{!20}
!20 = !{i32 0, %struct.SamplerState* undef, !"", i32 1, i32 0, i32 1, i32 0, null}
!21 = !{void ()* @main, !"main", null, !4, !22}
!22 = !{i32 0, i64 135266304, i32 4, !23}
!23 = !{i32 16, i32 16, i32 1}
