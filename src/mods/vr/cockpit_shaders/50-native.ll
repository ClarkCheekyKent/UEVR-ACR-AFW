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
; shader hash: c8a9ab5ce51087cd929666a8b71af8ba
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
; _SrcVelocityTex                   texture     f32          2d      T3      t0,space1     1
; _BackupColorTex                   texture     f32          2d      T4      t0,space2     1
; _DestColorTex                         UAV     f32          2d      U0             u0     1
; _DestDepthTex                         UAV     u32          2d      U1             u1     1
; _OccludedMaskTex                      UAV     u32          2d      U2      u2,space1     1
; _MovingObjEyeMaskTex                  UAV     u32          2d      U3      u0,space2     1
;
target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.Handle = type { i8* }
%dx.types.CBufRet.f32 = type { float, float, float, float }
%dx.types.ResRet.f32 = type { float, float, float, float, i32 }
%dx.types.CBufRet.i32 = type { i32, i32, i32, i32 }
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
  %1 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 3, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %2 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 2, i32 2, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %3 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %4 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %5 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 4, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %6 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 3, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %7 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 2, i32 3, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %8 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 1, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %9 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %10 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 3, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %11 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 2, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %12 = call i32 @dx.op.threadId.i32(i32 93, i32 0)  ; ThreadId(component)
  %13 = call i32 @dx.op.threadId.i32(i32 93, i32 1)  ; ThreadId(component)
  %14 = uitofp i32 %12 to float
  %15 = uitofp i32 %13 to float
  %16 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %17 = extractvalue %dx.types.CBufRet.f32 %16, 0
  %18 = extractvalue %dx.types.CBufRet.f32 %16, 1
  %19 = fcmp fast oge float %14, %17
  %20 = fcmp fast oge float %15, %18
  %21 = or i1 %19, %20
  br i1 %21, label %464, label %22

; <label>:22                                      ; preds = %0
  %23 = fadd fast float %14, 5.000000e-01
  %24 = fadd fast float %15, 5.000000e-01
  %25 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %26 = extractvalue %dx.types.CBufRet.f32 %25, 2
  %27 = extractvalue %dx.types.CBufRet.f32 %25, 3
  %28 = fmul fast float %26, %23
  %29 = fmul fast float %27, %24
  %30 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %8, %dx.types.Handle %10, float %28, float %29, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %31 = extractvalue %dx.types.ResRet.f32 %30, 0
  %32 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %11, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %33 = extractvalue %dx.types.CBufRet.i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %56, label %35

; <label>:35                                      ; preds = %22
  %36 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 92)  ; CBufferLoadLegacy(handle,regIndex)
  %37 = extractvalue %dx.types.CBufRet.f32 %36, 0
  %38 = extractvalue %dx.types.CBufRet.f32 %36, 1
  %39 = extractvalue %dx.types.CBufRet.f32 %36, 2
  %40 = extractvalue %dx.types.CBufRet.f32 %36, 3
  %41 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 93)  ; CBufferLoadLegacy(handle,regIndex)
  %42 = extractvalue %dx.types.CBufRet.f32 %41, 0
  %43 = extractvalue %dx.types.CBufRet.f32 %41, 1
  %44 = extractvalue %dx.types.CBufRet.f32 %41, 2
  %45 = extractvalue %dx.types.CBufRet.f32 %41, 3
  %46 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 94)  ; CBufferLoadLegacy(handle,regIndex)
  %47 = extractvalue %dx.types.CBufRet.f32 %46, 0
  %48 = extractvalue %dx.types.CBufRet.f32 %46, 1
  %49 = extractvalue %dx.types.CBufRet.f32 %46, 2
  %50 = extractvalue %dx.types.CBufRet.f32 %46, 3
  %51 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 95)  ; CBufferLoadLegacy(handle,regIndex)
  %52 = extractvalue %dx.types.CBufRet.f32 %51, 0
  %53 = extractvalue %dx.types.CBufRet.f32 %51, 1
  %54 = extractvalue %dx.types.CBufRet.f32 %51, 2
  %55 = extractvalue %dx.types.CBufRet.f32 %51, 3
  br label %77

; <label>:56                                      ; preds = %22
  %57 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 44)  ; CBufferLoadLegacy(handle,regIndex)
  %58 = extractvalue %dx.types.CBufRet.f32 %57, 0
  %59 = extractvalue %dx.types.CBufRet.f32 %57, 1
  %60 = extractvalue %dx.types.CBufRet.f32 %57, 2
  %61 = extractvalue %dx.types.CBufRet.f32 %57, 3
  %62 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 45)  ; CBufferLoadLegacy(handle,regIndex)
  %63 = extractvalue %dx.types.CBufRet.f32 %62, 0
  %64 = extractvalue %dx.types.CBufRet.f32 %62, 1
  %65 = extractvalue %dx.types.CBufRet.f32 %62, 2
  %66 = extractvalue %dx.types.CBufRet.f32 %62, 3
  %67 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 46)  ; CBufferLoadLegacy(handle,regIndex)
  %68 = extractvalue %dx.types.CBufRet.f32 %67, 0
  %69 = extractvalue %dx.types.CBufRet.f32 %67, 1
  %70 = extractvalue %dx.types.CBufRet.f32 %67, 2
  %71 = extractvalue %dx.types.CBufRet.f32 %67, 3
  %72 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 47)  ; CBufferLoadLegacy(handle,regIndex)
  %73 = extractvalue %dx.types.CBufRet.f32 %72, 0
  %74 = extractvalue %dx.types.CBufRet.f32 %72, 1
  %75 = extractvalue %dx.types.CBufRet.f32 %72, 2
  %76 = extractvalue %dx.types.CBufRet.f32 %72, 3
  br label %77

; <label>:77                                      ; preds = %56, %35
  %78 = phi float [ %37, %35 ], [ %58, %56 ]
  %79 = phi float [ %38, %35 ], [ %59, %56 ]
  %80 = phi float [ %39, %35 ], [ %60, %56 ]
  %81 = phi float [ %40, %35 ], [ %61, %56 ]
  %82 = phi float [ %42, %35 ], [ %63, %56 ]
  %83 = phi float [ %43, %35 ], [ %64, %56 ]
  %84 = phi float [ %44, %35 ], [ %65, %56 ]
  %85 = phi float [ %45, %35 ], [ %66, %56 ]
  %86 = phi float [ %47, %35 ], [ %68, %56 ]
  %87 = phi float [ %48, %35 ], [ %69, %56 ]
  %88 = phi float [ %49, %35 ], [ %70, %56 ]
  %89 = phi float [ %50, %35 ], [ %71, %56 ]
  %90 = phi float [ %52, %35 ], [ %73, %56 ]
  %91 = phi float [ %53, %35 ], [ %74, %56 ]
  %92 = phi float [ %54, %35 ], [ %75, %56 ]
  %93 = phi float [ %55, %35 ], [ %76, %56 ]
  %94 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 16)  ; CBufferLoadLegacy(handle,regIndex)
  %95 = extractvalue %dx.types.CBufRet.f32 %94, 0
  %96 = extractvalue %dx.types.CBufRet.f32 %94, 1
  %97 = extractvalue %dx.types.CBufRet.f32 %94, 2
  %98 = extractvalue %dx.types.CBufRet.f32 %94, 3
  %99 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 17)  ; CBufferLoadLegacy(handle,regIndex)
  %100 = extractvalue %dx.types.CBufRet.f32 %99, 0
  %101 = extractvalue %dx.types.CBufRet.f32 %99, 1
  %102 = extractvalue %dx.types.CBufRet.f32 %99, 2
  %103 = extractvalue %dx.types.CBufRet.f32 %99, 3
  %104 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 18)  ; CBufferLoadLegacy(handle,regIndex)
  %105 = extractvalue %dx.types.CBufRet.f32 %104, 0
  %106 = extractvalue %dx.types.CBufRet.f32 %104, 1
  %107 = extractvalue %dx.types.CBufRet.f32 %104, 2
  %108 = extractvalue %dx.types.CBufRet.f32 %104, 3
  %109 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 19)  ; CBufferLoadLegacy(handle,regIndex)
  %110 = extractvalue %dx.types.CBufRet.f32 %109, 0
  %111 = extractvalue %dx.types.CBufRet.f32 %109, 1
  %112 = extractvalue %dx.types.CBufRet.f32 %109, 2
  %113 = extractvalue %dx.types.CBufRet.f32 %109, 3
  br i1 %34, label %233, label %114

; <label>:114                                     ; preds = %77
  %115 = extractvalue %dx.types.CBufRet.i32 %32, 1
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %121, label %117

; <label>:117                                     ; preds = %114
  %118 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %7, i32 0, i32 %12, i32 %13, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %119 = extractvalue %dx.types.ResRet.i32 %118, 0
  %120 = icmp eq i32 %119, 10
  br i1 %120, label %121, label %233

; <label>:121                                     ; preds = %117, %114
  %122 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 35)  ; CBufferLoadLegacy(handle,regIndex)
  %123 = extractvalue %dx.types.CBufRet.f32 %122, 2
  %124 = fadd fast float %31, 0x3EB0C6F7A0000000
  %125 = fdiv fast float %123, %124
  %126 = fcmp fast olt float %125, 1.000000e+00
  br i1 %126, label %127, label %233

; <label>:127                                     ; preds = %121
  %128 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 76)  ; CBufferLoadLegacy(handle,regIndex)
  %129 = extractvalue %dx.types.CBufRet.f32 %128, 0
  %130 = extractvalue %dx.types.CBufRet.f32 %128, 1
  %131 = extractvalue %dx.types.CBufRet.f32 %128, 2
  %132 = extractvalue %dx.types.CBufRet.f32 %128, 3
  %133 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 77)  ; CBufferLoadLegacy(handle,regIndex)
  %134 = extractvalue %dx.types.CBufRet.f32 %133, 0
  %135 = extractvalue %dx.types.CBufRet.f32 %133, 1
  %136 = extractvalue %dx.types.CBufRet.f32 %133, 2
  %137 = extractvalue %dx.types.CBufRet.f32 %133, 3
  %138 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 78)  ; CBufferLoadLegacy(handle,regIndex)
  %139 = extractvalue %dx.types.CBufRet.f32 %138, 0
  %140 = extractvalue %dx.types.CBufRet.f32 %138, 1
  %141 = extractvalue %dx.types.CBufRet.f32 %138, 2
  %142 = extractvalue %dx.types.CBufRet.f32 %138, 3
  %143 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 79)  ; CBufferLoadLegacy(handle,regIndex)
  %144 = extractvalue %dx.types.CBufRet.f32 %143, 3
  %145 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 7)  ; CBufferLoadLegacy(handle,regIndex)
  %146 = extractvalue %dx.types.CBufRet.f32 %145, 0
  %147 = extractvalue %dx.types.CBufRet.f32 %145, 1
  %148 = extractvalue %dx.types.CBufRet.f32 %145, 2
  %149 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 84)  ; CBufferLoadLegacy(handle,regIndex)
  %150 = extractvalue %dx.types.CBufRet.f32 %149, 0
  %151 = extractvalue %dx.types.CBufRet.f32 %149, 1
  %152 = extractvalue %dx.types.CBufRet.f32 %149, 2
  %153 = extractvalue %dx.types.CBufRet.f32 %149, 3
  %154 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 85)  ; CBufferLoadLegacy(handle,regIndex)
  %155 = extractvalue %dx.types.CBufRet.f32 %154, 0
  %156 = extractvalue %dx.types.CBufRet.f32 %154, 1
  %157 = extractvalue %dx.types.CBufRet.f32 %154, 2
  %158 = extractvalue %dx.types.CBufRet.f32 %154, 3
  %159 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 86)  ; CBufferLoadLegacy(handle,regIndex)
  %160 = extractvalue %dx.types.CBufRet.f32 %159, 0
  %161 = extractvalue %dx.types.CBufRet.f32 %159, 1
  %162 = extractvalue %dx.types.CBufRet.f32 %159, 2
  %163 = extractvalue %dx.types.CBufRet.f32 %159, 3
  %164 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 87)  ; CBufferLoadLegacy(handle,regIndex)
  %165 = extractvalue %dx.types.CBufRet.f32 %164, 0
  %166 = extractvalue %dx.types.CBufRet.f32 %164, 1
  %167 = extractvalue %dx.types.CBufRet.f32 %164, 2
  %168 = extractvalue %dx.types.CBufRet.f32 %164, 3
  %169 = fmul fast float %150, %129
  %170 = call float @dx.op.tertiary.f32(i32 46, float %134, float %151, float %169)  ; FMad(a,b,c)
  %171 = call float @dx.op.tertiary.f32(i32 46, float %139, float %152, float %170)  ; FMad(a,b,c)
  %172 = call float @dx.op.tertiary.f32(i32 46, float %146, float %153, float %171)  ; FMad(a,b,c)
  %173 = fmul fast float %155, %129
  %174 = call float @dx.op.tertiary.f32(i32 46, float %134, float %156, float %173)  ; FMad(a,b,c)
  %175 = call float @dx.op.tertiary.f32(i32 46, float %139, float %157, float %174)  ; FMad(a,b,c)
  %176 = call float @dx.op.tertiary.f32(i32 46, float %146, float %158, float %175)  ; FMad(a,b,c)
  %177 = fmul fast float %160, %129
  %178 = call float @dx.op.tertiary.f32(i32 46, float %134, float %161, float %177)  ; FMad(a,b,c)
  %179 = call float @dx.op.tertiary.f32(i32 46, float %139, float %162, float %178)  ; FMad(a,b,c)
  %180 = call float @dx.op.tertiary.f32(i32 46, float %146, float %163, float %179)  ; FMad(a,b,c)
  %181 = fmul fast float %165, %129
  %182 = call float @dx.op.tertiary.f32(i32 46, float %134, float %166, float %181)  ; FMad(a,b,c)
  %183 = call float @dx.op.tertiary.f32(i32 46, float %139, float %167, float %182)  ; FMad(a,b,c)
  %184 = call float @dx.op.tertiary.f32(i32 46, float %146, float %168, float %183)  ; FMad(a,b,c)
  %185 = fmul fast float %150, %130
  %186 = call float @dx.op.tertiary.f32(i32 46, float %135, float %151, float %185)  ; FMad(a,b,c)
  %187 = call float @dx.op.tertiary.f32(i32 46, float %140, float %152, float %186)  ; FMad(a,b,c)
  %188 = call float @dx.op.tertiary.f32(i32 46, float %147, float %153, float %187)  ; FMad(a,b,c)
  %189 = fmul fast float %155, %130
  %190 = call float @dx.op.tertiary.f32(i32 46, float %135, float %156, float %189)  ; FMad(a,b,c)
  %191 = call float @dx.op.tertiary.f32(i32 46, float %140, float %157, float %190)  ; FMad(a,b,c)
  %192 = call float @dx.op.tertiary.f32(i32 46, float %147, float %158, float %191)  ; FMad(a,b,c)
  %193 = fmul fast float %160, %130
  %194 = call float @dx.op.tertiary.f32(i32 46, float %135, float %161, float %193)  ; FMad(a,b,c)
  %195 = call float @dx.op.tertiary.f32(i32 46, float %140, float %162, float %194)  ; FMad(a,b,c)
  %196 = call float @dx.op.tertiary.f32(i32 46, float %147, float %163, float %195)  ; FMad(a,b,c)
  %197 = fmul fast float %165, %130
  %198 = call float @dx.op.tertiary.f32(i32 46, float %135, float %166, float %197)  ; FMad(a,b,c)
  %199 = call float @dx.op.tertiary.f32(i32 46, float %140, float %167, float %198)  ; FMad(a,b,c)
  %200 = call float @dx.op.tertiary.f32(i32 46, float %147, float %168, float %199)  ; FMad(a,b,c)
  %201 = fmul fast float %150, %131
  %202 = call float @dx.op.tertiary.f32(i32 46, float %136, float %151, float %201)  ; FMad(a,b,c)
  %203 = call float @dx.op.tertiary.f32(i32 46, float %141, float %152, float %202)  ; FMad(a,b,c)
  %204 = call float @dx.op.tertiary.f32(i32 46, float %148, float %153, float %203)  ; FMad(a,b,c)
  %205 = fmul fast float %155, %131
  %206 = call float @dx.op.tertiary.f32(i32 46, float %136, float %156, float %205)  ; FMad(a,b,c)
  %207 = call float @dx.op.tertiary.f32(i32 46, float %141, float %157, float %206)  ; FMad(a,b,c)
  %208 = call float @dx.op.tertiary.f32(i32 46, float %148, float %158, float %207)  ; FMad(a,b,c)
  %209 = fmul fast float %160, %131
  %210 = call float @dx.op.tertiary.f32(i32 46, float %136, float %161, float %209)  ; FMad(a,b,c)
  %211 = call float @dx.op.tertiary.f32(i32 46, float %141, float %162, float %210)  ; FMad(a,b,c)
  %212 = call float @dx.op.tertiary.f32(i32 46, float %148, float %163, float %211)  ; FMad(a,b,c)
  %213 = fmul fast float %165, %131
  %214 = call float @dx.op.tertiary.f32(i32 46, float %136, float %166, float %213)  ; FMad(a,b,c)
  %215 = call float @dx.op.tertiary.f32(i32 46, float %141, float %167, float %214)  ; FMad(a,b,c)
  %216 = call float @dx.op.tertiary.f32(i32 46, float %148, float %168, float %215)  ; FMad(a,b,c)
  %217 = fmul fast float %150, %132
  %218 = call float @dx.op.tertiary.f32(i32 46, float %137, float %151, float %217)  ; FMad(a,b,c)
  %219 = call float @dx.op.tertiary.f32(i32 46, float %142, float %152, float %218)  ; FMad(a,b,c)
  %220 = call float @dx.op.tertiary.f32(i32 46, float %144, float %153, float %219)  ; FMad(a,b,c)
  %221 = fmul fast float %155, %132
  %222 = call float @dx.op.tertiary.f32(i32 46, float %137, float %156, float %221)  ; FMad(a,b,c)
  %223 = call float @dx.op.tertiary.f32(i32 46, float %142, float %157, float %222)  ; FMad(a,b,c)
  %224 = call float @dx.op.tertiary.f32(i32 46, float %144, float %158, float %223)  ; FMad(a,b,c)
  %225 = fmul fast float %160, %132
  %226 = call float @dx.op.tertiary.f32(i32 46, float %137, float %161, float %225)  ; FMad(a,b,c)
  %227 = call float @dx.op.tertiary.f32(i32 46, float %142, float %162, float %226)  ; FMad(a,b,c)
  %228 = call float @dx.op.tertiary.f32(i32 46, float %144, float %163, float %227)  ; FMad(a,b,c)
  %229 = fmul fast float %165, %132
  %230 = call float @dx.op.tertiary.f32(i32 46, float %137, float %166, float %229)  ; FMad(a,b,c)
  %231 = call float @dx.op.tertiary.f32(i32 46, float %142, float %167, float %230)  ; FMad(a,b,c)
  %232 = call float @dx.op.tertiary.f32(i32 46, float %144, float %168, float %231)  ; FMad(a,b,c)
  br label %233

; <label>:233                                     ; preds = %127, %121, %117, %77
  %234 = phi float [ %172, %127 ], [ %78, %121 ], [ %78, %117 ], [ %78, %77 ]
  %235 = phi float [ %188, %127 ], [ %79, %121 ], [ %79, %117 ], [ %79, %77 ]
  %236 = phi float [ %204, %127 ], [ %80, %121 ], [ %80, %117 ], [ %80, %77 ]
  %237 = phi float [ %220, %127 ], [ %81, %121 ], [ %81, %117 ], [ %81, %77 ]
  %238 = phi float [ %176, %127 ], [ %82, %121 ], [ %82, %117 ], [ %82, %77 ]
  %239 = phi float [ %192, %127 ], [ %83, %121 ], [ %83, %117 ], [ %83, %77 ]
  %240 = phi float [ %208, %127 ], [ %84, %121 ], [ %84, %117 ], [ %84, %77 ]
  %241 = phi float [ %224, %127 ], [ %85, %121 ], [ %85, %117 ], [ %85, %77 ]
  %242 = phi float [ %180, %127 ], [ %86, %121 ], [ %86, %117 ], [ %86, %77 ]
  %243 = phi float [ %196, %127 ], [ %87, %121 ], [ %87, %117 ], [ %87, %77 ]
  %244 = phi float [ %212, %127 ], [ %88, %121 ], [ %88, %117 ], [ %88, %77 ]
  %245 = phi float [ %228, %127 ], [ %89, %121 ], [ %89, %117 ], [ %89, %77 ]
  %246 = phi float [ %184, %127 ], [ %90, %121 ], [ %90, %117 ], [ %90, %77 ]
  %247 = phi float [ %200, %127 ], [ %91, %121 ], [ %91, %117 ], [ %91, %77 ]
  %248 = phi float [ %216, %127 ], [ %92, %121 ], [ %92, %117 ], [ %92, %77 ]
  %249 = phi float [ %232, %127 ], [ %93, %121 ], [ %93, %117 ], [ %93, %77 ]
  %250 = fsub fast float 1.000000e+00, %29
  %251 = fmul fast float %28, 2.000000e+00
  %252 = fmul fast float %250, 2.000000e+00
  %253 = fadd fast float %251, -1.000000e+00
  %254 = fadd fast float %252, -1.000000e+00
  %255 = fmul fast float %234, %253
  %256 = call float @dx.op.tertiary.f32(i32 46, float %238, float %254, float %255)  ; FMad(a,b,c)
  %257 = call float @dx.op.tertiary.f32(i32 46, float %242, float %31, float %256)  ; FMad(a,b,c)
  %258 = fadd fast float %257, %246
  %259 = fmul fast float %235, %253
  %260 = call float @dx.op.tertiary.f32(i32 46, float %239, float %254, float %259)  ; FMad(a,b,c)
  %261 = call float @dx.op.tertiary.f32(i32 46, float %243, float %31, float %260)  ; FMad(a,b,c)
  %262 = fadd fast float %261, %247
  %263 = fmul fast float %236, %253
  %264 = call float @dx.op.tertiary.f32(i32 46, float %240, float %254, float %263)  ; FMad(a,b,c)
  %265 = call float @dx.op.tertiary.f32(i32 46, float %244, float %31, float %264)  ; FMad(a,b,c)
  %266 = fadd fast float %265, %248
  %267 = fmul fast float %237, %253
  %268 = call float @dx.op.tertiary.f32(i32 46, float %241, float %254, float %267)  ; FMad(a,b,c)
  %269 = call float @dx.op.tertiary.f32(i32 46, float %245, float %31, float %268)  ; FMad(a,b,c)
  %270 = fadd fast float %269, %249
  %271 = fmul fast float %258, %95
  %272 = call float @dx.op.tertiary.f32(i32 46, float %100, float %262, float %271)  ; FMad(a,b,c)
  %273 = call float @dx.op.tertiary.f32(i32 46, float %105, float %266, float %272)  ; FMad(a,b,c)
  %274 = call float @dx.op.tertiary.f32(i32 46, float %110, float %270, float %273)  ; FMad(a,b,c)
  %275 = fmul fast float %258, %96
  %276 = call float @dx.op.tertiary.f32(i32 46, float %101, float %262, float %275)  ; FMad(a,b,c)
  %277 = call float @dx.op.tertiary.f32(i32 46, float %106, float %266, float %276)  ; FMad(a,b,c)
  %278 = call float @dx.op.tertiary.f32(i32 46, float %111, float %270, float %277)  ; FMad(a,b,c)
  %279 = fmul fast float %258, %98
  %280 = call float @dx.op.tertiary.f32(i32 46, float %103, float %262, float %279)  ; FMad(a,b,c)
  %281 = call float @dx.op.tertiary.f32(i32 46, float %108, float %266, float %280)  ; FMad(a,b,c)
  %282 = call float @dx.op.tertiary.f32(i32 46, float %113, float %270, float %281)  ; FMad(a,b,c)
  %283 = fdiv fast float %274, %282
  %284 = fdiv fast float %278, %282
  %285 = fadd fast float %283, 1.000000e+00
  %286 = fadd fast float %284, 1.000000e+00
  %287 = fmul fast float %285, 5.000000e-01
  %288 = fmul fast float %286, 5.000000e-01
  %289 = fsub fast float 1.000000e+00, %288
  %290 = fcmp fast olt float %287, 0.000000e+00
  %291 = fcmp fast olt float %289, 0.000000e+00
  %292 = or i1 %290, %291
  %293 = fcmp fast oge float %287, 1.000000e+00
  %294 = or i1 %293, %292
  %295 = fcmp fast oge float %289, 1.000000e+00
  %296 = or i1 %295, %294
  br i1 %296, label %464, label %297

; <label>:297                                     ; preds = %233
  %298 = fmul fast float %258, %97
  %299 = call float @dx.op.tertiary.f32(i32 46, float %102, float %262, float %298)  ; FMad(a,b,c)
  %300 = call float @dx.op.tertiary.f32(i32 46, float %107, float %266, float %299)  ; FMad(a,b,c)
  %301 = call float @dx.op.tertiary.f32(i32 46, float %112, float %270, float %300)  ; FMad(a,b,c)
  %302 = fdiv fast float %301, %282
  %303 = call float @dx.op.binary.f32(i32 35, float %302, float 0.000000e+00)  ; FMax(a,b)
  %304 = extractvalue %dx.types.CBufRet.f32 %25, 0
  %305 = fmul fast float %287, %304
  %306 = fadd fast float %305, -5.000000e-01
  %307 = call float @dx.op.unary.f32(i32 26, float %306)  ; Round_ne(value)
  %308 = fptoui float %307 to i32
  %309 = extractvalue %dx.types.CBufRet.f32 %25, 1
  %310 = fmul fast float %289, %309
  %311 = fadd fast float %310, -5.000000e-01
  %312 = call float @dx.op.unary.f32(i32 26, float %311)  ; Round_ne(value)
  %313 = fptoui float %312 to i32
  %314 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %3, i32 undef, i32 %308, i32 %313, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %315 = extractvalue %dx.types.ResRet.i32 %314, 0
  %316 = bitcast float %303 to i32
  %317 = icmp eq i32 %315, %316
  br i1 %317, label %318, label %464

; <label>:318                                     ; preds = %297
  %319 = extractvalue %dx.types.CBufRet.i32 %32, 0
  %320 = icmp eq i32 %319, 0
  br i1 %320, label %450, label %321

; <label>:321                                     ; preds = %318
  %322 = call %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32 66, %dx.types.Handle %1, i32 undef, i32 %12, i32 %13, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %323 = extractvalue %dx.types.ResRet.i32 %322, 0
  %324 = icmp eq i32 %323, 10
  br i1 %324, label %325, label %450, !dx.controlflow.hints !25

; <label>:325                                     ; preds = %321
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %2, i32 %308, i32 %313, i32 undef, i32 10, i32 10, i32 10, i32 10, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  %326 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %6, %dx.types.Handle %10, float %28, float %29, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %327 = extractvalue %dx.types.ResRet.f32 %326, 0
  %328 = extractvalue %dx.types.ResRet.f32 %326, 1
  %329 = extractvalue %dx.types.ResRet.f32 %326, 2
  %330 = extractvalue %dx.types.ResRet.f32 %326, 3
  %331 = fmul fast float %327, 0x4010083560000000
  %332 = fmul fast float %328, 0x4010083560000000
  %333 = fadd fast float %331, 0xC000082560000000
  %334 = fadd fast float %332, 0xC000082560000000
  %335 = fmul fast float %329, 6.553500e+04
  %336 = call float @dx.op.unary.f32(i32 26, float %335)  ; Round_ne(value)
  %337 = fptoui float %336 to i32
  %338 = shl i32 %337, 16
  %339 = fmul fast float %330, 6.553500e+04
  %340 = call float @dx.op.unary.f32(i32 26, float %339)  ; Round_ne(value)
  %341 = fptoui float %340 to i32
  %342 = and i32 %341, 65534
  %343 = or i32 %342, %338
  %344 = bitcast i32 %343 to float
  %345 = call float @dx.op.unary.f32(i32 6, float %333)  ; FAbs(value)
  %346 = call float @dx.op.unary.f32(i32 6, float %334)  ; FAbs(value)
  %347 = fmul fast float %345, 2.500000e-01
  %348 = fmul fast float %347, %333
  %349 = fmul fast float %328, 0x3FF0083560000000
  %350 = fadd fast float %349, 0xBFE0082560000000
  %351 = fmul fast float %346, %350
  %352 = fsub fast float %28, %348
  %353 = fsub fast float %31, %344
  %354 = fmul fast float %352, 2.000000e+00
  %355 = fadd fast float %354, -1.000000e+00
  %356 = fsub fast float %250, %351
  %357 = fmul fast float %356, 2.000000e+00
  %358 = fadd fast float %357, -1.000000e+00
  %359 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 68)  ; CBufferLoadLegacy(handle,regIndex)
  %360 = extractvalue %dx.types.CBufRet.f32 %359, 0
  %361 = extractvalue %dx.types.CBufRet.f32 %359, 1
  %362 = extractvalue %dx.types.CBufRet.f32 %359, 2
  %363 = extractvalue %dx.types.CBufRet.f32 %359, 3
  %364 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 69)  ; CBufferLoadLegacy(handle,regIndex)
  %365 = extractvalue %dx.types.CBufRet.f32 %364, 0
  %366 = extractvalue %dx.types.CBufRet.f32 %364, 1
  %367 = extractvalue %dx.types.CBufRet.f32 %364, 2
  %368 = extractvalue %dx.types.CBufRet.f32 %364, 3
  %369 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 70)  ; CBufferLoadLegacy(handle,regIndex)
  %370 = extractvalue %dx.types.CBufRet.f32 %369, 0
  %371 = extractvalue %dx.types.CBufRet.f32 %369, 1
  %372 = extractvalue %dx.types.CBufRet.f32 %369, 2
  %373 = extractvalue %dx.types.CBufRet.f32 %369, 3
  %374 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 71)  ; CBufferLoadLegacy(handle,regIndex)
  %375 = extractvalue %dx.types.CBufRet.f32 %374, 0
  %376 = extractvalue %dx.types.CBufRet.f32 %374, 1
  %377 = extractvalue %dx.types.CBufRet.f32 %374, 2
  %378 = extractvalue %dx.types.CBufRet.f32 %374, 3
  %379 = fmul fast float %355, %360
  %380 = call float @dx.op.tertiary.f32(i32 46, float %365, float %358, float %379)  ; FMad(a,b,c)
  %381 = call float @dx.op.tertiary.f32(i32 46, float %370, float %353, float %380)  ; FMad(a,b,c)
  %382 = fadd fast float %381, %375
  %383 = fmul fast float %355, %361
  %384 = call float @dx.op.tertiary.f32(i32 46, float %366, float %358, float %383)  ; FMad(a,b,c)
  %385 = call float @dx.op.tertiary.f32(i32 46, float %371, float %353, float %384)  ; FMad(a,b,c)
  %386 = fadd fast float %385, %376
  %387 = fmul fast float %355, %362
  %388 = call float @dx.op.tertiary.f32(i32 46, float %367, float %358, float %387)  ; FMad(a,b,c)
  %389 = call float @dx.op.tertiary.f32(i32 46, float %372, float %353, float %388)  ; FMad(a,b,c)
  %390 = fadd fast float %389, %377
  %391 = fmul fast float %355, %363
  %392 = call float @dx.op.tertiary.f32(i32 46, float %368, float %358, float %391)  ; FMad(a,b,c)
  %393 = call float @dx.op.tertiary.f32(i32 46, float %373, float %353, float %392)  ; FMad(a,b,c)
  %394 = fadd fast float %393, %378
  %395 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 88)  ; CBufferLoadLegacy(handle,regIndex)
  %396 = extractvalue %dx.types.CBufRet.f32 %395, 0
  %397 = extractvalue %dx.types.CBufRet.f32 %395, 1
  %398 = extractvalue %dx.types.CBufRet.f32 %395, 3
  %399 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 89)  ; CBufferLoadLegacy(handle,regIndex)
  %400 = extractvalue %dx.types.CBufRet.f32 %399, 0
  %401 = extractvalue %dx.types.CBufRet.f32 %399, 1
  %402 = extractvalue %dx.types.CBufRet.f32 %399, 3
  %403 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 90)  ; CBufferLoadLegacy(handle,regIndex)
  %404 = extractvalue %dx.types.CBufRet.f32 %403, 0
  %405 = extractvalue %dx.types.CBufRet.f32 %403, 1
  %406 = extractvalue %dx.types.CBufRet.f32 %403, 3
  %407 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 91)  ; CBufferLoadLegacy(handle,regIndex)
  %408 = extractvalue %dx.types.CBufRet.f32 %407, 0
  %409 = extractvalue %dx.types.CBufRet.f32 %407, 1
  %410 = extractvalue %dx.types.CBufRet.f32 %407, 3
  %411 = fmul fast float %396, %382
  %412 = call float @dx.op.tertiary.f32(i32 46, float %400, float %386, float %411)  ; FMad(a,b,c)
  %413 = call float @dx.op.tertiary.f32(i32 46, float %404, float %390, float %412)  ; FMad(a,b,c)
  %414 = call float @dx.op.tertiary.f32(i32 46, float %408, float %394, float %413)  ; FMad(a,b,c)
  %415 = fmul fast float %397, %382
  %416 = call float @dx.op.tertiary.f32(i32 46, float %401, float %386, float %415)  ; FMad(a,b,c)
  %417 = call float @dx.op.tertiary.f32(i32 46, float %405, float %390, float %416)  ; FMad(a,b,c)
  %418 = call float @dx.op.tertiary.f32(i32 46, float %409, float %394, float %417)  ; FMad(a,b,c)
  %419 = fmul fast float %398, %382
  %420 = call float @dx.op.tertiary.f32(i32 46, float %402, float %386, float %419)  ; FMad(a,b,c)
  %421 = call float @dx.op.tertiary.f32(i32 46, float %406, float %390, float %420)  ; FMad(a,b,c)
  %422 = call float @dx.op.tertiary.f32(i32 46, float %410, float %394, float %421)  ; FMad(a,b,c)
  %423 = fdiv fast float %414, %422
  %424 = fdiv fast float %418, %422
  %425 = fadd fast float %423, 1.000000e+00
  %426 = fmul fast float %425, 5.000000e-01
  %427 = fadd fast float %424, 1.000000e+00
  %428 = fmul fast float %427, 5.000000e-01
  %429 = fsub fast float 1.000000e+00, %428
  %430 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %11, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %431 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %11, i32 152)  ; CBufferLoadLegacy(handle,regIndex)
  %432 = extractvalue %dx.types.CBufRet.i32 %431, 0
  %433 = icmp ugt i32 %432, 9
  br i1 %433, label %434, label %438, !dx.controlflow.hints !26

; <label>:434                                     ; preds = %325
  %435 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %4, i32 undef, i32 %308, i32 %313, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %436 = extractvalue %dx.types.ResRet.f32 %435, 2
  %437 = extractvalue %dx.types.ResRet.f32 %435, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %308, i32 %313, i32 undef, float %426, float %429, float %436, float %437, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %464

; <label>:438                                     ; preds = %325
  %439 = extractvalue %dx.types.CBufRet.f32 %430, 1
  %440 = fmul fast float %429, %439
  %441 = extractvalue %dx.types.CBufRet.f32 %430, 0
  %442 = fmul fast float %441, %426
  %443 = fptoui float %442 to i32
  %444 = fptoui float %440 to i32
  %445 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %5, i32 0, i32 %443, i32 %444, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %446 = extractvalue %dx.types.ResRet.f32 %445, 0
  %447 = extractvalue %dx.types.ResRet.f32 %445, 1
  %448 = extractvalue %dx.types.ResRet.f32 %445, 2
  %449 = extractvalue %dx.types.ResRet.f32 %445, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %308, i32 %313, i32 undef, float %446, float %447, float %448, float %449, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %464

; <label>:450                                     ; preds = %321, %318
  %451 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %11, i32 152)  ; CBufferLoadLegacy(handle,regIndex)
  %452 = extractvalue %dx.types.CBufRet.i32 %451, 0
  %453 = icmp ugt i32 %452, 9
  br i1 %453, label %454, label %458, !dx.controlflow.hints !27

; <label>:454                                     ; preds = %450
  %455 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %4, i32 undef, i32 %308, i32 %313, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %456 = extractvalue %dx.types.ResRet.f32 %455, 2
  %457 = extractvalue %dx.types.ResRet.f32 %455, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %308, i32 %313, i32 undef, float %28, float %29, float %456, float %457, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %464

; <label>:458                                     ; preds = %450
  %459 = call %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32 66, %dx.types.Handle %9, i32 0, i32 %12, i32 %13, i32 undef, i32 undef, i32 undef, i32 undef)  ; TextureLoad(srv,mipLevelOrSampleCount,coord0,coord1,coord2,offset0,offset1,offset2)
  %460 = extractvalue %dx.types.ResRet.f32 %459, 0
  %461 = extractvalue %dx.types.ResRet.f32 %459, 1
  %462 = extractvalue %dx.types.ResRet.f32 %459, 2
  %463 = extractvalue %dx.types.ResRet.f32 %459, 3
  call void @dx.op.textureStore.f32(i32 67, %dx.types.Handle %4, i32 %308, i32 %313, i32 undef, float %460, float %461, float %462, float %463, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %464

; <label>:464                                     ; preds = %458, %454, %438, %434, %297, %233, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @dx.op.threadId.i32(i32, i32) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32, %dx.types.Handle, %dx.types.Handle, float, float, float, float, i32, i32, i32, float) #1

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.i32 @dx.op.textureLoad.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32, i8) #2

; Function Attrs: nounwind readnone
declare float @dx.op.binary.f32(i32, float, float) #0

; Function Attrs: nounwind readnone
declare float @dx.op.unary.f32(i32, float) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.textureLoad.f32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32) #1

; Function Attrs: nounwind
declare void @dx.op.textureStore.f32(i32, %dx.types.Handle, i32, i32, i32, float, float, float, float, i8) #2

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

!llvm.ident = !{!0}
!dx.version = !{!1}
!dx.valver = !{!2}
!dx.shaderModel = !{!3}
!dx.resources = !{!4}
!dx.entryPoints = !{!22}

!0 = !{!"dxcoob 1.8.2502.11 (239921522)"}
!1 = !{i32 1, i32 1}
!2 = !{i32 1, i32 8}
!3 = !{!"cs", i32 6, i32 1}
!4 = !{!5, !13, !18, !20}
!5 = !{!6, !8, !9, !11, !12}
!6 = !{i32 0, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i32 0, !7}
!7 = !{i32 0, i32 9}
!8 = !{i32 1, %"class.Texture2D<float>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i32 0, !7}
!9 = !{i32 2, %"class.Texture2D<unsigned int>"* undef, !"", i32 0, i32 3, i32 1, i32 2, i32 0, !10}
!10 = !{i32 0, i32 5}
!11 = !{i32 3, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 1, i32 0, i32 1, i32 2, i32 0, !7}
!12 = !{i32 4, %"class.Texture2D<vector<float, 4> >"* undef, !"", i32 2, i32 0, i32 1, i32 2, i32 0, !7}
!13 = !{!14, !15, !16, !17}
!14 = !{i32 0, %"class.RWTexture2D<vector<float, 4> >"* undef, !"", i32 0, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !7}
!15 = !{i32 1, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!16 = !{i32 2, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 1, i32 2, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!17 = !{i32 3, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 2, i32 0, i32 1, i32 2, i1 false, i1 false, i1 false, !10}
!18 = !{!19}
!19 = !{i32 0, %hostlayout.matrices* undef, !"", i32 0, i32 0, i32 1, i32 2440, null}
!20 = !{!21}
!21 = !{i32 0, %struct.SamplerState* undef, !"", i32 1, i32 0, i32 1, i32 0, null}
!22 = !{void ()* @main, !"main", null, !4, !23}
!23 = !{i32 0, i64 8192, i32 4, !24}
!24 = !{i32 16, i32 16, i32 1}
!25 = distinct !{!25, !"dx.controlflow.hints", i32 1}
!26 = distinct !{!26, !"dx.controlflow.hints", i32 1}
!27 = distinct !{!27, !"dx.controlflow.hints", i32 1}
