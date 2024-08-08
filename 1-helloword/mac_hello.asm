global _start

section .data
message: db 'hello, world!', 10
msg_len: equ $ - message  ; Calculate the length of the message

section .text
align 4
_start:
    ; Write system call (sys_write)
    mov rax, 0x2000004    ; system call number for sys_write on macOS
    mov rdi, 1           ; file descriptor (stdout)
    lea rsi, [rel message] ; use relative addressing
    mov rdx, msg_len     ; message length
    syscall

    ; Exit system call (sys_exit)
    mov rax, 0x2000001    ; system call number for sys_exit on macOS
    xor rdi, rdi         ; exit status 0
    syscall

; nasm -f macho64 hello.asm -o hello.o
; ld -o hello hello.o -lSystem -syslibroot $(xcrun --show-sdk-path) -e _start -platform_version macos 10.15 11.0

; lldb ./hello
; run