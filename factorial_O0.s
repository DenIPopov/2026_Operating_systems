	.file	"factorial.cpp"
	.text
	.globl	_Z9factoriali
	.def	_Z9factoriali;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriali

; ========== ФУНКЦИЯ factorial ==========
; unsigned long long factorial(int n)
; Аргумент: n (32 бита) передаётся в регистре ecx
; Возвращаемое значение: в регистре rax (64 бита)

_Z9factoriali:
.LFB2607:
	; === ПРОЛОГ ФУНКЦИИ ===
	pushq	%rbp			; сохраняем старый базовый указатель
	.seh_pushreg	%rbp
	pushq	%rbx			; сохраняем регистр rbx (он используется)
	.seh_pushreg	%rbx
	subq	$40, %rsp		; выделяем 40 байт на стеке для локальных переменных
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp		; устанавливаем новый базовый указатель
	.seh_setframe	%rbp, 32
	.seh_endprologue
	
	; === СОХРАНЕНИЕ АРГУМЕНТА ===
	movl	%ecx, 32(%rbp)		; сохраняем n (первый аргумент) на стеке
	
	; === БАЗОВЫЙ СЛУЧАЙ: if (n <= 1) return 1; ===
	cmpl	$1, 32(%rbp)		; сравниваем n с 1
	jg	.L2			; если n > 1, прыгаем к рекурсивному случаю
	movl	$1, %eax		; иначе возвращаем 1
	jmp	.L3			; прыгаем к выходу из функции
	
.L2:
	; === РЕКУРСИВНЫЙ СЛУЧАЙ: return n * factorial(n-1); ===
	movl	32(%rbp), %eax		; загружаем n в eax
	movslq	%eax, %rbx		; расширяем eax (32 бита) до rbx (64 бита)
	movl	32(%rbp), %eax		; снова загружаем n
	subl	$1, %eax		; n = n - 1
	movl	%eax, %ecx		; передаём (n-1) как аргумент в ecx
	call	_Z9factoriali		; рекурсивный вызов factorial(n-1)
	imulq	%rbx, %rax		; rax = n * результат вызова
	
.L3:
	; === ЭПИЛОГ ФУНКЦИИ ===
	addq	$40, %rsp		; освобождаем стек
	popq	%rbx			; восстанавливаем rbx
	popq	%rbp			; восстанавливаем базовый указатель
	ret				; возвращаем результат (в rax)
	.seh_endproc

; ========== СЕКЦИЯ ДАННЫХ (константы) ==========
	.section .rdata,"dr"
.LC0:
	.ascii "Enter number (0-20): \0"	; строка приглашения
	.align 8
.LC1:
	.ascii "Error: number must be between 0 and 20\0"	; строка ошибки
.LC2:
	.ascii "! = \0"					; строка-разделитель

; ========== ФУНКЦИЯ main ==========
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2608:
	; === ПРОЛОГ main ===
	pushq	%rbp			; сохраняем базовый указатель
	.seh_pushreg	%rbp
	pushq	%rbx			; сохраняем rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp		; выделяем 56 байт на стеке
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp		; устанавливаем базовый указатель
	.seh_setframe	%rbp, 48
	.seh_endprologue
	
	; === ИНИЦИАЛИЗАЦИЯ (вызов __main) ===
	call	__main			; инициализация MinGW
	
	; === ВЫВОД СТРОКИ: "Enter number (0-20): " ===
	leaq	.LC0(%rip), %rdx	; загружаем адрес строки .LC0 в rdx
	movq	.refptr._ZSt4cout(%rip), %rax	; загружаем адрес cout
	movq	%rax, %rcx		; передаём cout как аргумент
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
					; вызов operator<< (cout, строка)
	
	; === ВВОД ЧИСЛА: cin >> n ===
	leaq	-4(%rbp), %rax		; адрес переменной n (локальной)
	movq	.refptr._ZSt3cin(%rip), %rcx	; загружаем адрес cin
	movq	%rax, %rdx		; передаём адрес n как аргумент
	call	_ZNSirsERi		; вызов operator>> (cin, n)
	
	; === ПРОВЕРКА УСЛОВИЯ: if (n < 0 || n > 20) ===
	movl	-4(%rbp), %eax		; загружаем n в eax
	testl	%eax, %eax		; проверяем n == 0?
	js	.L5			; если n < 0 (знак минус), прыгаем к ошибке
	movl	-4(%rbp), %eax		; снова загружаем n
	cmpl	$20, %eax		; сравниваем n с 20
	jle	.L6			; если n <= 20, прыгаем к нормальному выполнению
	
.L5:	; === БЛОК ОБРАБОТКИ ОШИБКИ ===
	leaq	.LC1(%rip), %rdx	; загружаем адрес строки ошибки
	movq	.refptr._ZSt4cout(%rip), %rax	; загружаем cout
	movq	%rax, %rcx		; передаём cout как аргумент
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
					; вывод строки ошибки
	movq	%rax, %rcx		; передаём результат для endl
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx		; передаём endl
	call	_ZNSolsEPFRSoS_E	; вызов operator<< (cout, endl)
	movl	$1, %eax		; возвращаем 1 (код ошибки)
	jmp	.L8			; прыгаем к выходу из main
	
.L6:	; === БЛОК НОРМАЛЬНОГО ВЫПОЛНЕНИЯ ===
	; === ВЫВОД: cout << n ===
	movl	-4(%rbp), %edx		; загружаем n в edx
	movq	.refptr._ZSt4cout(%rip), %rax	; загружаем cout
	movq	%rax, %rcx		; передаём cout как аргумент
	call	_ZNSolsEi		; вызов operator<< (cout, n)
	
	; === ВЫВОД: cout << "! = " ===
	movq	%rax, %rcx		; передаём результат
	leaq	.LC2(%rip), %rax	; загружаем адрес строки "! = "
	movq	%rax, %rdx		; передаём строку
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
					; вывод строки "! = "
	
	; === ВЫЗОВ factorial(n) И ВЫВОД РЕЗУЛЬТАТА ===
	movq	%rax, %rbx		; сохраняем результат в rbx
	movl	-4(%rbp), %eax		; загружаем n
	movl	%eax, %ecx		; передаём n как аргумент
	call	_Z9factoriali		; вызов factorial(n)
	movq	%rax, %rdx		; результат factorial в rdx
	movq	%rbx, %rcx		; переданный ранее результат
	call	_ZNSolsEy		; вызов operator<< (cout, результат)
	
	; === ВЫВОД endl ===
	movq	%rax, %rcx		; передаём результат
	movq	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%rip), %rax
	movq	%rax, %rdx		; передаём endl
	call	_ZNSolsEPFRSoS_E	; вывод символа новой строки
	
	; === ВОЗВРАТ 0 (успешное завершение) ===
	movl	$0, %eax		; возвращаем 0
	
.L8:	; === ЭПИЛОГ main ===
	addq	$56, %rsp		; освобождаем стек
	popq	%rbx			; восстанавливаем rbx
	popq	%rbp			; восстанавливаем rbp
	ret				; возврат из main
	.seh_endproc

; ========== ВСПОМОГАТЕЛЬНЫЕ СЕКЦИИ ==========
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-Builds project) 16.1.0"
	
; ========== ТАБЛИЦА ССЫЛОК НА ВНЕШНИЕ ФУНКЦИИ ==========
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc; .scl 2; .type 32; .endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEPFRSoS_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEy;	.scl	2;	.type	32;	.endef
	
	.section	.rdata$.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.linkonce	discard
.refptr._ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_:
	.quad	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
	
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout