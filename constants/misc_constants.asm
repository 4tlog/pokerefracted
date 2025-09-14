; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

;;;;;;;;;; shinpokerednote: gbcnote: new constants for managing GBC color palettes functionality
; DMGPalToGBCPal
DEF CONVERT_BGP  EQU 0
DEF CONVERT_OBP0 EQU 1
DEF CONVERT_OBP1 EQU 2

;DEF PAL_COLORS EQU 4
;DEF PAL_SIZE EQU PAL_COLORS * 2
DEF NUM_ACTIVE_PALS EQU 4

; input
DEF NO_INPUT EQU 0

; SGB command MLT_REQ can be used to detect SGB hardware
DEF JOYP_SGB_MLT_REQ EQU %00000011
