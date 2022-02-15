;%include "io.inc"

extern printf 
extern scanf 

section .data 
d db '%d ', 0
conta dd 0 
contb dd 0 
contc dd 0 

section .bss 
vetor RESD 10 
a RESD 1 
b RESD 1 
c RESD 1 
aux RESD 1 

section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    mov esi, 0 
    
    percorre: 
    
    push aux
    push d 
    call scanf 
    add esp, 8 
    
    mov ebx, DWORD[aux]
    mov DWORD[vetor+esi*4], ebx
    
    inc esi 
    cmp esi, 10
    jb percorre
    
    push a
    push d 
    call scanf 
    add esp, 8
    
    push b
    push d 
    call scanf 
    add esp, 8  
    
    push c 
    push d 
    call scanf 
    add esp, 8 
    
    mov esi, 0 
    mov edi, 0 
    mov edx, 0 
    
    ver_a: 
    
    cmp esi, 10 
    je ver_b
    
    mov ebx, DWORD[a]
    mov eax, DWORD[vetor+esi*4]
    
    inc esi
    
    cmp eax, ebx 
    je contar_a
    jmp ver_a
 
    
    ver_b:
    
    cmp edi, 10 
    je ver_c
    
    mov ebx, DWORD[b] 
    mov eax, DWORD[vetor+edi*4]
    
    inc edi
    
    cmp eax, ebx 
    je contar_b
    jmp ver_b 
    
    mov esi, 0
    
    ver_c:
    
    cmp edx, 10 
    je prints
    
    mov ebx, DWORD[c] 
    mov eax, DWORD[vetor+edx*4]
    
    inc edx
    cmp eax, ebx 
    je contar_c
    jne ver_c  
     
    
    contar_a: 
    
    inc DWORD[conta]
    jmp ver_a 
    
    contar_b: 
    
    inc DWORD[contb]
    jmp ver_b 
   
    contar_c: 
    
    inc DWORD[contc]
    jmp ver_c 
    
    prints: 
    
    push DWORD[conta]
    push d 
    call printf 
    add esp, 8
    
    push DWORD[contb]
    push d 
    call printf 
    add esp, 8
    
    push DWORD[contc] 
    push d 
    call printf 
    add esp, 8
    
    xor eax, eax
    ret
