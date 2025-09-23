selectStarterFromList::
	ld hl, OakSelectStarterScreenText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 4
	ld [wMaxMenuItem], a
	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
  ld a, 14
  ld [wListCount], a
  ld a, 0
  ld [wListPointer], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	ld b, 10
	ld c, 12
	call TextBoxBorder
	call UpdateSprites
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call HandleStarterMenuInput
	bit B_PAD_B, a
	jr nz, .dontGo
  ld a, [wListPointer]
  ld e, a
  ld d, 0
  ld hl, StarterTable
  add hl, de
  ld a, [hl]
  ret
  
.dontGo
	ld hl, OaksLabOakDontGoAwayYetText2
	jp PrintText
  ret

OakSelectStarterScreenText:
	text_far _OakSelectStarterScreenText
	text_end


StarterTable:
  db CLEFFA
  db CHARMANDER
  db SQUIRTLE
  db PICHU
  db BULBASAUR
  db SEEL
  db MACHOP
  db ZUBAT
  db SANDSHREW
  db PIDGEY
  db MIME_JR
  db CATERPIE
  db GEODUDE
  db HONEDGE
  db HORSEA

;StartersText:
	;db "CLEFFA@"
	;db "CHARMANDER@"
	;db "SQUIRTLE@"
  ;db "PICHU@"
  ;db "BULBASAUR@"
  ;db "SEEL@"
  ;db "MACHOP@"
  ;db "ZUBAT@"
  ;db "SANDSHREW@"
  ;db "PIDGEY@"
  ;db "MIME_JR.@"
  ;db "CATERPIE@"
  ;db "GEODUDE@"
  ;db "HONEDGE@"
  ;db "HORSEA@"
;
;StartersTypeText:
	;db "NORMAL@"
	;db "FIRE@"
	;db "WATER@"
  ;db "ELECTRIC@"
  ;db "GRASS@"
  ;db "ICE@"
  ;db "FIGHTING@"
  ;db "POISON@"
  ;db "GROUND@"
  ;db "FLYING@"
  ;db "PSYCHIC@"
  ;db "BUG@"
  ;db "ROCK@"
  ;db "GHOST@"
  ;db "DRAGON@"

OaksLabOakDontGoAwayYetText2:
  text_far _OaksLabOakDontGoAwayYetText
  text_end


INCLUDE "home/starter_menu.asm"
