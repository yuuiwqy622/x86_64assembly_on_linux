;helper file for NASM programs

;syscalls
SYS_READ equ 0
SYS_WRITE equ 1
SYS_OPEN equ 2
SYS_CLOSE equ 3
SYS_EXIT equ 60

;file modes
RDONLY equ 0
WRONLY equ 1
CREATE equ 64

;file descriptors
STDOUT equ 1

%macro exit 0
  mov rax,SYS_EXIT
  mov rdi,0
  syscall
%endmacro
