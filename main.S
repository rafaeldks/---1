	.intel_syntax noprefix # Указание синтаксиса Intel
	.text # Начало новой секции
	
	.section	.rodata # Начало секции read-only
.LC0:
	.string	"%d" # Кладём строку "%d"
	.text # Начало новой секции
	
	.globl	readArray
	.type	readArray, @function
readArray:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	sub	rsp, 32 # rsp -= 32 (выделение памяти под функцию)
	mov	QWORD PTR -24[rbp], rdi # rbp[-24] := rdi (представляет из себя первый параметр функции readArray в коде на C)
	mov	DWORD PTR -28[rbp], esi # rbp[-28] := esi (представляет из себя второй параметр функции readArray в коде на C)
	mov	r12d, 0 # r12d := 0 (начало цикла, как i := 0 в коде C), заменил на регистр
	jmp	.L2 # Переход к циклу на .L2
.L3:
	mov	eax, r12d # eax:= i (помещаем i в eax, чтобы использовать регистр в качестве аккумулятора)
	cdqe # sign-extend, отвечает за сохранение знака числа i в регистре rax (лучше оставить, чтобы наверняка ничего не сломалось)
	lea	rdx, 0[0+rax*4] # rdx:= rax*4, где rax = i
	# rdx содержит offset в массиве a на a[i]
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24] (начало массива а)
	add	rax, rdx # rax += rdx
	mov	rsi, rax # rsi:= rax
	lea	rax, .LC0[rip] # rax:= &(массив a), т.е. берём указатель на область памяти, выделенную под массив а
	mov	rdi, rax # rdi:= rax
	xor eax, eax # eax:= 0
	call	__isoc99_scanf@PLT # Вызов scanf в коде на C
	add	r12d, 1 # увеличиваем i на 1: i += 1
.L2:
	mov	eax, r12d # eax:= i (помещаем i в eax, чтобы использовать регистр в качестве аккумулятора)
	cmp	eax, DWORD PTR -28[rbp] # команда сравнения чисел, находящегося в регистре eax и в области памяти rbp[-28], которая заполняет флаги сравнения
	jl	.L3 # если eax(==i)<n, то переходим к .L3
	leave # Выход из функции с удалением фрейма из стека
	ret # Выход из процедуры
	.size	readArray, .-readArray # Метаинформация:
	.globl	createArray # Директива для отображения функции видимой для линкера
	.type	createArray, @function # Определение как функции
createArray:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:=rsp
	mov	QWORD PTR -24[rbp], rdi # rbp[-24] := rdi (представляет из себя первый параметр функции createArray в коде на C)
	mov	QWORD PTR -32[rbp], rsi # rbp[-32] := rsi (представляет из себя второй параметр функции readArray в коде на C)
	mov	DWORD PTR -36[rbp], edx # rbp[-36] := edx (представляет из себя третий параметр функции readArray в коде на C)
	mov	r12d, 0 # r12d := 0 (начало цикла, как i := 0 в коде C), можно заменить i на регистр
	jmp	.L5 # Переход к циклу на .L5
.L9:
	mov	eax, r12d # eax:= i (помещаем i в eax, чтобы использовать регистр в качестве аккумулятора)
	cdqe # sign-extend, отвечает за сохранение знака числа i в регистре rax (лучше оставить, чтобы наверняка ничего не сломалось)
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24]
	add	rax, rdx #rax += rdx
	mov	eax, DWORD PTR [rax] # eax:= rax
	cmp	eax, 5 # команда сравнения числа, находящегося в регистре eax с числом 5, которая заполняет флаги сравнения
	jle	.L6 # Если eax<=5, то переходим на .L6
	mov	eax, r12d # eax:= i
	cdqe # sign-extend
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24]
	add	rax, rdx # rax += rdx
	mov	edx, DWORD PTR [rax] # edx:= rax
	mov	eax, r12d # eax:= i
	cdqe # sign-extend
	lea	rcx, 0[0+rax*4] # rcx:= rax*4
	mov	rax, QWORD PTR -32[rbp] # rax:= rbp[-32]
	add	rax, rcx # rax+= rcx
	add	edx, 5 #edx += 5
	mov	DWORD PTR [rax], edx # rax:= edx
	jmp	.L7 # Переходим на .L7
.L6:
	mov	eax, r12d # eax:= i
	cdqe # sign-extend
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -24[rbp] # rax:= rbp[-24]
	add	rax, rdx # rax += rdx
	mov	eax, DWORD PTR [rax] # eax:= rax
	cmp	eax, -5 # команда сравнения числа, находящегося в регистре eax с числом 5, которая заполняет флаги сравнения
	jge	.L8 # Если eax>=5, то переходим на .L8
	mov	eax, r12d # eax:= i
	cdqe # sign-extend
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -24[rbp] # rax := rbp[-24]
	add	rax, rdx # rax += rdx
	mov	edx, DWORD PTR [rax] # edx:= rax
	mov	eax, r12d # eax = i
	cdqe # sign-extend
	lea	rcx, 0[0+rax*4] # rcx:= rax*4
	mov	rax, QWORD PTR -32[rbp] # rax:= rbp[-32]
	add	rax, rcx # rax += rcx
	sub	edx, 5 # edx -= 5
	mov	DWORD PTR [rax], edx # rax:= edx
	jmp	.L7 # Переходим на .L7
.L8:
	mov	eax, r12d # eax:= i
	cdqe # sign-extend
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -32[rbp] # rax := rbp[-32]
	add	rax, rdx # rax += rdx
	mov	DWORD PTR [rax], 0 # rax := 0
.L7:
	add	r12d, 1 # i += 1
.L5:
	mov	eax, r12d # eax:= i (помещаем i в eax, чтобы использовать регистр в качестве аккумулятора)
	cmp	eax, DWORD PTR -36[rbp] # команда сравнения чисел, находящегося в регистре eax и в области памяти rbp[-36], которая заполняет флаги сравнения
	jl	.L9 # если eax(==i)<n, то переходим к .L9
	pop	rbp # Извлекаем значение со стека
	ret # Выход из процедуры
	.size	createArray, .-createArray # Метаданные
	.section	.rodata # Начало секции read-only
.LC1:
	.string	"%d " # Строка "%d"
	.text # Начало новой секции
	
	.globl	printArray # Директива для отображения функции видимой для линкера
	.type	printArray, @function # Определение как функции
printArray:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	sub	rsp, 32 # rsp -= 32 (выделение памяти под функцию)
	mov	QWORD PTR -24[rbp], rdi # rbp[-24]:= rdi (представляет из себя первый параметр функции printArray в коде на C)
	mov	DWORD PTR -28[rbp], esi # rbp[-28]:= esi (представляет из себя второй параметр функции printArray в коде на C)
	mov	r12d, 0 # i:= 0
	jmp	.L11 # Переходим на .L11
.L12:
	mov	eax, r12d #eax = i
	cdqe # sign-extend
	lea	rdx, 0[0+rax*4] # rdx:= rax*4
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx # rax += rdx
	mov esi, DWORD PTR [rax] # Оптимизировано: esi:= rax
	lea	rax, .LC1[rip] # rax:= &(строка "%d")
	mov	rdi, rax
	xor eax, eax # eax:= 0
	call	printf@PLT # Вызов prinf
	add	r12d, 1 # i += 1
.L11:
	mov	eax, r12d # eax:= i
	cmp	eax, DWORD PTR -28[rbp] # команда сравнения чисел, находящегося в регистре eax и в области памяти rbp[-28], которая заполняет флаги сравнения
	jl	.L12 # Если eax(==i)<n, то переходим на .L12
	leave # Выход из функции с удалением фрейма из стека
	ret # Выход из процедуры
	.size	printArray, .-printArray # Метаданные
	.section	.rodata # Начало секции read-only
	.align 8 # Дополняет счётчик места до 8
.LC2:
	.string	"\320\236\321\210\320\270\320\261\320\272\320\260: \321\200\320\260\320\267\320\274\320\265\321\200 \320\274\320\260\321\201\321\201\320\270\320\262\320\260 \320\264\320\276\320\273\320\266\320\265\320\275 \320\261\321\213\321\202\321\214 \320\262 \320\264\320\270\320\260\320\277\320\260\320\267\320\276\320\275\320\265 0 <= n <= 10. \320\227\320\260\320\277\321\203\321\201\321\202\320\270\321\202\320\265 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\203 \320\265\321\211\320\265 \321\200\320\260\320\267!"
	# Строка с сообщением об ошибке
	.text # Начало новой секции
	
	.globl	main 
	.type	main, @function
main:
	push	rbp # Кладём rbp на стек
	mov	rbp, rsp # rbp:= rsp
	sub	rsp, 112 # rsp -= 112 (выделение памяти под функцию)
	mov	rax, QWORD PTR fs:40 # rax:= <оффсет>
	mov	QWORD PTR -8[rbp], rax # rbp[-8] = rax
	xor	eax, eax # eax:= 0
	lea	rax, -100[rbp] # rax:= &rbp[-100] (array_size)
	mov	rsi, rax  # rsi:= rax
	lea	rax, .LC0[rip] # rax := &(строка "%d")
	mov	rdi, rax # rdi:= rax
	xor eax, eax # eax:= 0
	call	__isoc99_scanf@PLT # вызов scanf
	mov r13d, -100[rbp] # Кладём array_size в регистр r13d для оптимизации
	mov	eax, r13d # eax:= array_size
	test	eax, eax # Логическое побитовое И
	js	.L14 # Если array_size<0, то переходим в .L14
	mov	eax, r13d # eax:= array_size
	cmp	eax, 10 # команда сравнения числа, находящегося в регистре eax, с числом 10, которая заполняет флаги сравнения
	jle	.L15 # Если array_size>10, то переходим в .L15
.L14:
	lea	rax, .LC2[rip] # rax:= &(строка с предупреждением об ошибке)
	mov	rdi, rax # rdi:= rax
	xor eax, eax # eax:= 0
	call	printf@PLT # Вызов printf
	xor eax, eax # eax:= 0
	jmp	.L17 # Переходим в .L17
.L15:
	mov	edx, r13d # edx:= array_size
	lea	rax, -96[rbp] # rax:= &rbp[-6]
	mov	esi, edx # esi:= edx
	mov	rdi, rax # rdi:= rax
	call	readArray # Вызов функии readArray
	mov	edx, r13d # edx:= array_size
	lea	rcx, -48[rbp] # rcx:= &rbp[-48]
	lea	rax, -96[rbp] # rax:= &rbp[-96]
	mov	rsi, rcx # rsi:= rcx
	mov	rdi, rax # rdi:= rax
	call	createArray # Вызов функции createArray
	mov	edx, r13d # edx:= array_size
	lea	rax, -48[rbp] # rax:= rbp[-48]
	mov	esi, edx # edi:= edx
	mov	rdi, rax # rdi:= rax
	call	printArray # Вызов функции printArray
	xor eax, eax # eax:= 0
.L17:
	mov	rdx, QWORD PTR -8[rbp] # rdx:= rbp[-8]
	sub	rdx, QWORD PTR fs:40 # rdx -= fs, который содержит оффсет
	je	.L18 # Если код возврата 0, то идём в .L18
	call	__stack_chk_fail@PLT # Если код возврата не 0, то произошла ошибка и соответствующий вызов
.L18:
	leave # Выход из функции с удалением фрейма из стека
	ret # Выход из процедуры
	.size	main, .-main # Метаданные
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0" #Метаинформация
	.section	.note.GNU-stack,"",@progbits