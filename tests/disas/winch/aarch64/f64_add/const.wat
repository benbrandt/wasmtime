;;! target = "aarch64"
;;! test = "winch"

(module
    (func (result f64)
        (f64.const 1.1)
        (f64.const 2.2)
        (f64.add)
    )
)
;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       str     x28, [sp, #-0x10]!
;;       mov     x28, sp
;;       ldur    x16, [x0, #8]
;;       ldur    x16, [x16, #0x10]
;;       mov     x17, #0
;;       movk    x17, #0x10
;;       add     x16, x16, x17
;;       cmp     sp, x16
;;       b.lo    #0x88
;;   2c: mov     x9, x0
;;       sub     x28, x28, #0x10
;;       mov     sp, x28
;;       stur    x0, [x28, #8]
;;       stur    x1, [x28]
;;       mov     x16, #0x999a
;;       movk    x16, #0x9999, lsl #16
;;       movk    x16, #0x9999, lsl #32
;;       movk    x16, #0x4001, lsl #48
;;       fmov    d0, x16
;;       mov     x16, #0x999a
;;       movk    x16, #0x9999, lsl #16
;;       movk    x16, #0x9999, lsl #32
;;       movk    x16, #0x3ff1, lsl #48
;;       fmov    d1, x16
;;       fadd    d1, d1, d0
;;       fmov    d0, d1
;;       add     x28, x28, #0x10
;;       mov     sp, x28
;;       mov     sp, x28
;;       ldr     x28, [sp], #0x10
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   88: .byte   0x1f, 0xc1, 0x00, 0x00
