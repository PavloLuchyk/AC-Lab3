TITLE ЛР_3 
;------------------------------------------------------------------------------
;ЛР  №3
;------------------------------------------------------------------------------
;------------------------------------I.ЗАГОЛОВОК ПРОГРАМИ--------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 512		; Директива - розмір стеку 
;---------------------------------------------II.МАКРОСИ---------------------------
MACRO M_Init
mov ax, @data
mov ds, ax
mov es, ax
ENDM M_Init
;--------------------III.ПОЧАТОК СЕГМЕНТУ ДАНИХ--------------
DATASEG
;Оголошення двовимірного експериментального масиву 16х16
array2Db db 2dh, 2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
         db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
  		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
 		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
	     db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 7ch, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,7ch
		 db 2dh, 2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh ,2dh
; Для вирівнювання у дампі
arr_def1 dw 3, 0 , 0 , 0 , 0 , 0 , 0 , 0
exCode DB 0
CODESEG
;----------------------VI. ПОЧАТОК СЕГМЕНТУ КОДУ-------------------
Start:
M_Init
	; Iндексна адресація.
	mov di, 05eh
	mov bx, 50h
	mov [di], bx ;M(DS*16+DI)<-BX
	add di, 0fh
	mov bx, 44h
	mov [di], bx ;M(DS*16+DI+1)<-BX
	add di, 0fh
	mov bx, 53h
	mov [di], bx ;M(DS*16+DI+2)<-BX
	add di, 0fh
	mov bx, 50h
	mov [di], bx ;M(DS*16+DI)<-BX
	add di, 0fh
	mov bx, 44h
	mov [di], bx ;M(DS*16+DI+1)<-BX
	add di, 0fh
	mov bx, 53h
	mov [di], bx ;M(DS*16+DI+2)<-BX
	add di, 0fh
	mov bx, 50h
	mov [di], bx ;M(DS*16+DI)<-BX
	add di, 0fh
	mov bx, 44h
	mov [di], bx ;M(DS*16+DI+1)<-BX
	add di, 0fh
	mov bx, 53h
	mov [di], bx ;M(DS*16+DI+2)<-BX
	add di, 0fh
	mov bx, 50h
	mov [di], bx ;M(DS*16+DI)<-BX
	mov si, 01h ;До SI заносимо ;значення зміщення у сегменті даних.
	mov ax, [si] ;До АХ заносимо зміст значення з адреси пам’яті [DS]:[SI].
	
	
Exit:
	mov ah,04ch
	mov al,[exCode]			; отримання коду виходу 
	int 21h				; виклик функції DOS 4ch
	
end Start