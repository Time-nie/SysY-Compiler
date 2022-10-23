; ModuleID = 'main.bc'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@start = common local_unnamed_addr global i64 0, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stop = common local_unnamed_addr global i64 0, align 8
@.str.3 = private unnamed_addr constant [25 x i8] c"\E7\A8\8B\E5\BA\8F\E8\BF\90\E8\A1\8C\E6\97\B6\E9\97\B4\E4\B8\BA\EF\BC\9A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@str = private unnamed_addr constant [8 x i8] c"success\00"

; Function Attrs: noinline nounwind uwtable
define i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = tail call i64 @clock() #2
  store i64 %2, i64* @start, align 8
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %1)
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 100000
  br i1 %5, label %6, label %.loopexit

; <label>:6:                                      ; preds = %0
  %puts = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str, i64 0, i64 0))
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 0)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 1)
  %9 = load i32, i32* %1, align 4
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.013 = phi i32 [ %.01011, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.0912 = phi i32 [ %13, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %.01011 = phi i32 [ %11, %.lr.ph ], [ 1, %.lr.ph.preheader ]
  %11 = add nsw i32 %.013, %.01011
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %11)
  %13 = add nuw nsw i32 %.0912, 1
  %14 = load i32, i32* %1, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %.lr.ph, label %.loopexit

.loopexit:                                        ; preds = %.lr.ph, %6, %0
  %16 = call i64 @clock() #2
  store i64 %16, i64* @stop, align 8
  %17 = load i64, i64* @start, align 8
  %18 = sub nsw i64 %16, %17
  %19 = sitofp i64 %18 to double
  %20 = fdiv double %19, 1.000000e+06
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i64 0, i64 0))
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double %20)
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
