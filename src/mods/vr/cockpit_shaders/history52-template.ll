;
; Note: shader requires additional functionality:
;       Typed UAV Load Additional Formats
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
; shader hash: 087200917a0e2c2a5d8749c708ea90ee
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
; _SrcColorTex                      texture     f32          2d      T0             t0     1
; _SrcDepthTex                      texture     f32          2d      T1             t1     1
; _SrcEyeMaskTex                    texture     u32          2d      T2             t3     1
; _UIColorAndAlphaTex               texture     f32          2d      T3      t0,space1     1
; _DestColorTex                         UAV     f32          2d      U0             u0     1
; _DestDepthTex                         UAV     u32          2d      U1             u1     1
; _CountTex1                            UAV     u32          2d      U2      u0,space1     1
; _CountTex2                            UAV     u32          2d      U3      u1,space1     1
; _OccludedMaskTex                      UAV     u32          2d      U4      u2,space1     1
; _MovingObjEyeMaskTex                  UAV     u32          2d      U5      u0,space2     1
;
target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.Handle = type { i8* }
%dx.types.CBufRet.f32 = type { float, float, float, float }
%dx.types.CBufRet.i32 = type { i32, i32, i32, i32 }
%dx.types.ResRet.f32 = type { float, float, float, float, i32 }
%dx.types.ResRet.i32 = type { i32, i32, i32, i32, i32 }
%"class.Texture2D<vector<float, 4> >" = type { <4 x float>, %"class.Texture2D<vector<float, 4> >::mips_type" }
%"class.Texture2D<vector<float, 4> >::mips_type" = type { i32 }
%"class.Texture2D<float>" = type { float, %"class.Texture2D<float>::mips_type" }
%"class.Texture2D<float>::mips_type" = type { i32 }
%"class.Texture2D<unsigned int>" = type { i32, %"class.Texture2D<unsigned int>::mips_type" }
%"class.Texture2D<unsigned int>::mips_type" = type { i32 }
%"class.RWTexture2D<vector<float, 4> >" = type { <4 x float> }
%"class.RWTexture2D<unsigned int>" = type { i32 }
%hostlayout.matrices = type { [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], <4 x float>, <2 x float>, <4 x float>, <4 x float>, <4 x float>, float, float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.SamplerState = type { i32 }

define void @main() {
  %1 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 5, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %2 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 4, i32 2, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %3 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 3, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %4 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 2, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %5 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %6 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %7 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 3, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %8 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 2, i32 3, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %9 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %10 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %11 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 3, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %12 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 2, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %13 = call i32 @dx.op.threadId.i32(i32 93, i32 0)  ; ThreadId(component)
  %14 = call i32 @dx.op.threadId.i32(i32 93, i32 1)  ; ThreadId(component)
  %15 = uitofp i32 %13 to float
  %16 = uitofp i32 %14 to float
  %17 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %18 = extractvalue %dx.types.CBufRet.f32 %17, 0
  %19 = extractvalue %dx.types.CBufRet.f32 %17, 1
  %20 = fcmp fast oge float %15, %18
  %21 = fcmp fast oge float %16, %19
  %22 = or i1 %20, %21
  br i1 %22, label %373, label %23

; <label>:23                                      ; preds = %0
  %24 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 149)  ; CBufferLoadLegacy(handle,regIndex)
  %25 = extractvalue %dx.types.CBufRet.i32 %24, 3
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %23
  %28 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %7, i32 0, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %29 = extractvalue %dx.types.ResRet.f32 %28, 3
  %30 = fcmp fast ogt float %29, 0.000000e+00
  br i1 %30, label %31, label %36

; <label>:31                                      ; preds = %27
  %32 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 151)  ; CBufferLoadLegacy(handle,regIndex)
  %33 = extractvalue %dx.types.CBufRet.i32 %32, 0
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %373, label %35

; <label>:35                                      ; preds = %31
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %2, i32 %13, i32 %14, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %373

; <label>:36                                      ; preds = %27, %23
  %37 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %38 = extractvalue %dx.types.CBufRet.i32 %37, 1
  %39 = icmp sgt i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %36
  %41 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %8, i32 0, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %42 = extractvalue %dx.types.ResRet.i32 %41, 0
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %373, label %44

; <label>:44                                      ; preds = %40, %36
  %45 = phi i1 [ %39, %40 ], [ false, %36 ]
  br i1 %45, label %46, label %50

; <label>:46                                      ; preds = %44
  %47 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %8, i32 0, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %48 = extractvalue %dx.types.ResRet.i32 %47, 0
  %49 = icmp eq i32 %48, 10
  br i1 %49, label %373, label %50

; <label>:50                                      ; preds = %46, %44
  %51 = fadd fast float %15, 5.000000e-01
  %52 = fadd fast float %16, 5.000000e-01
  %53 = extractvalue %dx.types.CBufRet.f32 %17, 2
  %54 = extractvalue %dx.types.CBufRet.f32 %17, 3
  %55 = fmul fast float %53, %51
  %56 = fmul fast float %54, %52
  %57 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %9, %dx.types.Handle %11, float %55, float %56, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %58 = extractvalue %dx.types.ResRet.f32 %57, 0
  %59 = extractvalue %dx.types.CBufRet.i32 %37, 2
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %82, label %61

; <label>:61                                      ; preds = %50
  %62 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 92)  ; CBufferLoadLegacy(handle,regIndex)
  %63 = extractvalue %dx.types.CBufRet.f32 %62, 0
  %64 = extractvalue %dx.types.CBufRet.f32 %62, 1
  %65 = extractvalue %dx.types.CBufRet.f32 %62, 2
  %66 = extractvalue %dx.types.CBufRet.f32 %62, 3
  %67 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 93)  ; CBufferLoadLegacy(handle,regIndex)
  %68 = extractvalue %dx.types.CBufRet.f32 %67, 0
  %69 = extractvalue %dx.types.CBufRet.f32 %67, 1
  %70 = extractvalue %dx.types.CBufRet.f32 %67, 2
  %71 = extractvalue %dx.types.CBufRet.f32 %67, 3
  %72 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 94)  ; CBufferLoadLegacy(handle,regIndex)
  %73 = extractvalue %dx.types.CBufRet.f32 %72, 0
  %74 = extractvalue %dx.types.CBufRet.f32 %72, 1
  %75 = extractvalue %dx.types.CBufRet.f32 %72, 2
  %76 = extractvalue %dx.types.CBufRet.f32 %72, 3
  %77 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 95)  ; CBufferLoadLegacy(handle,regIndex)
  %78 = extractvalue %dx.types.CBufRet.f32 %77, 0
  %79 = extractvalue %dx.types.CBufRet.f32 %77, 1
  %80 = extractvalue %dx.types.CBufRet.f32 %77, 2
  %81 = extractvalue %dx.types.CBufRet.f32 %77, 3
  br label %103

; <label>:82                                      ; preds = %50
  %83 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 44)  ; CBufferLoadLegacy(handle,regIndex)
  %84 = extractvalue %dx.types.CBufRet.f32 %83, 0
  %85 = extractvalue %dx.types.CBufRet.f32 %83, 1
  %86 = extractvalue %dx.types.CBufRet.f32 %83, 2
  %87 = extractvalue %dx.types.CBufRet.f32 %83, 3
  %88 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 45)  ; CBufferLoadLegacy(handle,regIndex)
  %89 = extractvalue %dx.types.CBufRet.f32 %88, 0
  %90 = extractvalue %dx.types.CBufRet.f32 %88, 1
  %91 = extractvalue %dx.types.CBufRet.f32 %88, 2
  %92 = extractvalue %dx.types.CBufRet.f32 %88, 3
  %93 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 46)  ; CBufferLoadLegacy(handle,regIndex)
  %94 = extractvalue %dx.types.CBufRet.f32 %93, 0
  %95 = extractvalue %dx.types.CBufRet.f32 %93, 1
  %96 = extractvalue %dx.types.CBufRet.f32 %93, 2
  %97 = extractvalue %dx.types.CBufRet.f32 %93, 3
  %98 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 47)  ; CBufferLoadLegacy(handle,regIndex)
  %99 = extractvalue %dx.types.CBufRet.f32 %98, 0
  %100 = extractvalue %dx.types.CBufRet.f32 %98, 1
  %101 = extractvalue %dx.types.CBufRet.f32 %98, 2
  %102 = extractvalue %dx.types.CBufRet.f32 %98, 3
  br label %103

; <label>:103                                     ; preds = %82, %61
  %104 = phi float [ %63, %61 ], [ %84, %82 ]
  %105 = phi float [ %64, %61 ], [ %85, %82 ]
  %106 = phi float [ %65, %61 ], [ %86, %82 ]
  %107 = phi float [ %66, %61 ], [ %87, %82 ]
  %108 = phi float [ %68, %61 ], [ %89, %82 ]
  %109 = phi float [ %69, %61 ], [ %90, %82 ]
  %110 = phi float [ %70, %61 ], [ %91, %82 ]
  %111 = phi float [ %71, %61 ], [ %92, %82 ]
  %112 = phi float [ %73, %61 ], [ %94, %82 ]
  %113 = phi float [ %74, %61 ], [ %95, %82 ]
  %114 = phi float [ %75, %61 ], [ %96, %82 ]
  %115 = phi float [ %76, %61 ], [ %97, %82 ]
  %116 = phi float [ %78, %61 ], [ %99, %82 ]
  %117 = phi float [ %79, %61 ], [ %100, %82 ]
  %118 = phi float [ %80, %61 ], [ %101, %82 ]
  %119 = phi float [ %81, %61 ], [ %102, %82 ]
  %120 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 16)  ; CBufferLoadLegacy(handle,regIndex)
  %121 = extractvalue %dx.types.CBufRet.f32 %120, 0
  %122 = extractvalue %dx.types.CBufRet.f32 %120, 1
  %123 = extractvalue %dx.types.CBufRet.f32 %120, 2
  %124 = extractvalue %dx.types.CBufRet.f32 %120, 3
  %125 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 17)  ; CBufferLoadLegacy(handle,regIndex)
  %126 = extractvalue %dx.types.CBufRet.f32 %125, 0
  %127 = extractvalue %dx.types.CBufRet.f32 %125, 1
  %128 = extractvalue %dx.types.CBufRet.f32 %125, 2
  %129 = extractvalue %dx.types.CBufRet.f32 %125, 3
  %130 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 18)  ; CBufferLoadLegacy(handle,regIndex)
  %131 = extractvalue %dx.types.CBufRet.f32 %130, 0
  %132 = extractvalue %dx.types.CBufRet.f32 %130, 1
  %133 = extractvalue %dx.types.CBufRet.f32 %130, 2
  %134 = extractvalue %dx.types.CBufRet.f32 %130, 3
  %135 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 19)  ; CBufferLoadLegacy(handle,regIndex)
  %136 = extractvalue %dx.types.CBufRet.f32 %135, 0
  %137 = extractvalue %dx.types.CBufRet.f32 %135, 1
  %138 = extractvalue %dx.types.CBufRet.f32 %135, 2
  %139 = extractvalue %dx.types.CBufRet.f32 %135, 3
  br i1 %60, label %258, label %140

; <label>:140                                     ; preds = %103
  %141 = icmp eq i32 %38, 0
  br i1 %141, label %146, label %142

; <label>:142                                     ; preds = %140
  %143 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %8, i32 0, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %144 = extractvalue %dx.types.ResRet.i32 %143, 0
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %258

; <label>:146                                     ; preds = %142, %140
  %147 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 35)  ; CBufferLoadLegacy(handle,regIndex)
  %148 = extractvalue %dx.types.CBufRet.f32 %147, 2
  %149 = fadd fast float %58, 0x3EB0C6F7A0000000
  %150 = fdiv fast float %148, %149
  %151 = fcmp fast olt float %150, 1.000000e+00
  br i1 %151, label %152, label %258

; <label>:152                                     ; preds = %146
  %153 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 76)  ; CBufferLoadLegacy(handle,regIndex)
  %154 = extractvalue %dx.types.CBufRet.f32 %153, 0
  %155 = extractvalue %dx.types.CBufRet.f32 %153, 1
  %156 = extractvalue %dx.types.CBufRet.f32 %153, 2
  %157 = extractvalue %dx.types.CBufRet.f32 %153, 3
  %158 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 77)  ; CBufferLoadLegacy(handle,regIndex)
  %159 = extractvalue %dx.types.CBufRet.f32 %158, 0
  %160 = extractvalue %dx.types.CBufRet.f32 %158, 1
  %161 = extractvalue %dx.types.CBufRet.f32 %158, 2
  %162 = extractvalue %dx.types.CBufRet.f32 %158, 3
  %163 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 78)  ; CBufferLoadLegacy(handle,regIndex)
  %164 = extractvalue %dx.types.CBufRet.f32 %163, 0
  %165 = extractvalue %dx.types.CBufRet.f32 %163, 1
  %166 = extractvalue %dx.types.CBufRet.f32 %163, 2
  %167 = extractvalue %dx.types.CBufRet.f32 %163, 3
  %168 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 79)  ; CBufferLoadLegacy(handle,regIndex)
  %169 = extractvalue %dx.types.CBufRet.f32 %168, 3
  %170 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 7)  ; CBufferLoadLegacy(handle,regIndex)
  %171 = extractvalue %dx.types.CBufRet.f32 %170, 0
  %172 = extractvalue %dx.types.CBufRet.f32 %170, 1
  %173 = extractvalue %dx.types.CBufRet.f32 %170, 2
  %previous0 = extractvalue %dx.types.CBufRet.f32 %168, 0
  %compensated0 = fadd float %171, 0.000000e+00
  %previous1 = extractvalue %dx.types.CBufRet.f32 %168, 1
  %compensated1 = fadd float %172, 0.000000e+00
  %previous2 = extractvalue %dx.types.CBufRet.f32 %168, 2
  %compensated2 = fadd float %173, 0.000000e+00
  %174 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 84)  ; CBufferLoadLegacy(handle,regIndex)
  %175 = extractvalue %dx.types.CBufRet.f32 %174, 0
  %176 = extractvalue %dx.types.CBufRet.f32 %174, 1
  %177 = extractvalue %dx.types.CBufRet.f32 %174, 2
  %178 = extractvalue %dx.types.CBufRet.f32 %174, 3
  %179 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 85)  ; CBufferLoadLegacy(handle,regIndex)
  %180 = extractvalue %dx.types.CBufRet.f32 %179, 0
  %181 = extractvalue %dx.types.CBufRet.f32 %179, 1
  %182 = extractvalue %dx.types.CBufRet.f32 %179, 2
  %183 = extractvalue %dx.types.CBufRet.f32 %179, 3
  %184 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 86)  ; CBufferLoadLegacy(handle,regIndex)
  %185 = extractvalue %dx.types.CBufRet.f32 %184, 0
  %186 = extractvalue %dx.types.CBufRet.f32 %184, 1
  %187 = extractvalue %dx.types.CBufRet.f32 %184, 2
  %188 = extractvalue %dx.types.CBufRet.f32 %184, 3
  %189 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %12, i32 87)  ; CBufferLoadLegacy(handle,regIndex)
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

; <label>:258                                     ; preds = %152, %146, %142, %103
  %259 = phi float [ %197, %152 ], [ %104, %146 ], [ %104, %142 ], [ %104, %103 ]
  %260 = phi float [ %213, %152 ], [ %105, %146 ], [ %105, %142 ], [ %105, %103 ]
  %261 = phi float [ %229, %152 ], [ %106, %146 ], [ %106, %142 ], [ %106, %103 ]
  %262 = phi float [ %245, %152 ], [ %107, %146 ], [ %107, %142 ], [ %107, %103 ]
  %263 = phi float [ %201, %152 ], [ %108, %146 ], [ %108, %142 ], [ %108, %103 ]
  %264 = phi float [ %217, %152 ], [ %109, %146 ], [ %109, %142 ], [ %109, %103 ]
  %265 = phi float [ %233, %152 ], [ %110, %146 ], [ %110, %142 ], [ %110, %103 ]
  %266 = phi float [ %249, %152 ], [ %111, %146 ], [ %111, %142 ], [ %111, %103 ]
  %267 = phi float [ %205, %152 ], [ %112, %146 ], [ %112, %142 ], [ %112, %103 ]
  %268 = phi float [ %221, %152 ], [ %113, %146 ], [ %113, %142 ], [ %113, %103 ]
  %269 = phi float [ %237, %152 ], [ %114, %146 ], [ %114, %142 ], [ %114, %103 ]
  %270 = phi float [ %253, %152 ], [ %115, %146 ], [ %115, %142 ], [ %115, %103 ]
  %271 = phi float [ %209, %152 ], [ %116, %146 ], [ %116, %142 ], [ %116, %103 ]
  %272 = phi float [ %225, %152 ], [ %117, %146 ], [ %117, %142 ], [ %117, %103 ]
  %273 = phi float [ %241, %152 ], [ %118, %146 ], [ %118, %142 ], [ %118, %103 ]
  %274 = phi float [ %257, %152 ], [ %119, %146 ], [ %119, %142 ], [ %119, %103 ]
  %275 = fsub fast float 1.000000e+00, %56
  %276 = fmul fast float %55, 2.000000e+00
  %277 = fmul fast float %275, 2.000000e+00
  %278 = fadd fast float %276, -1.000000e+00
  %279 = fadd fast float %277, -1.000000e+00
  %280 = fmul fast float %259, %278
  %281 = call float @dx.op.tertiary.f32(i32 46, float %263, float %279, float %280)  ; FMad(a,b,c)
  %282 = call float @dx.op.tertiary.f32(i32 46, float %267, float %58, float %281)  ; FMad(a,b,c)
  %283 = fadd fast float %282, %271
  %284 = fmul fast float %260, %278
  %285 = call float @dx.op.tertiary.f32(i32 46, float %264, float %279, float %284)  ; FMad(a,b,c)
  %286 = call float @dx.op.tertiary.f32(i32 46, float %268, float %58, float %285)  ; FMad(a,b,c)
  %287 = fadd fast float %286, %272
  %288 = fmul fast float %261, %278
  %289 = call float @dx.op.tertiary.f32(i32 46, float %265, float %279, float %288)  ; FMad(a,b,c)
  %290 = call float @dx.op.tertiary.f32(i32 46, float %269, float %58, float %289)  ; FMad(a,b,c)
  %291 = fadd fast float %290, %273
  %292 = fmul fast float %262, %278
  %293 = call float @dx.op.tertiary.f32(i32 46, float %266, float %279, float %292)  ; FMad(a,b,c)
  %294 = call float @dx.op.tertiary.f32(i32 46, float %270, float %58, float %293)  ; FMad(a,b,c)
  %295 = fadd fast float %294, %274
  %296 = fmul fast float %283, %121
  %297 = call float @dx.op.tertiary.f32(i32 46, float %126, float %287, float %296)  ; FMad(a,b,c)
  %298 = call float @dx.op.tertiary.f32(i32 46, float %131, float %291, float %297)  ; FMad(a,b,c)
  %299 = call float @dx.op.tertiary.f32(i32 46, float %136, float %295, float %298)  ; FMad(a,b,c)
  %300 = fmul fast float %283, %122
  %301 = call float @dx.op.tertiary.f32(i32 46, float %127, float %287, float %300)  ; FMad(a,b,c)
  %302 = call float @dx.op.tertiary.f32(i32 46, float %132, float %291, float %301)  ; FMad(a,b,c)
  %303 = call float @dx.op.tertiary.f32(i32 46, float %137, float %295, float %302)  ; FMad(a,b,c)
  %304 = fmul fast float %283, %124
  %305 = call float @dx.op.tertiary.f32(i32 46, float %129, float %287, float %304)  ; FMad(a,b,c)
  %306 = call float @dx.op.tertiary.f32(i32 46, float %134, float %291, float %305)  ; FMad(a,b,c)
  %307 = call float @dx.op.tertiary.f32(i32 46, float %139, float %295, float %306)  ; FMad(a,b,c)
  %308 = fdiv fast float %299, %307
  %309 = fdiv fast float %303, %307
  %310 = fadd fast float %308, 1.000000e+00
  %311 = fadd fast float %309, 1.000000e+00
  %312 = fmul fast float %310, 5.000000e-01
  %313 = fmul fast float %311, 5.000000e-01
  %314 = fsub fast float 1.000000e+00, %313
  %315 = fcmp fast olt float %312, 0.000000e+00
  %316 = fcmp fast olt float %314, 0.000000e+00
  %317 = or i1 %315, %316
  %318 = fcmp fast oge float %312, 1.000000e+00
  %319 = or i1 %318, %317
  %320 = fcmp fast oge float %314, 1.000000e+00
  %321 = or i1 %320, %319
  br i1 %321, label %373, label %322

; <label>:322                                     ; preds = %258
  %323 = fmul fast float %283, %123
  %324 = call float @dx.op.tertiary.f32(i32 46, float %128, float %287, float %323)  ; FMad(a,b,c)
  %325 = call float @dx.op.tertiary.f32(i32 46, float %133, float %291, float %324)  ; FMad(a,b,c)
  %326 = call float @dx.op.tertiary.f32(i32 46, float %138, float %295, float %325)  ; FMad(a,b,c)
  %327 = fdiv fast float %326, %307
  %328 = call float @dx.op.binary.f32(i32 35, float %327, float 0.000000e+00)  ; FMax(a,b)
  %329 = fmul fast float %312, %18
  %330 = fadd fast float %329, -5.000000e-01
  %331 = call float @dx.op.unary.f32(i32 26, float %330)  ; Round_ne(value)
  %332 = fptoui float %331 to i32
  %333 = fmul fast float %314, %19
  %334 = fadd fast float %333, -5.000000e-01
  %335 = call float @dx.op.unary.f32(i32 26, float %334)  ; Round_ne(value)
  %336 = fptoui float %335 to i32
  %337 = bitcast float %328 to i32
  %338 = call i32 @dx.op.atomicBinOp.i32(i32 78, %dx.types.Handle %5, i32 7, i32 %332, i32 %336, i32 undef, i32 %337)  ; AtomicBinOp(handle,atomicOp,offset0,offset1,offset2,newValue)
  %339 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %340 = extractvalue %dx.types.CBufRet.i32 %339, 2
  %341 = icmp eq i32 %340, 0
  br i1 %341, label %343, label %342, !dx.controlflow.hints !26

; <label>:342                                     ; preds = %322
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %4, i32 %332, i32 %336, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %344

; <label>:343                                     ; preds = %322
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %3, i32 %332, i32 %336, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %344

; <label>:344                                     ; preds = %343, %342
  call void @dx.op.barrier(i32 80, i32 10)  ; Barrier(barrierMode)
  %345 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %5, i32 undef, i32 %332, i32 %336, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %346 = extractvalue %dx.types.ResRet.i32 %345, 0
  %347 = icmp eq i32 %346, %337
  br i1 %347, label %348, label %373

; <label>:348                                     ; preds = %344
  %349 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %350 = extractvalue %dx.types.CBufRet.i32 %349, 0
  %351 = icmp eq i32 %350, 0
  br i1 %351, label %356, label %352

; <label>:352                                     ; preds = %348
  %353 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %1, i32 undef, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %354 = extractvalue %dx.types.ResRet.i32 %353, 0
  %355 = icmp eq i32 %354, 10
  br label %356

; <label>:356                                     ; preds = %352, %348
  %357 = phi i1 [ false, %348 ], [ %355, %352 ]
  br i1 %357, label %358, label %359

; <label>:358                                     ; preds = %356
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %2, i32 %332, i32 %336, i32 undef, i32 10, i32 10, i32 10, i32 10, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %359

; <label>:359                                     ; preds = %358, %356
  %360 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %12, i32 152)  ; CBufferLoadLegacy(handle,regIndex)
  %361 = extractvalue %dx.types.CBufRet.i32 %360, 0
  %362 = icmp ugt i32 %361, 9
  br i1 %362, label %363, label %367, !dx.controlflow.hints !27

; <label>:363                                     ; preds = %359
  %364 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %6, i32 undef, i32 %332, i32 %336, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %365 = extractvalue %dx.types.ResRet.f32 %364, 2
  %366 = extractvalue %dx.types.ResRet.f32 %364, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %6, i32 %332, i32 %336, i32 undef, float %55, float %56, float %365, float %366, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %373

; <label>:367                                     ; preds = %359
  %368 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %10, i32 0, i32 %13, i32 %14, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %369 = extractvalue %dx.types.ResRet.f32 %368, 0
  %370 = extractvalue %dx.types.ResRet.f32 %368, 1
  %371 = extractvalue %dx.types.ResRet.f32 %368, 2
  %372 = extractvalue %dx.types.ResRet.f32 %368, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %6, i32 %332, i32 %336, i32 undef, float %369, float %370, float %371, float %372, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %373

; <label>:373                                     ; preds = %367, %363, %344, %258, %46, %40, %35, %31, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @dx.op.threadId.i32(i32, i32) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.f32(i32, %dx.types.Handle, i32, i32, i32, float, float, float, float, i8) #2

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32, i8) #2

; Function Attrs: nounwind
declare i32 @dx.op.atomicBinOp.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32) #2

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32, %dx.types.Handle, %dx.types.Handle, float, float, float, float, i32, i32, i32, float) #1

; Function Attrs: nounwind readnone
declare float @dx.op.binary.f32(i32, float, float) #0

; Function Attrs: nounwind readnone
declare float @dx.op.unary.f32(i32, float) #0

; Function Attrs: noduplicate nounwind
declare void @dx.op.barrier(i32, i32) #3

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readonly
declare %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32, %dx.types.Handle, i32) #1

; Function Attrs: nounwind readnone
declare float @dx.op.tertiary.f32(i32, float, float, float) #0

; Function Attrs: nounwind readonly
declare %dx.types.Handle @dx.op.createHandle(i32, i8, i32, i32, i1) #1

attributes #0 = { nounwind readnone }
attributes #1 = { nounwind readonly }
attributes #2 = { nounwind }
attributes #3 = { noduplicate nounwind }

!llvm.ident = !{!0}
!dx.version = !{!1}
!dx.valver = !{!2}
!dx.shaderModel = !{!3}
!dx.resources = !{!4}
!dx.entryPoints = !{!23}

!0 = !{!"dxcoob 1.8.2502.11 (239921522)"}
!1 = !{i32 1, i32 1}
!2 = !{i32 1, i32 8}
!3 = !{!"cs", i32 6, i32 1}
!4 = !{!5, !12, !19, !21}
!5 = !{!6, !8, !9, !11}
!6 = !{i32 0, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i32 0, !7}
!7 = !{i32 0, i32 9}
!8 = !{i32 1, %"class.Texture2D<float>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i32 0, !7}
!9 = !{i32 2, %"class.Texture2D<unsigned int>"* undef, !"", i32 0, i32 3, i32 1, i32 2, i32 0, !10}
!10 = !{i32 0, i32 5}
!11 = !{i32 3, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 1, i32 0, i32 1, i32 2, i32 0, !7}
!12 = !{!13, !14, !15, !16, !17, !18}
!13 = !{i32 0, %"class.RWTexture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !7}
!14 = !{i32 1, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!15 = !{i32 2, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!16 = !{i32 3, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 1, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!17 = !{i32 4, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 2, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!18 = !{i32 5, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 2, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!19 = !{!20}
!20 = !{i32 0, %hostlayout.matrices* undef, !"", i32 0, i32 0, i32 1, i32 2440, null}
!21 = !{!22}
!22 = !{i32 0, %struct.SamplerState* undef, !"", i32 1, i32 0, i32 1, i32 0, null}
!23 = !{void ()* @main, !"main", null, !4, !24}
!24 = !{i32 0, i64 8192, i32 4, !25}
!25 = !{i32 16, i32 16, i32 1}
!26 = distinct !{!26, !"dx.controlflow.hints", i32 1}
!27 = distinct !{!27, !"dx.controlflow.hints", i32 1}
