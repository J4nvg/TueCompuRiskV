.data
str1:    .ascii "result = \0"
str2:    .ascii "\n\0"

.text

.global main

main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	call read_int
    mv s0,a0
	call read_int
    mv s1,a0
    mv a0,s0
    mv a1,s1
    call gcd
    mv s1,a0
    la a0,str1
    call print_string
    mv a0,s1
    call print_int
    la a0,str2
    call print_string
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	call show_pc
	call exit
    ret

gcd:   
lbl2:   beq a0,a1, EXIT  #Check if a = b if so go to return a
        
        blt a1,a0,lbl1  #Check if b<a e.e. a>b  if so jump to lbl1
        sub t0,a1,a0    #t0 = b-a
        add a1,t0,zero  #a1 = t0 => b = b-a
        j lbl2
        
lbl1:   sub t0,a0,a1    # t0 = a-b
        add a0,t0,zero  # a0 = t0 => a = a-b
        j   lbl2

EXIT:   jr ra
        