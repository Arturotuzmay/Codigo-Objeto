;GENERACION DE CODIGO OBJETO
;PROGRAMA INFORMATICO, OPERACIONES BASICAS (SUMA, RESTA, MUTIPLICACION Y DIVISION)

;Sexto semestre Grupo "A"
;Alumnos:                              
    ;Manuel Arturo Tuz May
    ;Carlos Daniel Ciau Nahuat




        ciclo macro num          ;Ciclo que toma el valor y lo compara
 
             cmp num, 31h        ;Compara el numero ingresado con el "1"
             jnz res             ;Hace un salto si el numero no es "1"
             call SUMA           ;Si es "1" llama a la funcion creada

             res:                ;Espacio que espera el salto
             ciclo1 num          ;Se traslada el valor a un nuevo ciclo
        endm     
        

        ciclo1 macro num
 
             cmp num, 32h        ;Compara el numero ingresado con el "2"
             jnz mult            ;Hace un salto si el numero no es "2"
             call RESTA          ;Si es "2" llama a la funcion creada
 
             mult:               ;Espacio que espera el salto
             ciclo2 num          ;Se llama a la macro para finalizar el programa
        endm   
        

        ciclo2 macro num
 
             cmp num, 33h        ;Compara el numero ingresado con el "3"
             jnz divs            ;Hace un salto si el numero no es "3"
             call MULTI          ;Si es "3" llama a la funcion creada
 
             divs:               ;Espacio que espera el salto
             ciclo3 num          ;Se llama a la macro para finalizar el programa
        endm

        ciclo3 macro num
 
            cmp num, 34h         ;Compara el numero ingresado con el "4"
            jnz salirr           ;Hace un salto si el numero no es "4"
            call DIVI            ;Si es "4" llama a la funcion creada
 
        salirr:                  ;Espacio que espera el salto     
        
            ciclofin num         ;Se llama a la macro para finalizar el programa 
            
        endm

        ciclofin macro num                       
            
            cmp num, 35h         ;Compara si el numero es "5"
            jnz multi3           ;Hace un salto si el numero no es "5"
            call salir           ;Si es "5" se llama a la funcion 
                                 ;para finalizar del programa
    
            multi3:
         
            mov ah,00h           ;Limpia pantalla 
            mov al,03h
                int 10h 
         
            mov ah, 09h          ;Mensaje de error
	        mov dx, offset Msg8
                int 21h  
                
            call salir 
            
        endm 
       
                
        muestra macro al
                            
            aam                  ;ajusta el valor en AL por el resultado
        
            mov uni,al           ; Respaldo en unidades
            mov al,ah            ;muevo lo que tengo en AH a AL para poder volver
                                 ; a separar los numeros
            aam                  ; separa lo qe hay en AL
            mov cen,ah           ;respaldo las centenas en cen
                        
            mov dece,al          ;respaldo las decenas en dec
            
            mov ah, 09h
        	lea dx, Msg7
                int 21h            
                        
           ;Imprimimos los tres valores empezando por centenas, decenas y unidades.
                     
            mov ah,02h
                        
            mov dl,cen
            add dl,30h           ; se suma 30h a dl para imprimir el numero real.
                int 21h
                        
            mov dl,dece
            add dl,30h
                int 21h
                        
            mov dl,uni
            add dl,30h
                int 21h
                    
            call inicio          ;Vuelve al inicio del programa creando un ciclo
         endm            

;SEGMENTO DEL PROGRAMA QUE LLAMA A LAS FUNCIONES Y REALIZA LAS ACTIVIDADES PRINCIPALES
        org 100h
        
        .data
             MsgA    DB 10, 13, 'Acepta numeros de dos digitos (00) $'
             MsgB    DB 10, 13, 'Resultados de 3 digitos (000) $'
             Msg     DB 10, 13, 'Seleccione una opcion:  $' 
             Msg1    DB 10, 13, '1. Sumas $'
             Msg2    DB 10, 13, '2. Restas $'
             Msg3    DB 10, 13, '3. Multiplicacion $'
             Msg4    DB 10, 13, '4. Division $'
             Msg5    DB 10, 13, '5. Salir $'
             Msg6    DB 10, 13, 'Ingrese el numero:  $'
             Msg7    DB 10, 13, 'EL resultado es:  $' 
             Msg8    DB 10, 13, 'Usted presiono una opcion invalida $'
             Msg9    DB 10, 13, 'Gracias $'    
             
             u       db 0
             d       db 0
             n       db 0 
             cen     db 0
             dece    db 0
             uni     db 0
        
        .code
        
        inicio:
            
             mov ax, @Data
        	 mov ds, ax
        		
        	 mov ah, 09h            ;Se establecen los mensajes de inicio
        	 mov dx, offset MsgA
        	    int 21h
             
             mov ah, 09h
        	 mov dx, offset MsgB
        	    int 21h
        	
        	mov ah, 09h
        	 mov dx, offset Msg
        	    int 21h
        	   
             mov ah, 09h
        	 mov dx, offset Msg1
        	    int 21h
        	
        	 mov ah, 09h
        	 mov dx, offset Msg2
        	    int 21h
        	
        	 mov ah, 09h
        	 mov dx, offset Msg3
        	    int 21h
                  
             mov ah, 09h
        	 mov dx, offset Msg4
        	    int 21h                
        	
        	 mov ah, 09h
        	 mov dx, offset Msg5
        	    int 21h
                  
             mov ah, 01
                int 21h              ;Se ingresa un dato "opcion del menu"
                     	
        ciclo al                     ;Se toma el dato ingresado y se traslada al ciclo
           
      

        SUMA proc 
         
              mov ah,00h             ;Limpia pantalla 
              mov al,03h
                int 10h
               
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al  
                                       
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
            
                                     ;n RESGUARDA EL VALOR GENERADO NUMERO DE LA FORMA: du = n
               mov n, al
              
              mov ah, 09h
	          mov dx, offset Msg6
	          int 21h
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al  
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u  
               
                                     
             ;Procedimiento que hace la suma 
        	     
        	    add al, n 
        	    
        	 
              muestra al ;Macro que toma el resultado de la suma y lo muestra en pantalla
         
        SUMA endp   
    
        
        RESTA proc
         
              mov ah,00h             ;Limpia pantalla 
              mov al,03h
                int 10h
               
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h  
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h  
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h 
                
              sub al, 30h
              mov u, al                           
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
            
                                     ;n RESGUARDA EL VALOR GENERADO NUMERO DE LA FORMA: du = n
              mov n, al
              
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h   
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h  
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h 
                
              sub al, 30h
              mov u, al                             
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
             
              ;Procedimiento que hace la Resta 
        	      
        	  mov bl, al
              mov al, n
        	  sub al, bl 
        	    
              muestra al ;Macro que toma el resultado de la suma y lo muestra en pantalla
         
        RESTA endp
    
    
        MULTI proc 
          
              mov ah,00h             ;Limpia pantalla 
              mov al,03h
                int 10h
               
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h 
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al                              
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u            
                                    ;n RESGUARDA EL VALOR GENERADO NUMERO DE LA FORMA: du = n
              mov n, al
              
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al                                         
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
               
              ;Procedimiento que hace la multiplicacion
                                    
              mov cl, n              ;Toma el primer valor y lo mueve a cl
              mul cl                 
              
              muestra al ;Macro que toma el resultado de la suma y lo muestra en pantalla
        
        MULTI endp
    
        
        DIVI proc
         
              mov ah,00h             ;Limpia pantalla 
              mov al,03h
                int 10h
               
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h 
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al                           
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
            
                                     ;n RESGUARDA EL VALOR GENERADO NUMERO DE LA FORMA: du = n
               mov n, al
              
              mov ah, 09h
	          mov dx, offset Msg6
	            int 21h
	            
                                     ;SE ALMACENA LAS DECENAS
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov d, al
                 
                                     ;SE ALMACENA LAS UNIDADES
              mov ah, 01h
                int 21h
                
              sub al, 30h
              mov u, al                                        
                                     ;MULTIPLICAR EL DATO d * 10 PARA OBTENER DECENAS
                                     ;Y SE LE SUMA u EN RELACION A LAS UNIDADES
              mov al, d
              mov bl, 10
              mul bl
              add al, u
             
             ;Procedimiento que hace la resta  
        	  mov bl, al
              mov al, n
        	  div bl 
        	    
              muestra al ;Macro que toma el resultado de la suma y lo muestra en pantalla
         
       DIVI endp
             
            
       salir proc   ;Procedimiento que finaliza el programa
             
              mov ah, 09h
    	      mov dx, offset Msg9
                int 21h
              mov ah,04ch  
                int 21h
             
       salir endp
            
end
