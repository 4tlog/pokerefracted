PaletteTablePointers:
    dw MonsterPalettes ; NORMAL
    dw MonsterPalettesFire   ; FIRE
    dw MonsterPalettesWater  ; WATER
    dw MonsterPalettesElectric ; ELECTRIC
    dw MonsterPalettesGrass  ; GRASS
    dw MonsterPalettesIce    ; ICE
    dw MonsterPalettesFighting ; FIGHTING
    dw MonsterPalettesPoison ; POISON
    dw MonsterPalettesGround ; GROUND
    dw MonsterPalettesFlying ; FLYING
    dw MonsterPalettesPsychic ; PSYCHIC
    dw MonsterPalettesBug    ; BUG
    dw MonsterPalettesRock   ; ROCK
    dw MonsterPalettesGhost  ; GHOST
    dw MonsterPalettesDragon ; DRAGON


TypeToIndexTable:
    ; $00 - $08: Physical
    db 0    ; NORMAL  -> 0
    db 6    ; FIGHTING -> 6
    db 9    ; FLYING   -> 9
    db 7    ; POISON   -> 7
    db 8    ; GROUND   -> 8
    db 12   ; ROCK     -> 12
    db $FF ; BIRD (unused) -> invalid
    db 11   ; BUG      -> 11
    db 13   ; GHOST    -> 13

    ; $09 - $13: UNUSED
    db $FF ; $09
    db $FF ; $0A
    db $FF ; $0B
    db $FF ; $0C
    db $FF ; $0D
    db $FF ; $0E
    db $FF ; $0F
    db $FF ; $10
    db $FF ; $11
    db $FF ; $12
    db $FF ; $13

    ; $14 - $1A: Special
    db 1    ; FIRE     -> 1
    db 2    ; WATER    -> 2
    db 4    ; GRASS    -> 4
    db 3    ; ELECTRIC -> 3
    db 10   ; PSYCHIC  -> 10
    db 5    ; ICE      -> 5
    db 14   ; DRAGON   -> 14