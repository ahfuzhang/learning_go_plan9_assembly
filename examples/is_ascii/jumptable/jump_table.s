<unlinkable>.SwitchTest STEXT nosplit size=81 args=0x8 locals=0x0 funcid=0x0 align=0x0
	0x0000 00000 (jump_table.go:3)	TEXT	<unlinkable>.SwitchTest(SB), NOSPLIT|NOFRAME|ABIInternal, $0-8
	0x0000 00000 (jump_table.go:3)	FUNCDATA	$0, gclocals·g2BeySu+wFnoycgXfElmcg==(SB)
	0x0000 00000 (jump_table.go:3)	FUNCDATA	$1, gclocals·g2BeySu+wFnoycgXfElmcg==(SB)
	0x0000 00000 (jump_table.go:3)	FUNCDATA	$5, <unlinkable>.SwitchTest.arginfo1(SB)
	0x0000 00000 (jump_table.go:3)	FUNCDATA	$6, <unlinkable>.SwitchTest.argliveinfo(SB)
	0x0000 00000 (jump_table.go:3)	PCDATA	$3, $1
	0x0000 00000 (jump_table.go:4)	LEAQ	-1(AX), CX
	0x0004 00004 (jump_table.go:4)	CMPQ	CX, $8
	0x0008 00008 (jump_table.go:4)	JHI	75
	0x000a 00010 (jump_table.go:4)	LEAQ	<unlinkable>.SwitchTest.jump3(SB), AX
	0x0011 00017 (jump_table.go:4)	JMP	(AX)(CX*8)
	0x0014 00020 (jump_table.go:6)	MOVL	$100, AX
	0x0019 00025 (jump_table.go:6)	RET
	0x001a 00026 (jump_table.go:8)	MOVL	$103, AX
	0x001f 00031 (jump_table.go:8)	NOP
	0x0020 00032 (jump_table.go:8)	RET
	0x0021 00033 (jump_table.go:10)	MOVL	$205, AX
	0x0026 00038 (jump_table.go:10)	RET
	0x0027 00039 (jump_table.go:12)	MOVL	$309, AX
	0x002c 00044 (jump_table.go:12)	RET
	0x002d 00045 (jump_table.go:14)	MOVL	$413, AX
	0x0032 00050 (jump_table.go:14)	RET
	0x0033 00051 (jump_table.go:16)	MOVL	$517, AX
	0x0038 00056 (jump_table.go:16)	RET
	0x0039 00057 (jump_table.go:18)	MOVL	$621, AX
	0x003e 00062 (jump_table.go:18)	RET
	0x003f 00063 (jump_table.go:20)	MOVL	$725, AX
	0x0044 00068 (jump_table.go:20)	RET
	0x0045 00069 (jump_table.go:22)	MOVL	$829, AX
	0x004a 00074 (jump_table.go:22)	RET
	0x004b 00075 (jump_table.go:24)	MOVL	$933, AX
	0x0050 00080 (jump_table.go:24)	RET
	0x0000 48 8d 48 ff 48 83 f9 08 77 41 48 8d 05 00 00 00  H.H.H...wAH.....
	0x0010 00 ff 24 c8 b8 64 00 00 00 c3 b8 67 00 00 00 90  ..$..d.....g....
	0x0020 c3 b8 cd 00 00 00 c3 b8 35 01 00 00 c3 b8 9d 01  ........5.......
	0x0030 00 00 c3 b8 05 02 00 00 c3 b8 6d 02 00 00 c3 b8  ..........m.....
	0x0040 d5 02 00 00 c3 b8 3d 03 00 00 c3 b8 a5 03 00 00  ......=.........
	0x0050 c3                                               .
	rel 13+4 t=R_PCREL <unlinkable>.SwitchTest.jump3+0
go:cuinfo.producer.<unlinkable> SDWARFCUINFO dupok size=0
	0x0000 72 65 67 61 62 69                                regabi
go:cuinfo.packagename.<unlinkable> SDWARFCUINFO dupok size=0
	0x0000 6a 75 6d 70 74 61 62 6c 65                       jumptable
gclocals·g2BeySu+wFnoycgXfElmcg== SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
<unlinkable>.SwitchTest.arginfo1 SRODATA static dupok size=3
	0x0000 00 08 ff                                         ...
<unlinkable>.SwitchTest.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
<unlinkable>.SwitchTest.jump3 SRODATA static size=72
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=R_ADDR <unlinkable>.SwitchTest+20
	rel 8+8 t=R_ADDR <unlinkable>.SwitchTest+26
	rel 16+8 t=R_ADDR <unlinkable>.SwitchTest+33
	rel 24+8 t=R_ADDR <unlinkable>.SwitchTest+39
	rel 32+8 t=R_ADDR <unlinkable>.SwitchTest+45
	rel 40+8 t=R_ADDR <unlinkable>.SwitchTest+51
	rel 48+8 t=R_ADDR <unlinkable>.SwitchTest+57
	rel 56+8 t=R_ADDR <unlinkable>.SwitchTest+63
	rel 64+8 t=R_ADDR <unlinkable>.SwitchTest+69
