BITS 64
DEFAULT REL

section  .data
message: db    "Hello, World!", 0Ah, 00h

section  .text
global  _main
_main:
  mov    rax, 0x02000004    ; system call for write
  mov    rdi, 1             ; file descriptor 1 is stdout
  lea rsi, [rel message]    ; get string address
  mov rdx, 14               ; number of bytes (including newline and null terminator)
  syscall                   ; execute syscall (write)

  mov    rax, 0x02000001    ; system call for exit
  mov    rdi, 0             ; exit code 0
  syscall