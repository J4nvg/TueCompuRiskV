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
    call powpos
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

powpos:
 #   addi    sp,sp,-8    #increase stack
  #  sw      t0,4(sp)    #Save t0 on stack
   # sw      t1,0(sp)    #save t1 on stack
    add     t0,a1,zero  #Let t0(c) be b
    addi    t1,x0,1     #Adds t1 = 1 = d
    
while:  beq x0,t0,EXIT  #If zero<s0 i.e. s0>zero == c>zero
        mul t1,t1,a0    #Multiply d with a
        addi t0,t0,-1   #c-1
        j while         #Check if loop conditions changed
        
EXIT: 
        add  a0,t1,x0   #Load t1 (d) into a0
    #    lw  t1,0(sp)    #restore old s1
     #   lw  t0,4(sp)    #restore old s0
#    addi    sp,sp,8     #decrease stack
        jr ra           #Jump back to main
        

