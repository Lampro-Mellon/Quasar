# 1 "/home/users/scratch/komal.javed.data/Quasar/quasar2/testbench/asm/hello_world_iccm.s"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/users/scratch/komal.javed.data/Quasar/quasar2/testbench/asm/hello_world_iccm.s"
# 21 "/home/users/scratch/komal.javed.data/Quasar/quasar2/testbench/asm/hello_world_iccm.s"
# 1 "/home/users/scratch/komal.javed.data/Quasar/quasar2/design/snapshots/default/defines.h" 1
# 22 "/home/users/scratch/komal.javed.data/Quasar/quasar2/testbench/asm/hello_world_iccm.s" 2



    .set mfdc, 0x7f9
.extern printf_start, printf_end

.section .text
.global _start
_start:




    li x1, 0x5f555555
    csrw 0x7c0, x1
    li x3, 4
    csrw mfdc, x3
    li x3, 0xee000000
    la x4, printf_start
    la x5, printf_end


load:
    lw x6, 0 (x4)
    sw x6, 0 (x3)
    addi x4,x4,4
    addi x3,x3,4
    bltu x4, x5, load

    fence.i
    call printf


_finish:
    li x3, 0xd0580000
    addi x5, x0, 0xff
    sb x5, 0(x3)
    beq x0, x0, _finish
.rept 100
    nop
.endr

.data
hw_data:
.ascii "----------------------------------------\n"
.ascii "Hello World from SweRV EL2 ICCM  @WDC !!\n"
.ascii "----------------------------------------\n"
.byte 0

.section .data_text, "ax"



printf:
    li x3, 0xd0580000
    la x4, hw_data

loop:
   lb x5, 0(x4)
   sb x5, 0(x3)
   addi x4, x4, 1
   bnez x5, loop
   ret
.long 0,1,2,3,4
