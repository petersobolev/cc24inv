;
; "Invitation to Chaos Constructions'2024" (24-25 August. St.Petersburg, Russia)
; 1k executable graphics for Multimatograf'2024
; 
; http://enlight.ru/roi
; frog@enlight.ru

            org $80010000
            
            li sp, $801fff00
            li k1, $1f800000            ; set to hardware base

            li a0, $0800002f            ; 640x480, PAL, interlaced
            jal InitGPU                 ; initialize the GPU
            nop

            
            la a0, list    
            jal SendList                ; send display list to GPU
            nop


loop
            j loop                     ; loop forever
            nop

            

include lib.inc                       ; some useful routines            

align 4

; display list

; header { size(hi byte), pointer to next element (other bytes. $ffffff if last) }
; packet { type (hi byte), ... }

list


; gradated 4 point polygon
poly4_g    
    db letter_c_1, letter_c_1>>8, letter_c_1>>16, $8   ; link to next list element, size of current element
    dw $38c4deeb    ; $38 - gradated 4p poly. CCBBGGRR (C - command, b,g,r - color0) $38c4deeb 
    dw $00000000    ; y0 x0
    dw $30a6c7de    ; color 1  $30a6c7de 
    dw $0000027f    ; y1 x1
    dw $30c4dEeb    ; color 2    $30c4dEeb
    dw $01e00000    ; y2 x2
    dw $30a6c7de    ; color 3 $30a6c7de 
    dw $01e0027f    ; y3 x3

letter_c_1
    db letter_c_1_cutout, letter_c_1_cutout>>8, letter_c_1_cutout>>16, $5   ; link to next list element, size of current element
    dw $28682c2c    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)
    dw $001800d0    ; y0 x0   208 24
    dw $00200101    ; y1 x1  257 32
    dw $006600b8    ; y3 x3 184 102
    dw $006f00e7    ; y2 x2 231 111

letter_c_1_cutout
    db letter_c_2, letter_c_2>>8, letter_c_2>>16, $5   ; link to next list element, size of current element
    dw $28b8d5e6    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)  $28b8d5e6
    dw $002600f3   ; y0 x0 243 38
    dw $00290102    ; y1 x1 258 41
    dw $006500df    ; y3 x3 223 101
    dw $006900f1    ; y2 x2 241 105

letter_c_2
    db letter_c_2_cutout, letter_c_2_cutout>>8, letter_c_2_cutout>>16, $5   ; link to next list element, size of current element
    dw $28682c2c    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)
    dw $002f012a    ; y0 x0   298 47
    dw $0037015b    ; y1 x1   347 55 
    dw $007d0112    ; y3 x3   274 125
    dw $00860141    ; y2 x2   321 134

letter_c_2_cutout
    db letter_c_3, letter_c_3>>8, letter_c_3>>16, $5   ; link to next list element, size of current element
    dw $28b8d5e6    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)
    dw $003d014d    ; y0 x0   333 61
    dw $0040015b    ; y1 x1   347 64
    dw $007c0138    ; y3 x3   312 124
    dw $007f0149    ; y2 x2   329 127

letter_c_3
    db letter_c_3_cutout1, letter_c_3_cutout1>>8, letter_c_3_cutout1>>16, $5   ; link to next list element, size of current element
    dw $28682c2c    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)
    dw $005001a4    ; y0 x0   420 80
    dw $005801d5    ; y1 x1   469 88
    dw $009e018d    ; y3 x3   397 158
    dw $00a801bc    ; y2 x2   444 168

letter_c_3_cutout1
    db letter_c_3_cutout2, letter_c_3_cutout2>>8, letter_c_3_cutout2>>16, $5   ; link to next list element, size of current element
    dw $28b8d5e6    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $005701a2 	; y0  x0 418 87 
	dw $005901ab 	; y1  x1 427 89 
	dw $00790196 	; y2  x2 406 121 
	dw $007a01a1 	; y3  x3 417 122


letter_c_3_cutout2
    db letter_c_4, letter_c_4>>8, letter_c_4>>16, $5   ; link to next list element, size of current element
    dw $28b0d1e7    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $007d01c1  ; y0  x0 449 125	 
	dw $007e01cc  ; y1  x1 460 126	 
	dw $009e01b7  ; y2  x2 439 158	 
	dw $00a101c4  ; y3  x3 452 161	


letter_c_4
    db letter_c_4_cutout1, letter_c_4_cutout1>>8, letter_c_4_cutout1>>16, $5   ; link to next list element, size of current element
    dw $28682c2c    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $006401fd  ; y0  x0 509 100	 
	dw $006c022e  ; y1  x1 558 108	 
	dw $00b301e4  ; y2  x2 484 179	 
	dw $00bd0214  ; y3  x3 532 189	



letter_c_4_cutout1
    db letter_c_4_cutout2, letter_c_4_cutout2>>8, letter_c_4_cutout2>>16, $5   ; link to next list element, size of current element
    dw $28aecfe7    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $00640204  ; y0  x0 516 100	 
	dw $006b0227  ; y1  x1 551 107	 
	dw $006c0201  ; y2  x2 513 108	 
	dw $00730224  ; y3  x3 548 115	

letter_c_4_cutout2
    db group1_1, group1_1>>8, group1_1>>16, $5   ; link to next list element, size of current element
    dw $28aecfe7    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $008901ee  ; y0  x0 494 137	 
	dw $008f020a  ; y1  x1 522 143	 
	dw $00b501df  ; y2  x2 480 178	 
	dw $00b901fd  ; y3  x3 509 185	


group1_1
    db group1_2, group1_2>>8, group1_2>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $00c8006d  ; y0  x0 109 200	 
	dw $00d00077  ; y1  x1 119 208	 
	dw $0100003c  ; y2  x2 60 256	 
	dw $01090045  ; y3  x3 69 265	

group1_2
    db group1_3, group1_3>>8, group1_3>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $010b0031  ; y0  x0 49 267	 
	dw $0115003c  ; y1  x1 60 277	 
	dw $01180026  ; y2  x2 38 280	 
	dw $0122002f  ; y3  x3 47 290	


group1_3
    db group2_1, group2_1>>8, group2_1>>16, $5   ; link to next list element, size of current element
    dw $283f65e4    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $00f7006d  ; y0  x0 109 247	 
	dw $00ff0076  ; y1  x1 118 255	 
	dw $015d0010  ; y2  x2 16 349	 
	dw $01640018  ; y3  x3 24 356	




group2_1
    db group2_2, group2_2>>8, group2_2>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $00f400ec  ; y0  x0 236 247	 
	dw $00fa0101  ; y1  x1 257 250	 
	dw $014e00cf  ; y2  x2 207 334	 
	dw $015400e3  ; y3  x3 227 340	

group2_2
    db group2_3, group2_3>>8, group2_3>>16, $5   ; link to next list element, size of current element
    dw $283f65e4    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $015000f4  ; y0  x0 244 336	 
	dw $01540109  ; y1  x1 265 340	 
	dw $016600ed  ; y2  x2 237 358	 
	dw $016c0101  ; y3  x3 257 364	

group2_3
    db group2_4, group2_4>>8, group2_4>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $017200e6  ; y0  x0 230 370	 
	dw $017400ed  ; y1  x1 237 372	 
	dw $01bf00cc  ; y2  x2 204 447	 
	dw $01c100d4  ; y3  x3 212 449	

group2_4
    db group3_1, group3_1>>8, group3_1>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $018500f7  ; y0  x0 247 389	 
	dw $018700fc  ; y1  x1 252 391	 
	dw $01b100e8  ; y2  x2 232 433	 
	dw $01b200ee  ; y3  x3 238 434	





group3_1
    db group3_2, group3_2>>8, group3_2>>16, $5   ; link to next list element, size of current element
    dw $203f65e4    ; $20 - flat 3p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $01310172  ; y0  x0 370 305	 
	dw $012601a6  ; y1  x1 422 294	 
	dw $01510199  ; y2  x2 409 337	

group3_2
    db group3_3, group3_3>>8, group3_3>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $0152017f  ; y0  x0 383 338	 
	dw $01500188  ; y1  x1 392 336	 
	dw $0190018a  ; y2  x2 394 400	 
	dw $018e0193  ; y3  x3 403 398	

group3_3
    db group4_1, group4_1>>8, group4_1>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $01620197  ; y0  x0 407 354	 
	dw $015e01a6  ; y1  x1 422 350	 
	dw $01a401a3  ; y2  x2 419 420	 
	dw $01a101b2  ; y3  x3 434 417	



group4_1
    db group4_2, group4_2>>8, group4_2>>16, $5   ; link to next list element, size of current element
    dw $283f65e4    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $01340218  ; y0  x0 536 308	 
	dw $0131021f  ; y1  x1 543 305	 
	dw $013e021c  ; y2  x2 540 318	 
	dw $013b0223  ; y3  x3 547 315	


group4_2
    db group4_3, group4_3>>8, group4_3>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $0144021f  ; y0  x0 543 324	 
	dw $01410226  ; y1  x1 550 321	 
	dw $01c1024d  ; y2  x2 589 449	 
	dw $01bf0255  ; y3  x3 597 447	

group4_3
    db prism, prism>>8, prism>>16, $5   ; link to next list element, size of current element
    dw $28000000    ; $28 - flat 4p poly. CCBBGGRR (C - command, b,g,r - color0)

	dw $0163020f  ; y0  x0 527 355	 
	dw $015d021e  ; y1  x1 542 349	 
	dw $017e021a  ; y2  x2 538 382	 
	dw $01790228  ; y3  x3 552 377	



prism
    db $ff, $ff, $ff, $4  ; link to next list element, size of current element (LAST ELEMENT)

    dw $203a9fed    ; $20 - polygon. CCBBGGRR (C - command, b,g,r - color)
    dw $005a0025  	;  37 90
    dw $008d0015    ;  21 141
    dw $010b0258   	;  600 267


