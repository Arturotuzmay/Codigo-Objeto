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