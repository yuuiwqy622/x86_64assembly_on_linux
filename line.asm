;system calls
SYS_WRITE equ 1
SYS_EXIT equ 60

;file descriptors
STDOUT equ 1

CNT equ 800 ;number of chars to print
CHAR equ '+' ;character to print

section .bss
 char resb 1

section .text
  global start

start:
  mov al,CHAR
  mov [char],al ;put character to print to memory, because SYS_WRITE requires pointer to string
  mov rax,SYS_WRITE
  mov rdi,STDOUT
  mov rsi,char
  mov rdx,1

  mov rbx,CNT

loop:
  syscall
  dec rbx
  cmp rbx,0
  jne loop

  mov bl,10 ;print newline at the end of the string
  mov [char],bl
  syscall

  mov rax,SYS_EXIT
  mov rdi,0
  syscall
