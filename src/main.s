	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 13, 1
	.globl	_set_bit                        ## -- Begin function set_bit
	.p2align	4, 0x90
_set_bit:                               ## @set_bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %ecx
	movl	$1, %eax
                                        ## kill: def $cl killed $cl killed $ecx
	shll	%cl, %eax
	orl	%eax, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_clear_bit                      ## -- Begin function clear_bit
	.p2align	4, 0x90
_clear_bit:                             ## @clear_bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %ecx
	movl	$-2, %eax
                                        ## kill: def $cl killed $cl killed $ecx
	roll	%cl, %eax
	andl	%eax, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_toggle_bit                     ## -- Begin function toggle_bit
	.p2align	4, 0x90
_toggle_bit:                            ## @toggle_bit
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%esi, %ecx
	movl	$1, %eax
                                        ## kill: def $cl killed $cl killed $ecx
	shll	%cl, %eax
	xorl	%eax, (%rdi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_is_bit_set                     ## -- Begin function is_bit_set
	.p2align	4, 0x90
_is_bit_set:                            ## @is_bit_set
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	btl	%esi, %edi
	setb	%al
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_binary                   ## -- Begin function print_binary
	.p2align	4, 0x90
_print_binary:                          ## @print_binary
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%edi, %r14d
	leaq	L_.str(%rip), %rdi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	_printf
	movl	$31, %ebx
	jmp	LBB4_1
	.p2align	4, 0x90
LBB4_3:                                 ##   in Loop: Header=BB4_1 Depth=1
	addl	$-1, %ebx
	jae	LBB4_4
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	btl	%ebx, %r14d
	movl	$49, %edi
	adcl	$-1, %edi
	callq	_putchar
	testb	$3, %bl
	jne	LBB4_3
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	movl	$32, %edi
	callq	_putchar
	jmp	LBB4_3
LBB4_4:
	movl	$10, %edi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_putchar                        ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_Interrupt_Handler              ## -- Begin function Interrupt_Handler
	.p2align	4, 0x90
_Interrupt_Handler:                     ## @Interrupt_Handler
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	_STATUS_REG(%rip), %eax
	andl	$-11, %eax
	orl	$8, %eax
	movl	%eax, _STATUS_REG(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	orb	$2, _STATUS_REG(%rip)
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	_STATUS_REG(%rip), %eax
	andl	$-11, %eax
	orl	$8, %eax
	movl	%eax, _STATUS_REG(%rip)
	.p2align	4, 0x90
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	testl	$8, _STATUS_REG(%rip)
	je	LBB6_1
## %bb.2:
	leaq	L_str.6(%rip), %rdi
	callq	_puts
	xorl	%eax, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_STATUS_REG                     ## @STATUS_REG
.zerofill __DATA,__common,_STATUS_REG,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Register Value: 0x%08X | Binary: "

L_str:                                  ## @str
	.asciz	"Sensor activated. Waiting for hardware data..."

L_str.6:                                ## @str.6
	.asciz	"Data received successfully!"

.subsections_via_symbols
