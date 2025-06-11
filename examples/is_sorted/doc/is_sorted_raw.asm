<unlinkable>.IsSorted2 STEXT nosplit size=235 args=0x18 locals=0x0 funcid=0x0 align=0x0
	0x0000 00000 (is_sorted.go:7)	TEXT	<unlinkable>.IsSorted2(SB), NOSPLIT|NOFRAME|ABIInternal, $0-24
	0x0000 00000 (is_sorted.go:7)	MOVQ	AX, <unlinkable>.a+8(FP)
	0x0005 00005 (is_sorted.go:7)	FUNCDATA	$0, gclocals·wgcWObbY2HYnK2SU/U22lA==(SB)
	0x0005 00005 (is_sorted.go:7)	FUNCDATA	$1, gclocals·J5F+7Qw7O7ve2QcWC7DpeQ==(SB)
	0x0005 00005 (is_sorted.go:7)	FUNCDATA	$5, <unlinkable>.IsSorted2.arginfo1(SB)
	0x0005 00005 (is_sorted.go:7)	FUNCDATA	$6, <unlinkable>.IsSorted2.argliveinfo(SB)
	0x0005 00005 (is_sorted.go:7)	PCDATA	$3, $1
	0x0005 00005 (is_sorted.go:8)	CMPQ	BX, $9  // len(a)>=9
	0x0009 00009 (is_sorted.go:8)	JLT	23
	0x000b 00011 (is_sorted.go:13)	LEAQ	-1(BX), DX
	0x000f 00015 (is_sorted.go:13)	ANDQ	$-8, DX
	0x0013 00019 (is_sorted.go:13)	XORL	SI, SI
	0x0015 00021 (is_sorted.go:16)	JMP	69
	0x0017 00023 (is_sorted.go:59)	XORL	CX, CX
	0x0019 00025 (is_sorted.go:59)	JMP	32
	0x001b 00027 (is_sorted.go:59)	INCQ	CX
	0x001e 00030 (is_sorted.go:59)	NOP
	0x0020 00032 (is_sorted.go:59)	CMPQ	CX, BX
	0x0023 00035 (is_sorted.go:59)	JGE	59
	0x0025 00037 (is_sorted.go:60)	TESTQ	CX, CX
	0x0028 00040 (is_sorted.go:60)	JLE	27
	0x002a 00042 (is_sorted.go:60)	MOVQ	(AX)(CX*8), DX
	0x002e 00046 (is_sorted.go:60)	MOVQ	-8(AX)(CX*8), SI
	0x0033 00051 (is_sorted.go:60)	CMPQ	SI, DX
	0x0036 00054 (is_sorted.go:60)	JLE	27
	0x0038 00056 (is_sorted.go:61)	XORL	AX, AX
	0x003a 00058 (is_sorted.go:61)	RET
	0x003b 00059 (is_sorted.go:64)	MOVL	$1, AX
	0x0040 00064 (is_sorted.go:64)	RET
	0x0041 00065 (is_sorted.go:16)	ADDQ	$8, SI
	0x0045 00069 (is_sorted.go:16)	CMPQ	SI, DX
	0x0048 00072 (is_sorted.go:16)	JGE	204
	0x004e 00078 (is_sorted.go:43)	MOVQ	(AX)(SI*8), DI
	0x0052 00082 (is_sorted.go:43)	MOVQ	8(AX)(SI*8), R8
	0x0057 00087 (is_sorted.go:43)	CMPQ	R8, DI
	0x005a 00090 (is_sorted.go:43)	JLT	201
	0x005c 00092 (is_sorted.go:44)	MOVQ	8(AX)(SI*8), DI
	0x0061 00097 (is_sorted.go:44)	MOVQ	16(AX)(SI*8), R8
	0x0066 00102 (is_sorted.go:44)	CMPQ	R8, DI
	0x0069 00105 (is_sorted.go:44)	JLT	201
	0x006b 00107 (is_sorted.go:45)	MOVQ	16(AX)(SI*8), DI
	0x0070 00112 (is_sorted.go:45)	MOVQ	24(AX)(SI*8), R8
	0x0075 00117 (is_sorted.go:45)	CMPQ	R8, DI
	0x0078 00120 (is_sorted.go:45)	JLT	201
	0x007a 00122 (is_sorted.go:46)	MOVQ	24(AX)(SI*8), DI
	0x007f 00127 (is_sorted.go:46)	MOVQ	32(AX)(SI*8), R8
	0x0084 00132 (is_sorted.go:46)	CMPQ	R8, DI
	0x0087 00135 (is_sorted.go:46)	JLT	201
	0x0089 00137 (is_sorted.go:47)	MOVQ	32(AX)(SI*8), DI
	0x008e 00142 (is_sorted.go:47)	MOVQ	40(AX)(SI*8), R8
	0x0093 00147 (is_sorted.go:47)	CMPQ	R8, DI
	0x0096 00150 (is_sorted.go:47)	JLT	201
	0x0098 00152 (is_sorted.go:48)	MOVQ	40(AX)(SI*8), DI
	0x009d 00157 (is_sorted.go:48)	MOVQ	48(AX)(SI*8), R8
	0x00a2 00162 (is_sorted.go:48)	CMPQ	R8, DI
	0x00a5 00165 (is_sorted.go:48)	JLT	201
	0x00a7 00167 (is_sorted.go:49)	MOVQ	48(AX)(SI*8), DI
	0x00ac 00172 (is_sorted.go:49)	MOVQ	56(AX)(SI*8), R8
	0x00b1 00177 (is_sorted.go:49)	CMPQ	R8, DI
	0x00b4 00180 (is_sorted.go:49)	JLT	201
	0x00b6 00182 (is_sorted.go:50)	MOVQ	56(AX)(SI*8), DI
	0x00bb 00187 (is_sorted.go:50)	MOVQ	64(AX)(SI*8), R8
	0x00c0 00192 (is_sorted.go:50)	CMPQ	R8, DI
	0x00c3 00195 (is_sorted.go:51)	JGE	65
	0x00c9 00201 (is_sorted.go:52)	XORL	AX, AX
	0x00cb 00203 (is_sorted.go:52)	RET
	0x00cc 00204 (is_sorted.go:57)	MOVQ	DX, SI
	0x00cf 00207 (is_sorted.go:57)	SUBQ	CX, DX
	0x00d2 00210 (is_sorted.go:57)	MOVQ	SI, CX
	0x00d5 00213 (is_sorted.go:57)	SHLQ	$3, SI
	0x00d9 00217 (is_sorted.go:57)	SARQ	$63, DX
	0x00dd 00221 (is_sorted.go:57)	ANDQ	SI, DX
	0x00e0 00224 (is_sorted.go:57)	ADDQ	DX, AX
	0x00e3 00227 (is_sorted.go:57)	SUBQ	CX, BX
	0x00e6 00230 (is_sorted.go:57)	JMP	23
	0x0000 48 89 44 24 08 48 83 fb 09 7c 0c 48 8d 53 ff 48  H.D$.H...|.H.S.H
	0x0010 83 e2 f8 31 f6 eb 2e 31 c9 eb 05 48 ff c1 66 90  ...1...1...H..f.
	0x0020 48 39 d9 7d 16 48 85 c9 7e f1 48 8b 14 c8 48 8b  H9.}.H..~.H...H.
	0x0030 74 c8 f8 48 39 d6 7e e3 31 c0 c3 b8 01 00 00 00  t..H9.~.1.......
	0x0040 c3 48 83 c6 08 48 39 d6 0f 8d 7e 00 00 00 48 8b  .H...H9...~...H.
	0x0050 3c f0 4c 8b 44 f0 08 49 39 f8 7c 6d 48 8b 7c f0  <.L.D..I9.|mH.|.
	0x0060 08 4c 8b 44 f0 10 49 39 f8 7c 5e 48 8b 7c f0 10  .L.D..I9.|^H.|..
	0x0070 4c 8b 44 f0 18 49 39 f8 7c 4f 48 8b 7c f0 18 4c  L.D..I9.|OH.|..L
	0x0080 8b 44 f0 20 49 39 f8 7c 40 48 8b 7c f0 20 4c 8b  .D. I9.|@H.|. L.
	0x0090 44 f0 28 49 39 f8 7c 31 48 8b 7c f0 28 4c 8b 44  D.(I9.|1H.|.(L.D
	0x00a0 f0 30 49 39 f8 7c 22 48 8b 7c f0 30 4c 8b 44 f0  .0I9.|"H.|.0L.D.
	0x00b0 38 49 39 f8 7c 13 48 8b 7c f0 38 4c 8b 44 f0 40  8I9.|.H.|.8L.D.@
	0x00c0 49 39 f8 0f 8d 78 ff ff ff 31 c0 c3 48 89 d6 48  I9...x...1..H..H
	0x00d0 29 ca 48 89 f1 48 c1 e6 03 48 c1 fa 3f 48 21 f2  ).H..H...H..?H!.
	0x00e0 48 01 d0 48 29 cb e9 2c ff ff ff                 H..H)..,...
go:cuinfo.producer.<unlinkable> SDWARFCUINFO dupok size=0
	0x0000 72 65 67 61 62 69                                regabi
go:cuinfo.packagename.<unlinkable> SDWARFCUINFO dupok size=0
	0x0000 69 73 5f 73 6f 72 74 65 64                       is_sorted
runtime.memequal64·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=R_ADDR runtime.memequal64+0
runtime.gcbits.0100000000000000 SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
type:.namedata.*[8]int64- SRODATA dupok size=11
	0x0000 00 09 2a 5b 38 5d 69 6e 74 36 34                 ..*[8]int64
type:.eqfunc64 SRODATA dupok size=16
	0x0000 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  ........@.......
	rel 0+8 t=R_ADDR runtime.memequal_varlen+0
runtime.gcbits. SRODATA dupok size=0
type:[8]int64 SRODATA dupok size=72
	0x0000 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  @...............
	0x0010 df 74 c3 e5 0a 08 08 11 00 00 00 00 00 00 00 00  .t..............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 08 00 00 00 00 00 00 00                          ........
	rel 24+8 t=R_ADDR type:.eqfunc64+0
	rel 32+8 t=R_ADDR runtime.gcbits.+0
	rel 40+4 t=R_ADDROFF type:.namedata.*[8]int64-+0
	rel 44+4 t=RelocType(-32763) type:*[8]int64+0
	rel 48+8 t=R_ADDR type:int64+0
	rel 56+8 t=R_ADDR type:[]int64+0
type:*[8]int64 SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 b4 33 64 b1 08 08 08 36 00 00 00 00 00 00 00 00  .3d....6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=R_ADDR runtime.memequal64·f+0
	rel 32+8 t=R_ADDR runtime.gcbits.0100000000000000+0
	rel 40+4 t=R_ADDROFF type:.namedata.*[8]int64-+0
	rel 48+8 t=R_ADDR type:[8]int64+0
gclocals·wgcWObbY2HYnK2SU/U22lA== SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals·J5F+7Qw7O7ve2QcWC7DpeQ== SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
<unlinkable>.IsSorted2.arginfo1 SRODATA static dupok size=9
	0x0000 fe 00 08 08 08 10 08 fd ff                       .........
<unlinkable>.IsSorted2.argliveinfo SRODATA static dupok size=2
	0x0000 00 00                                            ..
