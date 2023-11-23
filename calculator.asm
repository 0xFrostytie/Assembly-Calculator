


section .data
    ; Data declarations below here

    input_msg db 'Enter two numbers: ', 0
    result_msg db 'Result: ', 0
    input_format db '%d %d', 0 ; format for scanf
    result_format db '%d', 10, 0 ; format for printf, 10 is newline

section .bss
    ; Uninitialized data below here
    num1 resb 4
    num2 resb 4
    result resb 4



section .text
    global main
    extern scanf, printf


global _start

_start:
    ; Code starts here
        ; Print input message
    push input_msg
    call printf
    add esp, 4

    ; Read two numbers
    push num2
    push num1
    push input_format
    call scanf
    add esp, 12

    ; Perform addition
    mov eax, [num1] ; Load first number into eax
    add eax, [num2] ; Add second number to eax
    mov [result], eax ; Store result

    ; Print result
    push eax
    push result_msg
    call printf
    add esp, 8


    ; Exit the program
    mov eax, 1      ; syscall number for exit
    xor ebx, ebx    ; status 0
    int 0x80        ; call kernel
