; ================================================================
; DSEQ (Mario's Picross sound driver disassembly by DevEd
; ================================================================

DSEQ_Optimize           = 0 ; Set to 1 to enable optimizations

DSEQ_CMD_Init           = 0
DSEQ_CMD_PlaySong       = 1
DSEQ_CMD_PlaySFX        = 2
DSEQ_CMD_BuildSGBPacket = 3
DSEQ_CMD_StopMusic      = 4
DSEQ_CMD_StopSFX        = 5
DSEQ_CMD_GetMusicID     = 6
DSEQ_CMD_GetSFXID       = 7

DSEQ_Flag_SFX_CH1       = 0
DSEQ_Flag_SFX_CH2       = 1
DSEQ_Flag_SFX_CH3       = 2
DSEQ_Flag_SFX_CH4       = 3
DSEQ_Flag_Mus_CH1       = 4
DSEQ_Flag_Mus_CH2       = 5
DSEQ_Flag_Mus_CH3       = 6
DSEQ_Flag_Mus_CH4       = 7

dstr:   macro
        db  \1,0
        endm

; ================================================================
; Command constants + macros

PAN_NONE    equ 0
PAN_RIGHT   equ 1
PAN_LEFT    equ 2
PAN_CENTER  equ 3

PULSE_12    equ 0
PULSE_25    equ 1
PULSE_50    equ 2
PULSE_75    equ 3

C_          equ 0
C#          equ 1
D_          equ 2
D#          equ 3
E_          equ 4
F_          equ 5
F#          equ 6
G_          equ 7
G#          equ 8
A_          equ 9
A#          equ 10
B_          equ 11
hold        equ 12
rest        equ 13

; USAGE: note note
note:       macro
    db      \1<<4 | \2
    endm

; USAGE: octave octave
octave:     macro
    db      $e0 | \1
    endm

; USAGE: octave_up
octave_up:  macro
    db      $e9
    endm

; USAGE: octave_down
octave_down:    macro
    db      $ea
    endm

; USAGE: sound_jump label
sound_jump:     macro
    db      $ee
    dw      \1
    endm

; USAGE: sound_ret
sound_ret:  macro
    db      $ef
    endm

; NOTE: Expects 3 operands but only 2 are used
; USAGE: pulse attack,hold,delay
pulse:      macro
    db      $f0,\1 | \2<<4,\3,0
    endm
    
; NOTE: Expects 3 operands but only 1 is used
; USAGE: wave wave
wave:       macro
    db      $f0,\1,0,0
    endm

; USAGE: loopcount loopcount
loopcount:  macro
    db      $f1,\1
    endm
    
; USAGE: sound_loop
sound_loop: macro
    db      $f2
    endm
    
; USAGE: pitch_offset offset
pitch_offset: macro
    db      $f4,\1
    endm
    
; USAGE: vibrato delay,speed,depth
vibrato:    macro
    db      $f5,\1,\2,\3
    endm
    
; USAGE: pitch_offset_2 offset
pitch_offset_2: macro
    db      $f6,\1
    endm

; USAGE: volume volume
volume:     macro
    db      $f7,\1
    endm
    
; USAGE: tempo tempo
tempo:      macro
    db      $f9,\1
    endm

; USAGE: notetype release_volume,release_delay
notetype:   macro
    db      $fa,\1 | \2<<4
    endm

; USAGE: panning initial,release
panning:    macro
    db      $fb,\1 | \2<<4
    endm

; USAGE: noise noise
noise:      macro
    db      $fc,\1
    endm

; USAGE: sound_call label
sound_call: macro
    db      $fe
    dw      \1
    endm

; ================================================================

SECTION "DSEQ RAM",WRAMX[$DD00]
wDSEQ_MusicID:          db
wDSEQ_SFXID:            db
wDSEQ_CurrentChannel:   dw
wDSEQ_ChannelFlags:     db ; bits 0-3 = SFX,bits 4-7 = music
wDSEQ_Unk1:             db
wDSEQ_Unk2:             db
wDSEQ_Unk3:             db
wDSEQ_Unk4:             ds  4
wDSEQ_Unk5:             db
wDSEQ_Unk6:             db
wDSEQ_SGBPacketBuffer:  ds  5
wDSEQ_SGBPacketBuffer2: ds  13

wDSEQ_SFXPointers:      ds  8
wDSEQ_MusicPointers:    ds  8
wDSEQ_Octaves:          ds  16
wDSEQ_TrackTimers:      ds  16
wDSEQ_ReleaseFlags1:    ds  16
wDSEQ_ReleaseFlags2:    ds  16
wDSEQ_NoteTimes1:       ds  16
wDSEQ_NoteTimes2:       ds  16
wDSEQ_StereoFlags:      ds  16
wDSEQ_VolumeLevels:     ds  16
wDSEQ_SoundTypes:       ds  16
wDSEQ_PulseDelays:      ds  16
wDSEQ_Frequency:        ds  16
wDSEQ_Tempo:            ds  16
wDSEQ_VibratoDelays:    ds  16
wDSEQ_VibratoDepths:    ds  16
wDSEQ_PitchOffsets:     ds  16
wDSEQ_LoopCounts:       ds  16
wDSEQ_LoopPointers:     ds  16
wDSEQ_ReturnPointers:   ds  16

; ================================================================

SECTION "DSEQ - Stub routines",romx[$4000]
DSEQ_Command:
    jp _DSEQ_Command

DSEQ_Update:
    jp _DSEQ_Update

; ================================================================

section "DSEQ - Thumbprint",romx,align[4]
if !DSEQ_Optimize
DSEQ_Driver:    dstr    "DSEQ"
DSEQ_Version:   db      1
DSEQ_Copyright: dstr    "APE (C) mcmxciv by Toshiyuki Ueno"
DSEQ_Contact:   dstr    "pcs26448@asciinet.or.jp" ; good luck using this, ASCIInet shut down in 1997
else
DSEQ_Driver:    dstr    "DSEQ-Opt"
DSEQ_Version:   db      2
DSEQ_Copyright: dstr    "APE (C) mcmxciv by Toshiyuki Ueno, optimized mmxxi by DevEd"
DSEQ_Contact:   dstr    "deved8@gmail.com"
endc

; ================================================================

section "DSEQ - Command table",romx,align[7]
DSEQ_CommandTable:
    dw      DSEQ_Init
    dw      DSEQ_PlaySong
    dw      DSEQ_PlaySFX
    dw      DSEQ_BuildSGBPacket
    dw      DSEQ_StopMusic
    dw      DSEQ_StopSFX
    dw      DSEQ_GetMusicID
    dw      DSEQ_GetSFXID
    
DSEQ_SoundCommandTable1:
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_SetOctave
    dw      DSEQ_CMD_OctaveUp
    dw      DSEQ_CMD_OctaveDown
    dw      DSEQ_CMD_Skip ; unused
    dw      DSEQ_CMD_Skip ; unused
    dw      DSEQ_CMD_UnknownED
    dw      DSEQ_CMD_Jump
    dw      DSEQ_CMD_Ret

DSEQ_SoundCommandTable2:
    dw      DSEQ_CMD_PulseWave
    dw      DSEQ_CMD_LoopCount
    dw      DSEQ_CMD_Loop
    dw      DSEQ_CMD_Skip ; unused
    dw      DSEQ_CMD_PitchOffset
    dw      DSEQ_CMD_Vibrato
    dw      DSEQ_CMD_PitchOffset2
    dw      DSEQ_CMD_Volume
    dw      DSEQ_CMD_Skip ; unused
    dw      DSEQ_CMD_Tempo
    dw      DSEQ_CMD_NoteType
    dw      DSEQ_CMD_Panning
    dw      DSEQ_CMD_Noise
    dw      DSEQ_CMD_Skip ; unused
    dw      DSEQ_CMD_Call
    dw      DSEQ_CMD_Skip ; unused

; ================================================================

section "DSEQ - Frequency tables",romx,align[8]
DSEQ_FreqTable_Entry0:  ; unused
;            B-0
    dw      $386
DSEQ_FreqTable:         ; base note frequencies
;            C-1  C#1  D-1  D#1  E-1  F-1  F#1  G-1  G#1  A-1  A#1  B-1  C-2
    dw      $000,$072,$0df,$145,$1a6,$201,$257,$2a9,$2f5,$33e,$382,$3c3,$07b
DSEQ_FreqOffsets:       ; frequency offsets for "imperfect pitch" mode + vibrato
    dw      $73,$6E,$67,$62,$5C,$57,$53,$4D,$4A,$45,$42,$3E

    
; ================================================================

; Data from 4134 to 4137 (4 bytes)
DSEQ_NRx3Table:         db  low(rAUD1LOW), low(rAUD2LOW),  low(rAUD3LOW),low(rAUD4POLY) ; frequency registers
DSEQ_NRx1Table:         db  low(rAUD1LEN), low(rAUD2LEN),             -1,            -1 ; pulse width registers (last two bytes are unused)
DSEQ_NRx2Table:         db  low(rAUD1ENV), low(rAUD2ENV),low(rAUD3LEVEL), low(rAUD4ENV) ; volume level registers
DSEQ_WaveVolTable:      db $00,$06,$04,$02 ; 0%, 25%, 50%, 100%
DSEQ_StereoMultTable:   db $EE,$DD,$BB,$77 ; CH4, CH3, CH2, CH1
DSEQ_StereoTable:       db $00,$01,$10,$11 ; mute, right, left, left+right

DSEQ_Unk414C_:          db $01,$02,$03,$04,$06,$08,$09,$0C,$10,$12,$18,$20,$24,$30,$40,$48

; ================================================================

DSEQ_WavePointers:
    dw      DSEQ_Wave0
    dw      DSEQ_Wave1
    dw      DSEQ_Wave2
    dw      DSEQ_Wave3
    dw      DSEQ_Wave4
    dw      DSEQ_Wave5
    dw      DSEQ_Wave6
    dw      DSEQ_Wave7
    dw      DSEQ_Wave8
    dw      DSEQ_Wave9
    dw      DSEQ_WaveA
    dw      DSEQ_WaveB
    dw      DSEQ_WaveC
    dw      DSEQ_WaveD

DSEQ_Wave0:     db $87,$89,$AB,$CD,$EE,$ED,$55,$55,$55,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; lead 1
DSEQ_Wave1:     db $00,$00,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 12.5% pulse
DSEQ_Wave2:     db $FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; 25% pulse
DSEQ_Wave3:     db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00  ; 50% pulse
DSEQ_Wave4:     db $00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF  ; 75% pulse
DSEQ_Wave5:     db $FF,$EE,$DD,$CC,$BB,$AA,$99,$88,$77,$66,$55,$44,$33,$22,$11,$00  ; sawtooth
DSEQ_Wave6:     db $FD,$98,$00,$03,$FF,$04,$11,$17,$23,$34,$55,$68,$AC,$DE,$FE,$DC  ; bass 1
DSEQ_Wave7:     db $03,$25,$47,$69,$8B,$AD,$CF,$EC,$EF,$CD,$AB,$89,$67,$45,$23,$01  ; buzz triangle 1
DSEQ_Wave8:     db $04,$26,$48,$6A,$8C,$AE,$CA,$EC,$EA,$CE,$AC,$8A,$68,$46,$24,$02  ; buzz triangle 2
DSEQ_Wave9:     db $05,$27,$49,$6B,$8D,$AF,$C9,$EB,$E9,$CF,$AD,$8B,$69,$47,$25,$03  ; buzz triangle 3
DSEQ_WaveA:     db $06,$28,$4A,$6C,$8E,$A6,$C8,$EA,$E8,$C6,$AE,$8C,$6A,$48,$26,$04  ; buzz triangle 4
DSEQ_WaveB:     db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$F7,$F6,$F5,$F4,$F3,$F2,$F1,$F0  ; buzz sawtooth 1
DSEQ_WaveC:     db $00,$01,$02,$03,$04,$05,$06,$07,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF  ; buzz sawtooth 2
DSEQ_WaveD:     db $11,$67,$77,$77,$77,$77,$77,$43,$34,$56,$78,$9A,$AA,$AA,$AA,$AF  ; bass 2

; ================================================================

_DSEQ_Command:
    ld      hl,DSEQ_CommandTable
    push    af
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    pop     af
    jp      hl

; ================================================================

DSEQ_Init:
    ; initialize registers
    ld      hl,.inittable
:   ld      a,[hl+]
    or      a
    jr      z,.done
    ld      c,a
    ld      a,[hl+]
    ld      [c],a
    jr      :-
.done
    ; initialize memory
    ld      b,12
    ld      hl,wDSEQ_CurrentChannel
    xor     a
:   ld      [hl+],a
    dec     b
    jr      nz,:-
    call    DSEQ_LoadWave
    ld      a,-1
    ld      [wDSEQ_MusicID],a
    ld      [wDSEQ_SFXID],a
    ret

.inittable
    db      low(rAUDENA),   $80
    db      low(rAUDVOL),   $77
    db      low(rAUDTERM),  $FF
    db      low(rAUD1SWEEP),$08
    db      low(rAUD1ENV),$00
    db      low(rAUD2ENV),$00
    db      low(rAUD4ENV),$00
    db      low(rAUD1HIGH), $80
    db      low(rAUD2HIGH), $80
    db      low(rAUD4GO),   $80
    db      low(rAUD3LEVEL),$00
    db      low(rAUD1LEN),  $00
    db      low(rAUD2LEN),  $00
    db      low(rAUD3LEN),  $00
    db      low(rAUD4LEN),  $00
    db      0

DSEQ_PlaySong:
    ld      a,c
    ld      [wDSEQ_MusicID],a
    ld      de,DSEQ_MusicPointers
    cp      -1
    jr      nz,.notblank
    ld      de,DSEQ_DummySong
    xor     a
    ld      [wDSEQ_Unk6],a
.notblank
    ld      hl,wDSEQ_MusicPointers
    call    DSEQ_Unk4899_
    ld      hl,wDSEQ_ChannelFlags
    ld      a,$F0
    or      [hl]
    ld      [hl],a
    ld      hl,DSEQ_Unk436B
DSEQ_Unk42C7_:
    ld      c,[hl]
    inc     hl
    ld      a,[hl]
    inc     hl
    or      a
    ret     z
    ld      b,a
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
    inc     hl
    push    hl
    ld      hl,8
    add     hl,bc
    call    DSEQ_Unk488D_
    pop     hl
    jr      DSEQ_Unk42C7_

; ================================================================

DSEQ_PlaySFX:
    push    bc
    ld      hl,wDSEQ_CurrentChannel
    xor     a
    ld      [hl],a
    ld      a,[wDSEQ_ChannelFlags]
    if      DSEQ_Optimize
        ld      bc,$410
        ld      d,1
    else
        ld      c,$10
        ld      d,$01
        ld      b,$04
    endc
DSEQ_Unk42EC_:
    push    af
    ld      a,d
    ld      [wDSEQ_Unk2],a
    ld      a,[wDSEQ_ChannelFlags]
    and     c
    and     $f
    ld      [wDSEQ_Unk1],a
    rlc     c
    rlc     d
    pop     af
    rrca
    jr      nc,DSEQ_Unk430B_
    push    af
    push    bc
    push    hl
    call    DSEQ_Unk44FC_
    pop     hl
    pop     bc
    pop     af
DSEQ_Unk430B_:
    inc     [hl]
    dec     b
    jr      nz,DSEQ_Unk42EC_
    pop     bc
    ld      a,c
    ld      [wDSEQ_SFXID],a
    ld      de,DSEQ_SFXPointers
    cp      -1
    jr      nz,DSEQ_Unk4322_
    ld      de,DSEQ_DummySong
    xor     a
    ld      [wDSEQ_Unk5],a
DSEQ_Unk4322_:
    ld      hl,wDSEQ_SFXPointers
    call    DSEQ_Unk4899_
    ld      a,c
    cp      -1
    jr      z,DSEQ_Unk4352_
    ld      a,[wDSEQ_ChannelFlags]
    or      $f
    ld      d,a
    ld      e,$FE
    ld      b,$04
    ld      hl,wDSEQ_SFXPointers
DSEQ_Unk433A_:
    push    hl
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      a,[hl]
    cp      $EF
    jr      nz,DSEQ_Unk4346_
    ld      a,d
    and     e
    ld      d,a
DSEQ_Unk4346_:
    rlc     e
    pop     hl
    inc     hl
    inc     hl
    dec     b
    jr      nz,DSEQ_Unk433A_
    ld      a,d
    ld      [wDSEQ_ChannelFlags],a
DSEQ_Unk4352_:
    ld      hl,DSEQ_Unk436B
DSEQ_Unk4355_:
    ld      c,[hl]
    inc     hl
    ld      a,[hl]
    inc     hl
    or      a
    ret     z
    ld      b,a
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
    inc     hl
    push    hl
    ld      hl,0
    add     hl,bc
    call    DSEQ_Unk488D_
    pop     hl
    jr      DSEQ_Unk4355_

DSEQ_Unk436B:
    db  $40,$DD,$00,$00
    db  $70,$DD,$00,$00
    db  $80,$DD,$00,$00
    db  $30,$DD,$00,$00
    db  $C0,$DD,$00,$00
    db  $B0,$DD,$00,$00
    db  $F0,$DD,$00,$00
    db  $00,$DE,$00,$00
    db  $10,$DE,$00,$00
    db  $20,$DE,$00,$00
    db  $30,$DE,$00,$00
    db  $40,$DE,$00,$00
    db  $E0,$DD,$00,$90
    db  $50,$DD,$00,$00
    db  $A0,$DD,$0F,$FF
    db  $00,$00

; ================================================================

DSEQ_BuildSGBPacket:
    ld      hl,wDSEQ_SGBPacketBuffer
    ld      [hl],$41
    inc     hl
    ld      [hl],b
    inc     hl
    ld      [hl],c
    inc     hl
    ld      [hl],d
    inc     hl
    ld      [hl],e
    ret

; ================================================================

DSEQ_StopMusic:
    ld      c,$FF
    jp      DSEQ_PlaySong

; ================================================================

DSEQ_StopSFX:
    ld      c,$FF
    jp      DSEQ_PlaySFX

; ================================================================

DSEQ_GetMusicID:
    ld      a,[wDSEQ_MusicID]
    ret

; ================================================================

DSEQ_GetSFXID:
    ld      a,[wDSEQ_SFXID]
    ret

; ================================================================

DSEQ_DummyCommand:
    ret

; ================================================================

_DSEQ_Update:
    ld      a,[wDSEQ_SGBPacketBuffer]
    inc     a
    jr      z,.skipsgbinit
    call    DSEQ_InitSGBSound
    ld      a,$FF
    ld      [wDSEQ_SGBPacketBuffer],a
.skipsgbinit
    ld      hl,wDSEQ_CurrentChannel
    xor     a
    ld      [hl],a
    ld      a,[wDSEQ_ChannelFlags]
    if  DSEQ_Optimize
        ld      bc,$810
        ld      d,1
    else
        ld      c,$10
        ld      d,1
        ld      b,8
    endc
.loop
    push    af
    xor     a
    ld      [wDSEQ_Unk3],a
    ld      a,d
    ld      [wDSEQ_Unk2],a
    ld      a,[wDSEQ_ChannelFlags]
    and     c
    and     $0F
    ld      [wDSEQ_Unk1],a
    rlc     c
    rlc     d
    pop     af
    rrca
    jr      nc,.skip
    push    af
    push    bc
    push    hl
    call    DSEQ_UpdateChannel
    pop     hl
    pop     bc
    pop     af
.skip
    inc     [hl]
    dec     b
    jr      nz,.loop
    ret

DSEQ_UpdateChannel:
    ld      a,[wDSEQ_CurrentChannel]
    ld      c,a
    ld      hl,wDSEQ_TrackTimers
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    or      a
    jp      nz,DSEQ_Unk465C_
    ld      hl,wDSEQ_SFXPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
DSEQ_Unk4427_:
    ld      a,[de]
    and     $f0
    cp      $f0
    jr      nz,DSEQ_Unk443B_
    ld      a,[de]
    and     $f
    ld      hl,DSEQ_SoundCommandTable2
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    jp      hl

DSEQ_Unk443B_:
    cp      $E0
    jr      nz,DSEQ_Unk444C_
    ld      a,[de]
    and     $0F
    ld      hl,DSEQ_SoundCommandTable1
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    jp      hl

DSEQ_Unk444C_:
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[de]
    and     $F0
    cp      $D0
    jr      nz,DSEQ_Unk445E_
    ld      a,$FF
    jr      DSEQ_Unk446D_

DSEQ_Unk445E_:
    push    hl
    ld      a,[hl]
    ld      l,$0C
    call    DSEQ_Unk4871_
    ld      l,a
    ld      a,[de]
    and     $f0
    swap    a
    add     l
    pop     hl
DSEQ_Unk446D_:
    inc     hl
    ld      [hl],a
    ld      b,0
DSEQ_Unk4471_:
    ld      a,[de]
    and     $f
    ld      hl,DSEQ_Unk414C_
    add     l
    ld      l,a
    ld      a,[hl]
    add     b
    ld      b,a
    inc     de
    ld      a,[de]
    and     $f0
    cp      $c0
    jr      z,DSEQ_Unk4471_
    ld      hl,wDSEQ_TrackTimers
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      [hl],b
    ld      hl,wDSEQ_ReleaseFlags1
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    or      a
    jr      nz,DSEQ_Unk449B_
    ld      b,0
    jr      DSEQ_Unk44B3_

DSEQ_Unk449B_:
    ld      l,b
    ld      h,0
    call    DSEQ_Unk485A_
    srl     h
    rr      l
    srl     h
    rr      l
    srl     h
    rr      l
    ld      b,l
    ld      a,b
    or      a
    jr      nz,DSEQ_Unk44B3_
    inc     b
DSEQ_Unk44B3_:
    ld      hl,wDSEQ_ReleaseFlags2
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      [hl],b
    ld      hl,wDSEQ_Unk3
    ld      a,$f9
    or      [hl]
    ld      [hl],a
    jp      DSEQ_Unk4652_

; 22nd entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_UnknownED:
    ld      a,c
    ld      hl,wDSEQ_Unk5
    srl     a
    srl     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    and     $f
    ld      b,a
    ld      a,$f
    sub     b
    ld      [hl],a
    jp      DSEQ_CMD_Skip

; 23rd entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Jump:
    ld      h,d
    ld      l,e
    inc     hl
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
    jp      DSEQ_Unk464E_

; 24th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Ret:
    ld      hl,wDSEQ_ReturnPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    xor     a
    ld      e,[hl]
    ld      [hl],a
    inc     hl
    ld      d,[hl]
    ld      [hl],a
    ld      a,d
    or      a
    jp      nz,DSEQ_Unk464E_
    call    DSEQ_Unk44FC_
    jp      DSEQ_Unk4652_

DSEQ_Unk44FC_:
    ld      a,[wDSEQ_CurrentChannel]
    ld      c,a
    call    DSEQ_Unk48AB_
    jr      c,:+
    xor     a
    call    DSEQ_Unk490B_
    ld      a,c
    cp      4
    jr      nc,:+
    ld      a,[wDSEQ_Unk2]
    swap    a
    ld      hl,wDSEQ_ChannelFlags
    and     [hl]
    jr      z,:+
    ld      hl,wDSEQ_Unk4
    ld      a,c
    add     l
    ld      l,a
    ld      a,$f0
    or      [hl]
    ld      [hl],a
:   ld      b,c
    inc     b
    xor     a
    dec     a
DSEQ_Unk4527_:
    rla
    dec     b
    jr      nz,DSEQ_Unk4527_
    ld      hl,wDSEQ_ChannelFlags
    and     [hl]
    ld      [hl],a
    push    af
    and     $f0
    jr      nz,.is_sfx
    ld      a,-1
    ld      [wDSEQ_MusicID],a
.is_sfx
    pop     af
    and     $f
    jr      nz,.skip
    ld      a,-1
    ld      [wDSEQ_SFXID],a
.skip
    ret

; 39th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Call:
    ld      hl,wDSEQ_ReturnPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    inc     de
    inc     de
    ld      [hl],e
    inc     hl
    ld      [hl],d
    dec     de
    dec     de
    ld      h,d
    ld      l,e
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
    jp      DSEQ_Unk464E_

; 25th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_PulseWave:
    ld      hl,wDSEQ_SoundTypes
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    inc     de
    ld      [hl],a
    ld      hl,wDSEQ_PulseDelays
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[de]
    inc     de
    ld      [hl],a
    jp      DSEQ_CMD_Skip

; 30th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Vibrato:
    ld      hl,wDSEQ_VibratoDepths
    ld      a,c
    add     a
    add     l
    ld      l,a
    push    hl
    inc     hl
    inc     de
    ld      a,[de]
    ld      [hl],a
    ld      hl,wDSEQ_VibratoDelays
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl+],a
    ld      [hl],0
    inc     de
    ld      a,[de]
    pop     hl
    ld      [hl],a
    jp      DSEQ_CMD_Skip

; 26th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_LoopCount:
    ld      hl,wDSEQ_LoopCounts
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl],a
    ld      hl,wDSEQ_LoopPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      [hl],e
    inc     hl
    ld      [hl],d
    jp      DSEQ_Unk464E_

; 27th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Loop:
    ld      hl,wDSEQ_LoopCounts
    ld      a,c
    add     a
    add     l
    ld      l,a
    dec     [hl]
    jp      z,DSEQ_CMD_Skip
    ld      hl,wDSEQ_LoopPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      e,[hl]
    inc     hl
    ld      d,[hl]
    jp      DSEQ_Unk464E_

; 35th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_NoteType:
    ld      hl,wDSEQ_ReleaseFlags1
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    and $F0
    swap    a
    ld      [hl+],a
    ld      a,[de]
    and     $0F
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 32nd entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Volume:
    ld      hl,wDSEQ_VolumeLevels
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    and     $0F
    ld      [hl+],a
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 31st entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_PitchOffset2:
    ld      hl,wDSEQ_PitchOffsets
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    inc     de
    ld      a,[de]
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 34th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Tempo:
    ld      hl,wDSEQ_Tempo
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 29th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_PitchOffset:
    ld      hl,wDSEQ_PitchOffsets
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 37th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Noise:
    ld      hl,wDSEQ_Frequency
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 36th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Panning:
    ld      hl,wDSEQ_StereoFlags
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     de
    ld      a,[de]
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 9th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_SetOctave:
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[de]
    and     $f
    ld      [hl],a
    jr      DSEQ_CMD_Skip

; 18th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_OctaveUp:
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    cp      8
    jr      z,DSEQ_CMD_Skip
    inc     [hl]
    jr      DSEQ_CMD_Skip

; 19th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_OctaveDown:
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    or      a
    jr      z,DSEQ_CMD_Skip
    dec     [hl]
    jr      DSEQ_CMD_Skip

; 20th entry of Jump Table from 4080 (indexed by unknown)
DSEQ_CMD_Skip:
    inc     de
DSEQ_Unk464E_:
    jp      DSEQ_Unk4427_

DSEQ_Unk4651_:
    inc     de
DSEQ_Unk4652_:
    ld      hl,wDSEQ_SFXPointers
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      [hl],e
    inc     hl
    ld      [hl],d
DSEQ_Unk465C_:
    ld      a,[wDSEQ_Unk3]
    and     1
    ld      a,[wDSEQ_CurrentChannel]
    ld      c,a
    jr      z,DSEQ_Unk4689_
    ld      hl,wDSEQ_NoteTimes1
    add     a
    add     l
    ld      l,a
    xor     a
    ld      [hl],a
    ld      de,$10
    add     hl,de
    ld      [hl],a
    add     hl,de
    dec     de
    ld      a,[hl+]
    ld      [hl],a
    add     hl,de
    ld      a,[hl+]
    ld      [hl],a
    add     hl,de
    ld      a,[hl+]
    ld      [hl],a
    ld      a,c
    and     3
    cp      3
    ld      b,0
    jr      z,DSEQ_Unk46A3_
    jr      DSEQ_Unk46A0_

DSEQ_Unk4689_:
    ld      hl,wDSEQ_NoteTimes2
    ld      a,[wDSEQ_CurrentChannel]
    add     a
    add     l
    ld      l,a
    inc     [hl]
    ld      b,[hl]
    ld      a,c
    and     $03
    cp      $03
    jr      z,DSEQ_Unk46A3_
    push    bc
    call    DSEQ_Unk479F_
    pop     bc
DSEQ_Unk46A0_:
    call    DSEQ_Unk47C1_
DSEQ_Unk46A3_:
    ld      hl,wDSEQ_Tempo
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    add     [hl]
    push    hl
    jr      c,DSEQ_Unk46B4_
    cp      $90
    jp      c,DSEQ_Unk4716_
DSEQ_Unk46B4_:
    sub     $90
    ld      hl,wDSEQ_TrackTimers
    push    af
    ld      a,c
    add     a
    add     l
    ld      l,a
    pop     af
    dec     [hl]
    ld      b,[hl]
    push    bc
    push    af
    ld      hl,wDSEQ_NoteTimes1
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     [hl]
    ld      b,[hl]
    ld      hl,wDSEQ_ReleaseFlags2
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,b
    cp      [hl]
    jr      nz,DSEQ_Unk4706_
    ld      hl,wDSEQ_ReleaseFlags1
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    ld      hl,wDSEQ_VolumeLevels
    push    af
    ld      a,c
    add     a
    add     l
    ld      l,a
    pop     af
    inc     hl
    ld      [hl],a
    ld      hl,wDSEQ_Unk3
    ld      a,$C0
    or      [hl]
    ld      [hl],a
    ld      hl,wDSEQ_StereoFlags
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    swap    a
    and     3
    ld      [hl],a
    ld      hl,wDSEQ_Unk3
    ld      a,$10
    or      [hl]
    ld      [hl],a
DSEQ_Unk4706_:
    pop     af
    pop     bc
    push    af
    ld      a,b
    or      a
    jr      z,DSEQ_Unk4715_
    pop     af
    cp      $90
    jr      c,DSEQ_Unk4716_
    jp      DSEQ_Unk46B4_

DSEQ_Unk4715_:
    pop     af
DSEQ_Unk4716_:
    push    af
    call    DSEQ_Unk48AB_
    jp      c,DSEQ_Unk479B_
    ld      a,c
    ld      de,wDSEQ_Unk3
    cp      4
    jr      c,DSEQ_Unk4733_
    ld      hl,wDSEQ_Unk4
    and     3
    add     l
    ld      l,a
    ld      a,[hl]
    ld      [hl],0
    ld      h,d
    ld      l,e
    or      [hl]
    ld      [hl],a
DSEQ_Unk4733_:
    ld      a,[de]
    and     $10
    jr      z,DSEQ_Unk4744_
    ld      hl,wDSEQ_StereoFlags
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    call    DSEQ_Unk48B8_
DSEQ_Unk4744_:
    ld      a,[de]
    and     $20
    jr      z,DSEQ_Unk4755_
    ld      hl,wDSEQ_SoundTypes
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    call    DSEQ_Unk4931_
DSEQ_Unk4755_:
    ld      a,[de]
    and     $40
    jr      z,DSEQ_Unk4784_
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    rlca
    jr      nc,DSEQ_Unk4769_
    xor     a
    jr      DSEQ_Unk4781_

DSEQ_Unk4769_:
    ld      a,c
    ld      hl,wDSEQ_Unk5
    srl     a
    srl     a
    add     l
    ld      l,a
    ld      b,[hl]
    ld      a,c
    ld      hl,wDSEQ_VolumeLevels
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    sub     b
    jr      nc,DSEQ_Unk4781_
    xor     a
DSEQ_Unk4781_:
    call    DSEQ_Unk490B_
DSEQ_Unk4784_:
    ld      hl,wDSEQ_Frequency
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      a,[de]
    and     $80
    jr      z,:+
    sla     h
    scf
    rr      h
:   call    DSEQ_Unk4952_
DSEQ_Unk479B_:
    pop     af
    pop     hl
    ld      [hl],a
    ret

DSEQ_Unk479F_:
    ld      hl,wDSEQ_PulseDelays
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    or      a
    ret     z
    cp      b
    ret     nz
    ld      a,c
    ld      hl,wDSEQ_SoundTypes
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    swap    a
    and     $f
    inc     hl
    ld      [hl],a
    ld      hl,wDSEQ_Unk3
    ld      a,$A0
    or      [hl]
    ld      [hl],a
    ret

DSEQ_Unk47C1_:
    call    DSEQ_Unk47F4_
    jr      c,:+
    ld      a,[wDSEQ_Unk3]
    and     8
    ret     z
:   ld      e,l
    ld      d,h
    ld      hl,wDSEQ_PitchOffsets
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    add     hl,de
    push    hl
    ld      hl,wDSEQ_Octaves
    ld      a,c
    add     a
    add     l
    ld      l,a
    inc     hl
    ld      a,[hl]
    pop     hl
    call    DSEQ_GetNoteFrequency
    ld      d,h
    ld      e,l
    ld      hl,wDSEQ_Frequency
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      [hl],e
    inc     hl
    ld      [hl],d
    ret

DSEQ_Unk47F4_:
    push    bc
    ld      hl,wDSEQ_VibratoDepths
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl]
    or      a
    jr      z,.skip
    push    hl
    inc     hl
    ld      a,[hl]
    cp      b
    jr      c,DSEQ_Unk480D_
    pop     hl
.skip
    ld      hl,0
    pop     bc
    or      a
    ret

DSEQ_Unk480D_:
    ld      hl,wDSEQ_VibratoDelays
    ld      a,c
    add     a
    add     l
    ld      l,a
    ld      a,[hl+]
    add     [hl]
    ld      [hl],a
    ld      c,a
    sla     a
    sla     a
    jr      nc,:+
    cpl
:   pop     hl
    ld      l,[hl]
    ld      h,0
    call    DSEQ_Unk485A_
    ld      a,l
    srl     h
    rra
    srl     h
    rra
    srl     h
    rra
    srl     h
    rra
    ld      l,a
    sla     c
    jr      nc,DSEQ_Unk483F_
    ld      a,h
    scf
    ld      h,a
    ld      a,l
    scf
    ld      l,a
    inc     hl
DSEQ_Unk483F_:
    pop     bc
    scf
    ret

DSEQ_Unk4842_:
    push    bc
    push    de
    ld      e,a
    ld      b,8
.loop
    add     hl,hl
    ld      a,h
    jr      c,:+
    cp      e
    jr      c,:++
:   sub     e
    ld      h,a
    inc     hl
:   dec     b
    jr      nz,.loop
    ld      a,l
    ld      l,h
    ld      h,a
    pop     de
    pop     bc
    ret

DSEQ_Unk485A_:
    push    bc
    push    de
    ld      d,h
    ld      e,l
    ld      hl,0
    ld      b,8
:
    rrca
    jr      nc,:+
    add     hl,de
:
    sla     e
    rl      d
    dec     b
    jr      nz,:--
    pop     de
    pop     bc
    ret

DSEQ_Unk4871_:
    ld      h,a
    xor     a
    srl     h
    jr      nc,:+
    add     l
:   sla     l
    srl     h
    jr      nc,:+
    add     l
:   sla     l
    srl     h
    jr      nc,:+
    add     l
:   sla     l
    srl     h
    ret     nc
    add     l
    ret

DSEQ_Unk488D_:
    push    bc
    ld      b,4
.loop
    ld      [hl],d
    inc     hl
    ld      [hl],e
    inc     hl
    dec     b
    jr      nz,.loop
    pop     bc
    ret

DSEQ_Unk4899_:
    add     a
    add     a
    add     a
    add     e
    ld      e,a
    ld      a,d
    adc     0
    ld      d,a
    ld      b,8
DSEQ_Unk48A4_:
    ld      a,[de]
    inc     de
    ld      [hl+],a
    dec     b
    jr      nz,DSEQ_Unk48A4_
    ret

DSEQ_Unk48AB_:
    push    af
    ld      a,[wDSEQ_Unk1]
    or      a
    jr      nz,DSEQ_Unk48B5_
    pop     af
    or      a
    ret

DSEQ_Unk48B5_:
    pop     af
    scf
    ret

DSEQ_Unk48B8_:
    push    bc
    push    hl
    push    af
    ld      a,c
    and     $03
    ld      c,a
    ld      hl,DSEQ_StereoMultTable
    add     l
    ld      l,a
    ld      b,[hl]
    ldh     a,[rAUDTERM]
    and     b
    ld      b,a
    pop     af
    and     $03
    ld      hl,DSEQ_StereoTable
    add     l
    ld      l,a
    ld      a,[hl]
    inc     c
DSEQ_Unk48D3_:
    dec     c
    jr      z,DSEQ_Unk48D9_
    rlca
    jr      DSEQ_Unk48D3_

DSEQ_Unk48D9_:
    or      b
    ldh     [rAUDTERM],a
    pop     hl
    pop     bc
    ret

DSEQ_Unk48DF_:
    push    bc
    push    hl
    ld      a,c
    and     3
    ld      b,a
    ld      hl,DSEQ_NRx2Table
    add     l
    ld      l,a
    ld      c,[hl]
    ld      a,b
    cp      2
    jr      nz,DSEQ_Unk48FA_
    xor     a
    ld      [c],a
    ldh     [rAUD3ENA],a
    ld      a,$80
    ldh     [rAUD3ENA],a
    jr      DSEQ_Unk4908_

DSEQ_Unk48FA_:
    ld      a,8
    ld      [c],a
    ld      hl,DSEQ_NRx3Table
    ld      a,b
    add     l
    ld      l,a
    ld      c,[hl]
    inc     c
    ld      a,$80
    ld      [c],a
DSEQ_Unk4908_:
    pop     hl
    pop     bc
    ret

DSEQ_Unk490B_:
    push    bc
    push    hl
    and     $f
    ld      b,a
    ld      a,c
    and     3
    ld      c,a
    cp      $02
    jr      nz,DSEQ_Unk4923_
    ld      a,b
    srl     a
    srl     a
    ld      hl,DSEQ_WaveVolTable
    add     l
    ld      l,a
    ld      b,[hl]
DSEQ_Unk4923_:
    ld      hl,DSEQ_NRx2Table
    ld      a,c
    add     l
    ld      l,a
    ld      c,[hl]
    ld      a,b
    swap    a
    ld      [c],a
    pop     hl
    pop     bc
    ret

DSEQ_Unk4931_:
    push    bc
    push    hl
    ld      b,a
    ld      a,c
    and     3
    cp      3
    jr      z,DSEQ_Unk494F_
    cp      $02
    jr      nz,DSEQ_Unk4945_
    ld      a,b
    call    DSEQ_LoadWave
    jr      DSEQ_Unk494F_

DSEQ_Unk4945_:
    ld      hl,DSEQ_NRx1Table
    add     l
    ld      l,a
    ld      c,[hl]
    ld      a,b
    rrca
    rrca
    ld      [c],a
DSEQ_Unk494F_:
    pop     hl
    pop     bc
    ret

DSEQ_Unk4952_:
    push    bc
    ld      a,c
    and     3
    push    hl
    cp      2
    jr      nz,DSEQ_Unk4968_
    rlc     h
    jr      nc,DSEQ_Unk4968_
    if      DSEQ_Optimize
        ld      hl,rAUD3ENA
        res     7,[hl]
        set     7,[hl]
    else
        push    af
        xor     a
        ldh     [rAUD3ENA],a
        ld      a,$80
        ldh     [rAUD3ENA],a
        pop     af
    endc
DSEQ_Unk4968_:
    ld      hl,DSEQ_NRx3Table
    add     l
    ld      l,a
    ld      c,[hl]
    pop     hl
    ld      a,l
    ld      [c],a
    inc     c
    ld      a,h
    ld      [c],a
    pop     bc
    ret

DSEQ_LoadWave:
if DSEQ_Optimize
    push    hl
    add     a
    ld      hl,DSEQ_WavePointers
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    xor     a
    ldh     [rAUD3ENA],a
    for n,16
        ld      a,[hl+]
        ld      [_AUD3WAVERAM+n],a
    endr
    ld      a,$80
    ldh     [rAUD3ENA],a
    pop     hl
    ret
else
    push    bc
    push    hl
    add     a
    ld      hl,DSEQ_WavePointers
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      c,low(_AUD3WAVERAM)
    xor     a
    ldh     [rAUD3ENA],a
    for n,16
        ld      a,[hl+]
        ld      [c],a
        inc     c
    endr
    ld      a,$80
    ldh     [rAUD3ENA],a
    pop     hl
    pop     bc
    ret
endc

; INPUT: a = note ID, hl = ???
DSEQ_GetNoteFrequency:
    push    bc
    ld      c,l
    add     h
    ld      b,0
    ; divide note ID by 12 to get octave
.octaveloop
    sub     12
    inc     b
    jr      nc,.octaveloop
    dec     b
    add     12
    jr      DSEQ_CalculateFrequency

DSEQ_Unk49CC_:
    push    bc
    ld      b,h
    ld      c,l
    push    af
    swap    a
    and     $F
    ld      l,12
    call    DSEQ_Unk4871_
    ld      l,a
    pop     af
    and     $F
    add     l
    add     b
    ld      h,0
    ld      l,a
    ld      a,$0C
    call    DSEQ_Unk4842_
    ld      b,h
    ld      a,l
; INPUT: a = note, b = octave
DSEQ_CalculateFrequency:
    add     a
    push    af
    ld      hl,DSEQ_FreqOffsets
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      a,c
    call    DSEQ_Unk485A_
    ld      c,h
    pop     af
    ld      hl,DSEQ_FreqTable
    add     l
    ld      l,a
    ld      a,[hl+]
    ld      h,[hl]
    ld      l,a
    ld      a,c
    add     l
    ld      l,a
    ld      a,h
    adc     $00
    ld      h,a
    ld      a,b
    or      a
    jr      z,.done
    ld      a,h
    ld      h,$04
:
    srl     a
    rr      l
    or      h
    dec     b
    jr      nz,:-
    ld      h,a
.done
    pop     bc
    ret

; ================================================================

DSEQ_InitSGBSound:
    ld      a,$41
    ld      [wDSEQ_SGBPacketBuffer],a
    ld      b,11
    ld      hl,wDSEQ_SGBPacketBuffer2
    xor     a
:
    ld      [hl+],a
    dec     b
    jr      nz,:-
    ld      hl,wDSEQ_SGBPacketBuffer
    ; the following two instructions are dead code and can be omitted
    if !DSEQ_Optimize
        call    DSEQ_SendSGBPacket
        ret
    endc

DSEQ_SendSGBPacket:
    ld      a,[hl]
    and     $07
    ret     z
    ld      c,low(rP1)
.sendloop
    push    af
    ld      a,P1F_4|P1F_5
    ld      [c],a
    ld      a,0
    ld      [c],a
    ld      a,P1F_4|P1F_5
    ld      [c],a
    ld      d,$10
:
    ld      b,[hl]
    inc     hl
    ld      e,$08
:
    ld      a,$10
    rrc     b
    jr      c,:+
    ld      a,P1F_5
:
    ld      [c],a
    ld      a,P1F_4|P1F_5
    ld      [c],a
    dec     e
    jr      nz,:--
    dec     d
    jr      nz,:---
    ld      a,P1F_5
    ld      [c],a
    ld      a,P1F_4|P1F_5
    ld      [c],a
    pop     af
    dec     a
    ret     z
    ; the following is dead code and can be omitted
    if      !DSEQ_Optimize
    call    DSEQ_Unk4A66_
    jr      .sendloop

DSEQ_Unk4A66_:
    push    hl
    ld      hl,$1B58
:   ; possibly a nop'd out function call?
    nop
    nop
    nop
    dec     hl
    ld      a,h
    or      l
    jr      nz,:-
    pop     hl
    ret
    endc

; ================================================================

DSEQ_DummySong:
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_DummyTrack:
    sound_ret

; ================================================================

include "Audio/MusicData.asm"
    
; ================================================================

include "Audio/SFXData.asm"
