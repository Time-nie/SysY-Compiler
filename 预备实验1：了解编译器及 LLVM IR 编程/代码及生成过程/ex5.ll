@k = constant float 2.000000e+00, align 4              ; 全局常量声明 const float k=2.0;
@a = global float 2.000000e+00, align 4                ; 全局变量声明 float a=2.0;
@b = global float 2.000000e+01, align 4		   ; 全局变量声明 float b=2.0;
@c = global [3 x i32] [i32 1, i32 2, i32 3], align 4   ; 全局变量声明 c[3]={1,2,3};

; 定义函数 float func(int d)
define float @func(i32 %0) {
  %2 = alloca i32, align 4               
  store i32 %0, i32* %2, align 4         
  %3 = load float, float* @a, align 4  ; %3存a的值,float类型
  %4 = load i32, i32* %2, align 4      ; %4存参数d的值，int类型
  %5 = sitofp i32 %4 to float          ; %4进行类型转换，int转float
  %6 = fmul float %3, %5               
  %7 = fptosi float %6 to i32          ; %6进行类型转换，float转int
  store i32 %7, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @c, i64 0, i64 1), align 4    ; %7的值存入c[1]
  %8 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @c, i64 0, i64 0), align 4    ; %8=c[0]
  %9 = load i32, i32* %2, align 4    ; %9=d
  %10 = srem i32 %8, %9              
  store i32 %10, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @c, i64 0, i64 2), align 4     ; c[2]=c[0]%d;
  %11 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @c, i64 0, i64 1), align 4     ; %11=c[1]
  %12 = sitofp i32 %11 to float              ; %11进行类型转换，int转float
  %13 = fadd float -2.000000e+00, %12        ; %13=-k
  %14 = load i32, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @c, i64 0, i64 2), align 4      
  %15 = sitofp i32 %14 to float          
  %16 = fadd float %13, %15              
  ret float %16          ;return -k+c[1]+c[2];
}

; 定义函数 int main()
define i32 @main() {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4   ; *%1=0
  store i32 0, i32* %2, align 4   ; *%2=0;
  %4 = call i32 @getint()
  store i32 %4, i32* %3, align 4  ; *%3=getint();
  br label %5

; 实现while循环while(i<10){...}                                               
5:
  %6 = load i32, i32* %2, align 4   ; 局部变量i=%6=0
  %7 = icmp slt i32 %6, 10            
  br i1 %7, label %8, label %22     ; 如果i<10，则跳转则label%8，否则跳转至lable%22

; label%8和label%22本质上是实现了if(b/a==0&&a>21) break 的条件分支  
8:                                               
  %9 = load float, float* @a, align 4    
  %10 = fadd float %9, 3.000000e+00    
  store float %10, float* @a, align 4                  ; a=a+3;
  %11 = load float, float* @b, align 4                 ; %11=b;
  %12 = load float, float* @a, align 4                 ; %12=a;
  %13 = fdiv float %11, %12                            ; %13=a/b
  %14 = fcmp oeq float %13, 0.000000e+00   
  br i1 %14, label %15, label %19                    ; 如果满足a/b==0，则跳转至label%15，接着判断下一个条件，否则跳转至label%19

15:                                            
  %16 = load float, float* @a, align 4
  %17 = fcmp ogt float %16, 2.100000e+01
  br i1 %17, label %18, label %19                   ; 如果a>21，则跳转至label%18，否则跳转至label%19

18:                                               
  br label %22   ;实现break，跳出while循环

19:                                               
  %20 = load i32, i32* %2, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %2, align 4   ; 实现i=i+1，值存入%2
  br label %5

22:
  %23 = load i32, i32* %3, align 4                                              
  %24 = call float @func(i32 %23)        ; 调用函数func(%23)
  %25 = fptosi float %24 to i32          ; %24进行类型转换，float转int
  call void @putint(i32 %25)  ; 调用函数putint(%25)

  ret i32 0
}
; 函数声明
declare i32 @getint()
declare void @putint(i32)

