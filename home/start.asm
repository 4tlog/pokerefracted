_Start::
	cp BOOTUP_A_CGB
	jr z, .cgb
	xor a
	jr .ok
.cgb
	;ld a, FALSE
	ld a, 1 ; shinpokerednote: gbcnote: need to indicate we're on GBC
.ok
	;ld [wOnCGB], a
	ldh [hGBC], a
	jp Init
