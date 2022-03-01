.orig x3000
;this stack lab computes the polish notation of a set of calls

lea r6, stack_addr
;;add r6, r6, #-1
;;str r7, r6, #0

;push_val(4) pushes the value 4 onto the stack [4]
and r1, r1, #0
add r1, r1, #4  
ld r5, push_val
jsrr r5

;push_val(3) pushes the value 3 onto the stack [4,3]
and r1, r1, #0
add r1, r1, #3
ld r5, push_val
jsrr r5

;push_val(2) pushes the value 2 onto the stack [4,3,2]
and r1, r1, #0
add r1, r1, #2
ld r5, push_val
jsrr r5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
ld r5, add_val
jsrr r5

ld r5, push_val
jsrr r5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
ld r5, add_val
jsrr r5

ld r5, push_val
jsrr r5 

halt 

;move the top value of the stack into r4
push_val .fill x3400
add_val .fill x3800
stack_addr .fill x4200
.end


.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

add r6, r6, #1
str r1, r6, #0

ret 

.end


.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack


ldr r1, r6, #0
add r6, r6, #-1
ldr r3, r6, #0
add r6, r6, #-1

add r4, r1, r3      ; (R4) <= R1 + R3 (2 popped values)
add r1, r4, #0
ret 


.end


.orig x4200 ;;data you might need
stack .blkw #10
.end
