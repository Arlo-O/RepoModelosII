section .data
    temp_celsius dq 11.0         ; Valor de celsius predeterminado
    nueve dq 9.0                ; Valores para la conversion
    cinco dq 5.0
    treinta_y_dos dq 32.0
    msgFahrenheit db "La temperatura en Fahrenheit es: ", 0 ;Mensaje de salida 

section .bss
    temp_fahrenheit resq 1       ; espacio reservado para la temperatura en farenheit 
    temp_fahrenheit_int resd 1   ; reserva para el entero de farenheit
    buffer resb 32               ; Buffer para almacenar el número convertido

section .text
    global _start

_start:
    ; temp_fahrenheit = (temp_celsius * 9/5) + 32
    movsd xmm0, [temp_celsius]   ; xm00 = temp_celsius
    movsd xmm1, [nueve]          ; xmm1 = 9.0
    mulsd xmm0, xmm1             ; xmm0 = xmm0 * 9.0
    movsd xmm1, [cinco]          ; xmm1 = 5.0
    divsd xmm0, xmm1             ; xmm0 = xmm0 / 5.0
    addsd xmm0, [treinta_y_dos]  ; xmm0 = xmm0 + 32
    movsd [temp_fahrenheit], xmm0 ; temp_fahrenheit = xmm0

    ; Convertir el número float a entero
    cvttsd2si eax, xmm0          ; eax = xmm0 entero, corta los decimales de xmm0
    mov [temp_fahrenheit_int], eax; temp_fahrenheit_int = entero del calculado

    ; Mensaje de salida
    mov rax, 1                   ; rax = 1, usualmente 1 en rax es la llamada a sys_write
    mov rdi, 1                   ; rdi se usa para pasar el primer argumento a la llamada de sys_write (desencriptador) 1 representa la salida estandar que es la consola
    mov rsi, msgFahrenheit       ; rsi es el segundo argumento de sys_write que se refiera a la direccion de memoria de los datos que se quieren escribir
    mov rdx, 34                  ; rdx tercer arumento longitud en bytes de lo que se quiere escribir
    syscall                      ; Llamada al sistema para ejecutar sys_write con los argumentos que se pasaron

    ; Convertir la parte entera a string para mostrarlo
    mov rax, [temp_fahrenheit_int] ; rax = parte entera de temp_fahrenheit
    call int_to_string             ; Llamar a la funcion

    ; Mostrar el valor convertido (almacenado en el buffer)
    mov rax, 1                   ; sys_write
    mov rdi, 1                   ; argumento para que salga por consola
    mov rsi, buffer              ; rsi es el mensaje a imprimir, numero convertido
    mov rdx, 32                  ; Tamaño del buffer
    syscall                      ; Llamada al sistema para mostrar el número

    ; Finalizar el programa
    mov rax, 60                  ; sys_exit
    xor rdi, rdi                 ; Código de salida 0
    syscall

  ; Se necesita crear una funcion propia para convertir el numero a string
  int_to_string:                    ; usa a rax como su primer argumento
      mov rdi, buffer               ; rdi sera el buffer para guardar la cadena
      mov rcx, 10                   ; rcx = 10, divisor para extraer los digitos

    convert_digit:
        xor rdx, rdx                  ; es el or, si cumple retorna 0 es para limpiar el registro siempre se cumple
        div rcx                       ; Dividir rax entre rcx, rax = cociente, rdx residuo (ultimo digito)
        add dl, '0'                   ; dl es el residuo sumandolo a '0' convierte ese valor en ASCII y lo asigna a dl
        mov [rdi], dl                 ; Almacenar el carácter en el buffer
        inc rdi                       ; incrementa en 1 el valor de rdi asi avanza al puntero del siguiente byte en el buffer
        test rax, rax                 ; AND de rax con rax, verifica si rax=0, entonces ZF=1 si rax=0 para dar el salto en la sig linea
        jnz convert_digit             ; Si ZF!=0, seguir convirtiendo dígitos lo devuelve a la linea 58
    
        ; Invertir la cadena, rsi y rdi apuntan a los extremos de la cadena inicialmente
        mov rsi, buffer               ; Apuntar al inicio del buffer(direccion) para invertirlo
        dec rdi                       ; Apuntar al último carácter válido, disminuye 1 porque en el ultimo ciclo queda apuntando al siguietne byte
        
    reverse:                          ; Etiqueta que marca el cmoienzo de la funcion reverse
        cmp rsi, rdi                  ; comparacion para saber si rsi alcanzo a rdi (final)
        jge end_reverse               ; jump if greater or equal, salta a la linea 82
        mov al, [rsi]                 ; Cargar el carácter de la parte alta
        mov bl, [rdi]                 ; Cargar el carácter de la parte baja
        mov [rsi], bl                 ; Mueve el caracter de bl a la parte alta
        mov [rdi], al                 ; Mueve el caracter de al a la parte baja
        inc rsi                       ; Avanza un caracter (el caracter que se acaba de mover) en la parte alta 
        dec rdi                       ; Retroce un caracter (el caracter que se acaba de mover) en la parte baja
        jmp reverse                   ; Salta a la liena 71
    
    end_reverse:
        ret                           ; Retornar de la función a donde fue llamada
