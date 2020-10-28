;program prints number to standard output
;using SYS_WRITE

;system calls
SYS_WRITE equ 1
SYS_EXIT equ 60

;file descriptors
STDOUT equ 1

;number to print
NUM equ 123

section .bss
  digit resb 100

section .text
  global start

start:
  mov rax,NUM
  call _printNum

  mov rax,SYS_EXIT
  mov rdi,0
  syscall

_printNum:
  mov rbx,10
  mov [digit],rbx
  mov rsi,digit+1

readDigit:
  mov rdx,0
  div rbx
  add rdx,'0'

  mov [rsi],dl
  inc rsi
  cmp rax,0
  jne readDigit

  mov rax,SYS_WRITE
  mov rdi,STDOUT
  mov rdx,1

printDigit:
  syscall

  dec rsi
  cmp rsi,digit
  jge printDigit

  ret
