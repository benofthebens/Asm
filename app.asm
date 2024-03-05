bits 64
default rel

section .data
    format db "%d", 0       ; Format string for printf
    num1   dq 10            ; First number
    num2   dq 5             ; Second number
    result dq 0             ; Variable to store the result

section .text
    global main
    extern printf
    extern ExitProcess

    main:
        push    rbp
        mov     rbp, rsp

        mov     rax, [num1] ; Load the value of num1 into rax
        add     rax, [num2] ; Add the value of num2 to rax
        mov     [result], rax ; Store the result of the alu in 'result'

        lea     rcx, [format] ; Load the address of the format string into rcx
        mov     rdx, [result] ; Load the result into rdx
        xor     rax, rax ; Zero out rax to indicate we're passing 1 integer argument to printf
        call    printf ; Call printf to print the result

        xor     rcx, rcx ; Zero out rcx to pass as the exit code to ExitProcess
        call    ExitProcess ; Call ExitProcess to exit the program