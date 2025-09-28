; updates the types of a party mon (pointed to in hl) to the ones of the mon specified in [wPokedexNum]
SetPartyMonTypes:
	call GetPredefRegisters

	push hl
	;ld hl, wPokedexNum
	;dec [hl] ; wEvoOldSpecies instead maybe?
	ld a, [wEvoOldSpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld a, [wMonHType2]
	ld hl, wTypeBuffer
	cp [hl]							;checks if the pokemon evolving from is the 
	jr z, .originalType

	;ld hl, wPokedexNum
	;inc [hl]
	ld a, [wEvoNewSpecies]
	ld [wCurSpecies], a
	pop hl
	ld bc, wPartyMon1Type - wPartyMon1 ; $5
	add hl, bc
	ld a, [wPokedexNum]
	ld [wCurSpecies], a
	push hl
	call GetMonHeader
	pop hl
	ld a, [wMonHType1]
	ld [hli], a
	;ld a, [wMonHType2]
	ld a, [wTypeBuffer]
	ld [hl], a
	ret

.originalType
	;ld hl, wPokedexNum
	;inc [hl]
	ld a, [wEvoNewSpecies]
	ld [wCurSpecies], a
	pop hl
	ld bc, wPartyMon1Type - wPartyMon1 ; $5
	add hl, bc
	ld a, [wPokedexNum]
	ld [wCurSpecies], a
	push hl
	call GetMonHeader
	pop hl
	ld a, [wMonHType1]
	ld [hli], a
	ld a, [wMonHType2]	;does wTypeBuffer need to be set after this if pokemon evolution changes secondary type?
	ld [hl], a
	ret