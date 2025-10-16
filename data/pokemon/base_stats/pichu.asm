	db DEX_PICHU ; pokedex id

	db  20,  40,  15,  60, 35,	35 ; 205 base stats
	;   hp  atk  def  spd  spc	sdf

	db ELECTRIC, ELECTRIC ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBack

	db TELEPORT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   MEGA_KICK,    TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     DOUBLE_EDGE,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     PSYCHIC_M,    TELEPORT,     MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     BIDE,         METRONOME,    SKULL_BASH,   REST,         THUNDER_WAVE, \
	     PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   FLASH
	; end

	db BANK(AbraPicFront)
	assert BANK(AbraPicFront) == BANK(AbraPicBack)
