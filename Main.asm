
; Hardware defines
include	"hardware.inc"

; ================================

; ================
; Global constants
; ================

sys_DMG			equ	0
sys_GBP			equ	1
sys_SGB			equ	2
sys_SGB2		equ	3
sys_GBC			equ	4
sys_GBA			equ	5

btnA			equ	0
btnB			equ	1
btnSelect		equ	2
btnStart		equ	3
btnRight		equ	4
btnLeft			equ	5
btnUp			equ	6
btnDown			equ	7

_A				equ	1<<1
_B				equ	1<<2
_Select			equ	1<<3
_Start			equ	1<<4
_Right			equ	1<<5
_Left			equ	1<<6
_Up				equ	1<<7
_Down			equ	1<<8

; ================================

section	"Variables",wram0[$c000]

MusicID:      		db
SFXID:              db
sys_btnPress:		db
sys_btnHold:		db

section "Zeropage",hram

OAM_DMA:			ds	16

; ================================

; =============
; Reset vectors
; =============
section "Reset $00",rom0[$00]
ResetGame::	jp	EntryPoint
	
section	"Reset $08",rom0[$08]
FillRAM::	jp	_FillRAM
	
section	"Reset $10",rom0[$10]

section	"Reset $18",rom0[$18]

section	"Reset $20",rom0[$20]

section	"Reset $28",rom0[$28]
	
section	"Reset $30",rom0[$30]

section	"Reset $38",rom0[$38]
GenericTrap::
    jr      @
	
; ==================
; Interrupt handlers
; ==================

section	"VBlank IRQ",rom0[$40]
IRQ_VBlank::	reti

section	"STAT IRQ",rom0[$48]
IRQ_Stat::	    reti

section	"Timer IRQ",rom0[$50]
IRQ_Timer::	    reti

section	"Serial IRQ",rom0[$58]
IRQ_Serial::	reti

section	"Joypad IRQ",rom0[$60]
IRQ_Joypad::	reti

; ===============
; System routines
; ===============

CheckInput:
	ld	a,P1F_5
	ld	[rP1],a
	ld	a,[rP1]
	ld	a,[rP1]
	cpl
	and	a,$f
	swap	a
	ld	b,a
	
	ld	a,P1F_4
	ld	[rP1],a
	ld	a,[rP1]
	ld	a,[rP1]
	ld	a,[rP1]
	ld	a,[rP1]
	ld	a,[rP1]
	ld	a,[rP1]
	cpl
	and	a,$f
	or	a,b
	ld	b,a
	
	ld	a,[sys_btnHold]
	xor	a,b
	and	a,b
	ld	[sys_btnPress],a
	ld	a,b
	ld	[sys_btnHold],a
	ld	a,P1F_5|P1F_4
	ld	[rP1],a
	ret

; ==========
; ROM header
; ==========

section	"ROM header",rom0[$100]

EntryPoint::
	nop
	jp	ProgramStart
NintendoLogo:   ds  48,0                ; Nintendo logo graphic (handled by post-linking tool)
ROMTitle:		db  "DSEQ DEMO      "   ; ROM title (15 bytes)
    ds  13,0    ; rest of header handled by post-linking tool
    
; =====================
; Start of program code
; =====================

ProgramStart::
	di
	ld	    sp,$e000
    
; init memory
	ld	    hl,$c000	; start of WRAM
	ld	    bc,$1ffe
	xor	    a
    call    _FillRAM
	
	ld	    bc,$7f80
	xor	    a
.loop
	ld	    [c],a
	inc	    c
	dec	    b
	jr	    nz,.loop
    
    ld      a,IEF_VBLANK
    ldh     [rIE],a
    ei
    
    ; ld a DSEQ_CMD_Init
    xor     a
    call    DSEQ_Command
    
MainLoop:
    call    CheckInput
    ld      a,[sys_btnPress]
    bit     btnRight,a
    jr      nz,.nextsong
    bit     btnLeft,a
    jr      nz,.prevsong
    bit     btnUp,a
    jr      nz,.nextsfx
    bit     btnDown,a
    jr      nz,.prevsfx
    bit     btnA,a
    jr      nz,.playsfx
    bit     btnB,a
    jr      nz,.togglemusic
    jr      .continue

.nextsfx
    ld      a,[SFXID]
    inc     a
    ld      [SFXID],a
    ld      c,a
    jr      .continue
.prevsfx
    ld      a,[SFXID]
    dec     a
    ld      [SFXID],a
    ld      c,a
    jr      .continue
.playsfx
    ld      a,[SFXID]
    ld      c,a
    ld      a,DSEQ_CMD_PlaySFX
    call    DSEQ_Command
    jr      .continue
    
.nextsong
    ld      a,[MusicID]
    inc     a
    jr      .doload
.prevsong
    ld      a,[MusicID]
    dec     a
.doload
    ld      [MusicID],a
    ld      c,a
    jr      .setmusic
    
.togglemusic
    ld      a,[wDSEQ_MusicID]
    cp      $ff
    jr      nz,.stop
    ld      a,[MusicID]
    ld      c,a
    jr      .setmusic
.stop
    ld      c,0
.setmusic
    ld      a,DSEQ_CMD_PlaySong
    call    DSEQ_Command

.continue
    halt
    call    DSEQ_Update
    jr MainLoop
    
; =============
; Misc routines
; =============
	
; Fill RAM with a value.
; INPUT:  a = value
;        hl = address
;        bc = size
_FillRAM::
	ld	e,a
.loop
	ld	[hl],e
	inc	hl
	dec	bc
	ld	a,b
	or	c
	jr	nz,.loop
	ret

; ================================

include "Audio/Driver.asm"