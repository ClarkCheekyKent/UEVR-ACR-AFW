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
; shader hash: 3fc6ce66c3a1f330f1c6417ef780f49d
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
; linearSampler                     sampler      NA          NA      S0      s1,space1     1
; _SrcDepthTex                      texture     f32          2d      T0             t1     1
; _SrcMotionVectorsTex              texture     f32          2d      T1             t2     1
; _DestEyeMaskTex                       UAV     u32          2d      U0             u3     1
;
target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.Handle = type { i8* }
%dx.types.CBufRet.f32 = type { float, float, float, float }
%dx.types.ResRet.f32 = type { float, float, float, float, i32 }
%dx.types.CBufRet.i32 = type { i32, i32, i32, i32 }
%"class.Texture2D<float>" = type { float, %"class.Texture2D<float>::mips_type" }
%"class.Texture2D<float>::mips_type" = type { i32 }
%"class.Texture2D<vector<float, 2> >" = type { <2 x float>, %"class.Texture2D<vector<float, 2> >::mips_type" }
%"class.Texture2D<vector<float, 2> >::mips_type" = type { i32 }
%"class.RWTexture2D<unsigned int>" = type { i32 }
%hostlayout.matrices = type { [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], [4 x <4 x float>], <4 x float>, <2 x float>, <4 x float>, <4 x float>, <4 x float>, float, float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.SamplerState = type { i32 }

define void @main() {
  %1 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 1, i32 0, i32 3, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %2 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 1, i32 2, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %3 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 0, i32 0, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %4 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 3, i32 0, i32 1, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %5 = call %dx.types.Handle @dx.op.createHandle(i32 57, i8 2, i32 0, i32 0, i1 false)  ; CreateHandle(resourceClass,rangeId,index,nonUniformIndex)
  %6 = call i32 @dx.op.threadId.i32(i32 93, i32 0)  ; ThreadId(component)
  %7 = call i32 @dx.op.threadId.i32(i32 93, i32 1)  ; ThreadId(component)
  %8 = uitofp i32 %6 to float
  %9 = uitofp i32 %7 to float
  %10 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %11 = extractvalue %dx.types.CBufRet.f32 %10, 0
  %12 = extractvalue %dx.types.CBufRet.f32 %10, 1
  %13 = fcmp fast oge float %8, %11
  %14 = fcmp fast oge float %9, %12
  %15 = or i1 %13, %14
  br i1 %15, label %185, label %16

; <label>:16                                      ; preds = %0
  %17 = fadd fast float %8, 5.000000e-01
  %18 = fadd fast float %9, 5.000000e-01
  %19 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 147)  ; CBufferLoadLegacy(handle,regIndex)
  %20 = extractvalue %dx.types.CBufRet.f32 %19, 2
  %21 = extractvalue %dx.types.CBufRet.f32 %19, 3
  %22 = fmul fast float %20, %17
  %23 = fmul fast float %21, %18
  %24 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %2, %dx.types.Handle %4, float %22, float %23, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %25 = extractvalue %dx.types.ResRet.f32 %24, 0
  %26 = extractvalue %dx.types.ResRet.f32 %24, 1
  %27 = call %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32 62, %dx.types.Handle %3, %dx.types.Handle %4, float %22, float %23, float undef, float undef, i32 0, i32 0, i32 undef, float 0.000000e+00)  ; SampleLevel(srv,sampler,coord0,coord1,coord2,coord3,offset0,offset1,offset2,LOD)
  %28 = extractvalue %dx.types.ResRet.f32 %27, 0
  %29 = fmul fast float %22, 2.000000e+00
  %30 = fadd fast float %29, -1.000000e+00
  %31 = fsub fast float 1.000000e+00, %23
  %32 = fmul fast float %31, 2.000000e+00
  %33 = fadd fast float %32, -1.000000e+00
  %34 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 44)  ; CBufferLoadLegacy(handle,regIndex)
  %35 = extractvalue %dx.types.CBufRet.f32 %34, 0
  %36 = extractvalue %dx.types.CBufRet.f32 %34, 1
  %37 = extractvalue %dx.types.CBufRet.f32 %34, 2
  %38 = extractvalue %dx.types.CBufRet.f32 %34, 3
  %39 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 45)  ; CBufferLoadLegacy(handle,regIndex)
  %40 = extractvalue %dx.types.CBufRet.f32 %39, 0
  %41 = extractvalue %dx.types.CBufRet.f32 %39, 1
  %42 = extractvalue %dx.types.CBufRet.f32 %39, 2
  %43 = extractvalue %dx.types.CBufRet.f32 %39, 3
  %44 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 46)  ; CBufferLoadLegacy(handle,regIndex)
  %45 = extractvalue %dx.types.CBufRet.f32 %44, 0
  %46 = extractvalue %dx.types.CBufRet.f32 %44, 1
  %47 = extractvalue %dx.types.CBufRet.f32 %44, 2
  %48 = extractvalue %dx.types.CBufRet.f32 %44, 3
  %49 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 47)  ; CBufferLoadLegacy(handle,regIndex)
  %50 = extractvalue %dx.types.CBufRet.f32 %49, 0
  %51 = extractvalue %dx.types.CBufRet.f32 %49, 1
  %52 = extractvalue %dx.types.CBufRet.f32 %49, 2
  %53 = extractvalue %dx.types.CBufRet.f32 %49, 3
  %54 = fmul fast float %35, %30
  %55 = call float @dx.op.tertiary.f32(i32 46, float %40, float %33, float %54)  ; FMad(a,b,c)
  %56 = call float @dx.op.tertiary.f32(i32 46, float %45, float %28, float %55)  ; FMad(a,b,c)
  %57 = fadd fast float %56, %50
  %58 = fmul fast float %36, %30
  %59 = call float @dx.op.tertiary.f32(i32 46, float %41, float %33, float %58)  ; FMad(a,b,c)
  %60 = call float @dx.op.tertiary.f32(i32 46, float %46, float %28, float %59)  ; FMad(a,b,c)
  %61 = fadd fast float %60, %51
  %62 = fmul fast float %37, %30
  %63 = call float @dx.op.tertiary.f32(i32 46, float %42, float %33, float %62)  ; FMad(a,b,c)
  %64 = call float @dx.op.tertiary.f32(i32 46, float %47, float %28, float %63)  ; FMad(a,b,c)
  %65 = fadd fast float %64, %52
  %66 = fmul fast float %38, %30
  %67 = call float @dx.op.tertiary.f32(i32 46, float %43, float %33, float %66)  ; FMad(a,b,c)
  %68 = call float @dx.op.tertiary.f32(i32 46, float %48, float %28, float %67)  ; FMad(a,b,c)
  %69 = fadd fast float %68, %53
  %70 = call %dx.types.CBufRet.i32 @dx.op.cbufferLoadLegacy.i32(i32 59, %dx.types.Handle %5, i32 150)  ; CBufferLoadLegacy(handle,regIndex)
  %71 = extractvalue %dx.types.CBufRet.i32 %70, 3
  %72 = icmp eq i32 %71, 2
  br i1 %72, label %149, label %73, !dx.controlflow.hints !19

; <label>:73                                      ; preds = %16
  %74 = icmp eq i32 %71, 1
  br i1 %74, label %75, label %92

; <label>:75                                      ; preds = %73
  %76 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 88)  ; CBufferLoadLegacy(handle,regIndex)
  %77 = extractvalue %dx.types.CBufRet.f32 %76, 0
  %78 = extractvalue %dx.types.CBufRet.f32 %76, 1
  %79 = extractvalue %dx.types.CBufRet.f32 %76, 3
  %80 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 89)  ; CBufferLoadLegacy(handle,regIndex)
  %81 = extractvalue %dx.types.CBufRet.f32 %80, 0
  %82 = extractvalue %dx.types.CBufRet.f32 %80, 1
  %83 = extractvalue %dx.types.CBufRet.f32 %80, 3
  %84 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 90)  ; CBufferLoadLegacy(handle,regIndex)
  %85 = extractvalue %dx.types.CBufRet.f32 %84, 0
  %86 = extractvalue %dx.types.CBufRet.f32 %84, 1
  %87 = extractvalue %dx.types.CBufRet.f32 %84, 3
  %88 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 91)  ; CBufferLoadLegacy(handle,regIndex)
  %89 = extractvalue %dx.types.CBufRet.f32 %88, 0
  %90 = extractvalue %dx.types.CBufRet.f32 %88, 1
  %91 = extractvalue %dx.types.CBufRet.f32 %88, 3
  br label %109

; <label>:92                                      ; preds = %73
  %93 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 64)  ; CBufferLoadLegacy(handle,regIndex)
  %94 = extractvalue %dx.types.CBufRet.f32 %93, 0
  %95 = extractvalue %dx.types.CBufRet.f32 %93, 1
  %96 = extractvalue %dx.types.CBufRet.f32 %93, 3
  %97 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 65)  ; CBufferLoadLegacy(handle,regIndex)
  %98 = extractvalue %dx.types.CBufRet.f32 %97, 0
  %99 = extractvalue %dx.types.CBufRet.f32 %97, 1
  %100 = extractvalue %dx.types.CBufRet.f32 %97, 3
  %101 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 66)  ; CBufferLoadLegacy(handle,regIndex)
  %102 = extractvalue %dx.types.CBufRet.f32 %101, 0
  %103 = extractvalue %dx.types.CBufRet.f32 %101, 1
  %104 = extractvalue %dx.types.CBufRet.f32 %101, 3
  %105 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 67)  ; CBufferLoadLegacy(handle,regIndex)
  %106 = extractvalue %dx.types.CBufRet.f32 %105, 0
  %107 = extractvalue %dx.types.CBufRet.f32 %105, 1
  %108 = extractvalue %dx.types.CBufRet.f32 %105, 3
  br label %109

; <label>:109                                     ; preds = %92, %75
  %110 = phi float [ %77, %75 ], [ %94, %92 ]
  %111 = phi float [ %78, %75 ], [ %95, %92 ]
  %112 = phi float [ %79, %75 ], [ %96, %92 ]
  %113 = phi float [ %81, %75 ], [ %98, %92 ]
  %114 = phi float [ %82, %75 ], [ %99, %92 ]
  %115 = phi float [ %83, %75 ], [ %100, %92 ]
  %116 = phi float [ %85, %75 ], [ %102, %92 ]
  %117 = phi float [ %86, %75 ], [ %103, %92 ]
  %118 = phi float [ %87, %75 ], [ %104, %92 ]
  %119 = phi float [ %89, %75 ], [ %106, %92 ]
  %120 = phi float [ %90, %75 ], [ %107, %92 ]
  %121 = phi float [ %91, %75 ], [ %108, %92 ]
  %122 = fmul fast float %110, %57
  %123 = call float @dx.op.tertiary.f32(i32 46, float %113, float %61, float %122)  ; FMad(a,b,c)
  %124 = call float @dx.op.tertiary.f32(i32 46, float %116, float %65, float %123)  ; FMad(a,b,c)
  %125 = call float @dx.op.tertiary.f32(i32 46, float %119, float %69, float %124)  ; FMad(a,b,c)
  %126 = fmul fast float %111, %57
  %127 = call float @dx.op.tertiary.f32(i32 46, float %114, float %61, float %126)  ; FMad(a,b,c)
  %128 = call float @dx.op.tertiary.f32(i32 46, float %117, float %65, float %127)  ; FMad(a,b,c)
  %129 = call float @dx.op.tertiary.f32(i32 46, float %120, float %69, float %128)  ; FMad(a,b,c)
  %130 = fmul fast float %112, %57
  %131 = call float @dx.op.tertiary.f32(i32 46, float %115, float %61, float %130)  ; FMad(a,b,c)
  %132 = call float @dx.op.tertiary.f32(i32 46, float %118, float %65, float %131)  ; FMad(a,b,c)
  %133 = call float @dx.op.tertiary.f32(i32 46, float %121, float %69, float %132)  ; FMad(a,b,c)
  %134 = fdiv fast float %125, %133
  %135 = fdiv fast float %129, %133
  %136 = fsub fast float %134, %30
  %137 = fsub fast float %135, %33
  %138 = fmul fast float %136, 5.000000e-01
  %139 = fmul fast float %137, 5.000000e-01
  %140 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 146)  ; CBufferLoadLegacy(handle,regIndex)
  %141 = extractvalue %dx.types.CBufRet.f32 %140, 0
  %142 = extractvalue %dx.types.CBufRet.f32 %140, 1
  %143 = fmul fast float %25, %20
  %144 = fmul fast float %143, %141
  %145 = fmul fast float %26, %21
  %146 = fmul fast float %145, %142
  %147 = fsub fast float %144, %138
  %148 = fadd fast float %146, %139
  br label %149

; <label>:149                                     ; preds = %109, %16
  %150 = phi float [ %147, %109 ], [ %25, %16 ]
  %151 = phi float [ %148, %109 ], [ %26, %16 ]
  %152 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 35)  ; CBufferLoadLegacy(handle,regIndex)
  %153 = extractvalue %dx.types.CBufRet.f32 %152, 2
  %154 = fadd fast float %28, 0x3EB0C6F7A0000000
  %155 = fdiv fast float %153, %154
  %156 = call %dx.types.CBufRet.f32 @dx.op.cbufferLoadLegacy.f32(i32 59, %dx.types.Handle %5, i32 149)  ; CBufferLoadLegacy(handle,regIndex)
  %157 = extractvalue %dx.types.CBufRet.f32 %156, 1
  %158 = fcmp fast olt float %155, 5.000000e-01
  %159 = fcmp fast olt float %157, 1.000000e+01
  %160 = and i1 %158, %159
  br i1 %160, label %161, label %167

; <label>:161                                     ; preds = %149
  %162 = fsub fast float 1.000000e+01, %157
  %163 = fmul fast float %155, %155
  %164 = fmul fast float %163, 4.000000e+00
  %165 = fmul fast float %164, %162
  %166 = fsub fast float 1.000000e+01, %165
  br label %167

; <label>:167                                     ; preds = %161, %149
  %168 = phi float [ %166, %161 ], [ %157, %149 ]
  %169 = call float @dx.op.unary.f32(i32 6, float %150)  ; FAbs(value)
  %170 = call float @dx.op.unary.f32(i32 6, float %151)  ; FAbs(value)
  %171 = fmul fast float %168, 0x3F3E573AC0000000
  %172 = fcmp fast olt float %169, %171
  %173 = fcmp fast olt float %170, %171
  %174 = select i1 %172, float 0.000000e+00, float 1.000000e+00
  %175 = select i1 %173, float 0.000000e+00, float 1.000000e+00
  %176 = fmul fast float %174, %150
  %177 = fmul fast float %175, %151
  %178 = call float @dx.op.unary.f32(i32 6, float %176)  ; FAbs(value)
  %179 = call float @dx.op.unary.f32(i32 6, float %177)  ; FAbs(value)
  %180 = fcmp fast ogt float %178, 0.000000e+00
  %181 = fcmp fast ogt float %179, 0.000000e+00
  %182 = or i1 %180, %181
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %167
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %1, i32 %6, i32 %7, i32 undef, i32 10, i32 10, i32 10, i32 10, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %185

; <label>:184                                     ; preds = %167
  call void @dx.op.textureStore.i32(i32 67, %dx.types.Handle %1, i32 %6, i32 %7, i32 undef, i32 1, i32 1, i32 1, i32 1, i8 15)  ; TextureStore(srv,coord0,coord1,coord2,value0,value1,value2,value3,mask)
  br label %185

; <label>:185                                     ; preds = %184, %183, %0
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @dx.op.threadId.i32(i32, i32) #0

; Function Attrs: nounwind readonly
declare %dx.types.ResRet.f32 @dx.op.sampleLevel.f32(i32, %dx.types.Handle, %dx.types.Handle, float, float, float, float, i32, i32, i32, float) #1

; Function Attrs: nounwind readnone
declare float @dx.op.unary.f32(i32, float) #0

; Function Attrs: nounwind
declare void @dx.op.textureStore.i32(i32, %dx.types.Handle, i32, i32, i32, i32, i32, i32, i32, i8) #2

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
!dx.entryPoints = !{!16}

!0 = !{!"dxcoob 1.8.2502.11 (239921522)"}
!1 = !{i32 1, i32 1}
!2 = !{i32 1, i32 8}
!3 = !{!"cs", i32 6, i32 1}
!4 = !{!5, !9, !12, !14}
!5 = !{!6, !8}
!6 = !{i32 0, %"class.Texture2D<float>"* undef, !"", i32 0, i32 1, i32 1, i32 2, i32 0, !7}
!7 = !{i32 0, i32 9}
!8 = !{i32 1, %"class.Texture2D<vector<float, 2> >"* undef, !"", i32 0, i32 2, i32 1, i32 2, i32 0, !7}
!9 = !{!10}
!10 = !{i32 0, %"class.RWTexture2D<unsigned int>"* undef, !"", i32 0, i32 3, i32 1, i32 2, i1 false, i1 false, i1 false, !11}
!11 = !{i32 0, i32 5}
!12 = !{!13}
!13 = !{i32 0, %hostlayout.matrices* undef, !"", i32 0, i32 0, i32 1, i32 2440, null}
!14 = !{!15}
!15 = !{i32 0, %struct.SamplerState* undef, !"", i32 1, i32 1, i32 1, i32 0, null}
!16 = !{void ()* @main, !"main", null, !4, !17}
!17 = !{i32 4, !18}
!18 = !{i32 16, i32 16, i32 1}
!19 = distinct !{!19, !"dx.controlflow.hints", i32 1}
