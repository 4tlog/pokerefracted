; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemPrices (see data/items/prices.asm)
; - TechnicalMachinePrices (see data/items/tm_prices.asm)
; - KeyItemFlags (see data/items/key_items.asm)
; - ItemUsePtrTable (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM       ; $00
	const MASTER_BALL   ; $01
	const ULTRA_BALL    ; $02
	const GREAT_BALL    ; $03
	const POKE_BALL     ; $04
	const TOWN_MAP      ; $05
	const BICYCLE       ; $06
	const SURFBOARD     ; $07
	const SAFARI_BALL   ; $08
	const POKEDEX       ; $09
	const MOON_STONE    ; $0A
	const ANTIDOTE      ; $0B
	const BURN_HEAL     ; $0C
	const ICE_HEAL      ; $0D
	const AWAKENING     ; $0E
	const PARLYZ_HEAL   ; $0F
	const FULL_RESTORE  ; $10
	const MAX_POTION    ; $11
	const HYPER_POTION  ; $12
	const SUPER_POTION  ; $13
	const POTION        ; $14
; badges use item IDs (see scripts/CeruleanBadgeHouse.asm)
	const BOULDERBADGE  ; $15
DEF SAFARI_BAIT EQU BOULDERBADGE ; overload
	const CASCADEBADGE  ; $16
DEF SAFARI_ROCK EQU CASCADEBADGE ; overload
	const THUNDERBADGE  ; $17
	const RAINBOWBADGE  ; $18
	const SOULBADGE     ; $19
	const MARSHBADGE    ; $1A
	const VOLCANOBADGE  ; $1B
	const EARTHBADGE    ; $1C
	const ESCAPE_ROPE   ; $1D
	const REPEL         ; $1E
	const OLD_AMBER     ; $1F
	;const FIRE_STONE    ; $20
	;const THUNDER_STONE ; $21
	;const WATER_STONE   ; $22
	const HP_UP         ; $20
	const PROTEIN       ; $21
	const IRON          ; $22
	const CARBOS        ; $23
	const CALCIUM       ; $24
	const ZINC
	const RARE_CANDY    ; $25
	const NORMAL_STONE	;	$26
	const FIRE_STONE    ; $27
	const WATER_STONE   ; $28
	const THUNDER_STONE ; $29
	const LEAF_STONE    ; $2A
	const ICE_STONE    	; $2B
	const FIGHT_STONE   ; #2C
	const POISON_STONE  ; $2D
	const GROUND_STONE  ; $2E
	const FLYING_STONE  ; $2F
	const PSYCHIC_STONE ; $30
	const BUG_STONE     ; $31
	const ROCK_STONE   	; #32
	const GHOST_STONE   ; $33
	const DRAGON_STONE  ; $34
	const DOME_FOSSIL   ; $35
	const HELIX_FOSSIL  ; $36
	const SECRET_KEY    ; $37
	;const ITEM_2C       ; $38 ; unused
	const BIKE_VOUCHER  ; $39
	const X_ACCURACY    ; $3A
	;const LEAF_STONE    ; $3B
	const CARD_KEY      ; $3B
	const NUGGET        ; $3C
	const ITEM_32       ; $3D ; unused
	const POKE_DOLL     ; $3E
	const FULL_HEAL     ; $3F
	const REVIVE        ; $40
	const MAX_REVIVE    ; $41
	const GUARD_SPEC    ; $42
	const SUPER_REPEL   ; $43
	const MAX_REPEL     ; $44
	const DIRE_HIT      ; $45
	const COIN          ; $46
	const FRESH_WATER   ; $47
	const SODA_POP      ; $48
	const LEMONADE      ; $49
	const S_S_TICKET    ; $4A
	const GOLD_TEETH    ; $4B
	const X_ATTACK      ; $4C
	const X_DEFEND      ; $4D
	const X_SPEED       ; $4E
	const X_SPECIAL     ; $4F
	const X_SP_DEF
	const COIN_CASE     ; $50
	const OAKS_PARCEL   ; $51
	const ITEMFINDER    ; $52
	const SILPH_SCOPE   ; $53
	const POKE_FLUTE    ; $54
	const LIFT_KEY      ; $55
	const EXP_ALL       ; $56
	const OLD_ROD       ; $57
	const GOOD_ROD      ; $58
	const SUPER_ROD     ; $59
	const PP_UP         ; $5A
	const ETHER         ; $5B
	const MAX_ETHER     ; $5C
	const ELIXER        ; $5D
	const MAX_ELIXER    ; $5E
DEF NUM_ITEMS EQU const_value - 1

; elevator floors use item IDs (see scripts/CeladonMartElevator.asm and scripts/SilphCoElevator.asm)
	const FLOOR_B2F     ; $5F
	const FLOOR_B1F     ; $60
	const FLOOR_1F      ; $61
	const FLOOR_2F      ; $62
	const FLOOR_3F      ; $63
	const FLOOR_4F      ; $64
	const FLOOR_5F      ; $65
	const FLOOR_6F      ; $66
	const FLOOR_7F      ; $67
	const FLOOR_8F      ; $68
	const FLOOR_9F      ; $69
	const FLOOR_10F     ; $6A
	const FLOOR_11F     ; $6B
	const FLOOR_B4F     ; $6C
DEF NUM_FLOORS EQU const_value - 1 - NUM_ITEMS

	const_next $C4

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
DEF NUM_TMS EQU 50

DEF __tmhm_value__ = NUM_TMS + 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $C4
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT          ; $C4
	add_hm FLY          ; $C5
	add_hm SURF         ; $C6
	add_hm STRENGTH     ; $C7
	add_hm FLASH        ; $C8
DEF NUM_HMS EQU const_value - HM01

DEF __tmhm_value__ = 1

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $C9
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF TM01 EQU const_value
	add_tm MEGA_PUNCH   ; $C9
	add_tm RAZOR_WIND   ; $CA
	add_tm SWORDS_DANCE ; $CB
	add_tm WHIRLWIND    ; $CC
	add_tm MEGA_KICK    ; $CD
	add_tm TOXIC        ; $CE
	add_tm HORN_DRILL   ; $CF
	add_tm BODY_SLAM    ; $D0
	add_tm TAKE_DOWN    ; $D1
	add_tm DOUBLE_EDGE  ; $D2
	add_tm BUBBLEBEAM   ; $D3
	add_tm WATER_GUN    ; $D4
	add_tm ICE_BEAM     ; $D5
	add_tm BLIZZARD     ; $D6
	add_tm HYPER_BEAM   ; $D7
	add_tm PAY_DAY      ; $D8
	add_tm SUBMISSION   ; $D9
	add_tm COUNTER      ; $DA
	add_tm SEISMIC_TOSS ; $DB
	add_tm RAGE         ; $DC
	add_tm MEGA_DRAIN   ; $DD
	add_tm SOLARBEAM    ; $DE
	add_tm DRAGON_RAGE  ; $DF
	add_tm THUNDERBOLT  ; $E0
	add_tm THUNDER      ; $E1
	add_tm EARTHQUAKE   ; $E2
	add_tm FISSURE      ; $E3
	add_tm DIG          ; $E4
	add_tm PSYCHIC_M    ; $E5
	add_tm TELEPORT     ; $E6
	add_tm MIMIC        ; $E7
	add_tm DOUBLE_TEAM  ; $E8
	add_tm REFLECT      ; $E9
	add_tm BIDE         ; $EA
	add_tm METRONOME    ; $EB
	add_tm SELFDESTRUCT ; $EC
	add_tm EGG_BOMB     ; $ED
	add_tm FIRE_BLAST   ; $EE
	add_tm SWIFT        ; $EF
	add_tm SKULL_BASH   ; $F0
	add_tm SOFTBOILED   ; $F1
	add_tm DREAM_EATER  ; $F2
	add_tm SKY_ATTACK   ; $F3
	add_tm REST         ; $F4
	add_tm THUNDER_WAVE ; $F5
	add_tm PSYWAVE      ; $F6
	add_tm EXPLOSION    ; $F7
	add_tm ROCK_SLIDE   ; $F8
	add_tm TRI_ATTACK   ; $F9
	add_tm SUBSTITUTE   ; $FA
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS

; 50 TMs + 5 HMs = 55 learnable TM/HM flags per Pokémon.
; These fit in 7 bytes, with one unused bit left over.
DEF __tmhm_value__ = NUM_TM_HM + 1
DEF UNUSED_TMNUM EQU __tmhm_value__

DEF MAX_HIDDEN_ITEMS EQU 112
DEF MAX_HIDDEN_COINS EQU 16
