bits 32
org 101000h
mov eax,21cd4cffh
mov edi,0b8000h
mov ax,0
mov ds,ax
mov ah,17h
fors:
mov ebx,8
mov ecx,0
mov edx,0
mov eax,10
mul ebx
call sleep	
ret
ret
ret
clock:
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	mov ax,0
	mov ds,ax
	mov esi,46ch
	ds
	mov eax,[esi]
	pop es
	pop ds
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
sleep:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	mov edx,eax
	call clock
	add edx,eax
	jc sleep20
	sleep1:
		call clock
		cmp edx,eax
		ja sleep1
	jmp sleep21
	sleep20:
		call clock
		cmp eax,edx
		ja sleep20
	sleep21:
	pop es
	pop ds
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret
