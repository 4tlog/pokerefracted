HandleStarterMenuInput::
	xor a
	ld [wPartyMenuAnimMonEnabled], a
	ld [wListScrollOffset], a

HandleStarterMenuInput_::
	ldh a, [hDownArrowBlinkCount1]
	push af
	ldh a, [hDownArrowBlinkCount2]
	push af ; save existing values on stack
	xor a
	ldh [hDownArrowBlinkCount1], a ; blinking down arrow timing value 1
	ld a, 6
	ldh [hDownArrowBlinkCount2], a ; blinking down arrow timing value 2
.loop1
	call PrintStarterMenu
	xor a
	ld [wAnimCounter], a ; counter for pokemon shaking animation
	call PlaceMenuCursor
	call Delay3
.loop2
	push hl
	ld a, [wPartyMenuAnimMonEnabled]
	and a ; is it a pokemon selection menu?
	jr z, .getJoypadState
	farcall AnimatePartyMon ; shake mini sprite of selected pokemon
.getJoypadState
	pop hl
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a ; was a key pressed?
	jr nz, .keyPressed
	push hl
	hlcoord 18, 11 ; coordinates of blinking down arrow in some menus
	call HandleDownArrowBlinkTiming ; blink down arrow (if any)
	pop hl
	ld a, [wMenuJoypadPollCount]
	dec a
	jr z, .giveUpWaiting
	jr .loop2
.giveUpWaiting
; if a key wasn't pressed within the specified number of checks
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ret
.keyPressed
	xor a
	ld [wCheckFor180DegreeTurn], a
	ldh a, [hJoy5]
	ld b, a
	bit B_PAD_UP, a
	jr z, .checkIfDownPressed
.upPressed
	ld a, [wListPointer] ; selected menu item
	and a ; already at the top of the menu?
	jr z, .checkOtherKeys
.notAtTop
	dec a
	ld [wListPointer], a ; move selected menu item up one space
	ld a, [wCurrentMenuItem]
	and a ; at top of list
	jr z, .alreadyAtTop
	dec a
	ld [wCurrentMenuItem], a
	jr .checkOtherKeys
.alreadyAtTop
	ld a, [wListScrollOffset]
	dec a
	ld [wListScrollOffset], a
	jr .checkOtherKeys
.checkIfDownPressed
	bit B_PAD_DOWN, a
	jr z, .checkOtherKeys
.downPressed
	ld a, [wListCount] ; selected menu item
	ld c, a
	ld a, [wListPointer]
	cp c
	jr z, .checkOtherKeys
	inc a
	ld [wListPointer], a ; move selected menu item down one space

	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr z, .alreadyAtBottom
	inc a
	ld [wCurrentMenuItem], a
	jr .checkOtherKeys
.alreadyAtBottom
	ld a, [wListScrollOffset]
	inc a
	ld [wListScrollOffset], a
.checkOtherKeys
	ld a, [wMenuWatchedKeys]
	and b ; does the menu care about any of the pressed keys?
	jp z, .loop1
.checkIfAButtonOrBButtonPressed
	ldh a, [hJoy5]
	and PAD_A | PAD_B
	jr z, .skipPlayingSound
.AButtonOrBButtonPressed
	push hl
	ld hl, wMiscFlags
	bit BIT_NO_MENU_BUTTON_SOUND, [hl]
	pop hl
	jr nz, .skipPlayingSound
	ld a, SFX_PRESS_AB
	call PlaySound
.skipPlayingSound
	pop af
	ldh [hDownArrowBlinkCount2], a
	pop af
	ldh [hDownArrowBlinkCount1], a ; restore previous values
	xor a
	ld [wMenuWrappingEnabled], a ; disable menu wrapping
	ldh a, [hJoy5]
	ret
.noWrappingAround
	ld a, [wMenuWatchMovingOutOfBounds]
	and a ; should we return if the user tried to go past the top or bottom?
	jr z, .checkOtherKeys
	jr .checkIfAButtonOrBButtonPressed

PrintStarterMenu::
	hlcoord 1, 1
	ld b, 10
	ld c, 12
	call ClearScreenArea

	hlcoord 2, 1
  push hl
  ;xor a
  ld de, StartersText
  ld bc, 0
	ld a, [wListScrollOffset]
	ld b, a
.checkOffset
	xor a
	cp b
	jr z, .nameLoop
.offsetLoop
	ld a, [de]
	inc de
	cp "@"
	jr z, .offsetName
	;inc de
	jr .offsetLoop
.offsetName
	dec b
	jr .checkOffset
.nameLoop
  ld a, [de]
  cp "@"
  jr z, .nameDone
  ld [hli], a
  inc de
  jr .nameLoop
.nameDone
  inc de
  pop hl
  push bc
  ld a, [wMaxMenuItem]
  cp c
  jr z, .exitNameLoop
  ;push bc
  ld bc, SCREEN_WIDTH*2
  add hl, bc
  pop bc
  push hl
  inc c
  jr .nameLoop
.exitNameLoop
  pop hl
	hlcoord 5, 2
  push hl
  ;xor a
	ld de, StartersTypeText
  ld bc, 0

	ld a, [wListScrollOffset]
	ld b, a
.checkOffsetType
	xor a
	cp b
	jr z, .typeLoop
.offsetTypeLoop
	ld a, [de]
	inc de
	cp "@"
	jr z, .offsetType
	;inc de
	jr .offsetTypeLoop
.offsetType
	dec b
	jr .checkOffsetType

.typeLoop
  ld a, [de]
  cp "@"
  jr z, .typeDone
  ld [hli], a
  inc de
  jr .typeLoop
.typeDone
  inc de
  pop hl
  push bc
  ld a, [wMaxMenuItem]
  cp c
  jr z, .exitTypeLoop
  ;push bc
  ld bc, SCREEN_WIDTH*2
  add hl, bc
  pop bc
  push hl
  inc c
  jr .typeLoop
.exitTypeLoop
  pop hl
	ret

StartersText:
	db "CLEFFA@"
	db "CHARMANDER@"
	db "SQUIRTLE@"
  db "PICHU@"
  db "BULBASAUR@"
  db "SEEL@"
  db "MACHOP@"
  db "ZUBAT@"
  db "SANDSHREW@"
  db "PIDGEY@"
  db "DROWZEE@"
  db "CATERPIE@"
  db "GEODUDE@"
  db "HONEDGE@"
  db "HORSEA@"

StartersTypeText:
	db "NORMAL@"
	db "FIRE@"
	db "WATER@"
  db "ELECTRIC@"
  db "GRASS@"
  db "ICE@"
  db "FIGHTING@"
  db "POISON@"
  db "GROUND@"
  db "FLYING@"
  db "PSYCHIC@"
  db "BUG@"
  db "ROCK@"
  db "GHOST@"
  db "DRAGON@"

