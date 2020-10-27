;program waits for 3.5 seconds,
;than prints text to standard output
;from zero terminated string

;system calls
SYS_WRITE equ 1
SYS_NANOSLEEP equ 35
SYS_EXIT equ 60

;file descriptors
STDOUT equ 1

section .data
  delay dq 3,500000000
  text db 'Hello',10,0

section .text
  global start

start:
  mov rax,SYS_NANOSLEEP
  mov rdi,delay
  mov rsi,0
  syscall

  mov rax,text
  call _print

  mov rax,SYS_EXIT
  mov rdi,0
  syscall

;subroutine to print zero terminated string
;@rax address of first byte of string to write
_print:
  mov rsi,rax ;when calling SYS_WRITE, rsi should contain address of byte to start from
  mov rdi,STDOUT ;when calling SYS_WRITE, rdi should contain file descriptor to write to
  mov rdx,1 ;when calling SYS_WRITE, rdx should contain number of bytes to write

printLoop:
  mov al,[rsi]
  cmp al,0
  je finish

  mov rax,SYS_WRITE
  syscall
  inc rsi
  jmp printLoop

finish:
  ret
