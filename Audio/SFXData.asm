DSEQ_SFXPointers:

DSEQ_SFXPtr_Unk1:
    dw      DSEQ_SFX_Unk1_CH1
    dw      DSEQ_SFX_Unk1_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Unk2:
    dw      DSEQ_SFX_Unk2_CH1
    dw      DSEQ_SFX_Unk2_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Hint:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Hint_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_MenuSelect:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_MenuSelect_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_MenuBack:    
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_MenuBack_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_ChiselTile:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_ChiselTile_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_ChiselTile_CH4
DSEQ_SFXPtr_Unk3:
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Unk3_CH4
DSEQ_SFXPtr_ClearTile:
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_ClearTile_CH4
DSEQ_SFXPtr_Checkmark:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Checkmark_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Mistake:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Mistake_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Cursor:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Cursor_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_SelectTile:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_SelectTile_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_MarkTile:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_MarkTile_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Unk4:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Unk4_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Unk5:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Unk5_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Unk6:
    dw      DSEQ_Music_Unk1_CH1
    dw      DSEQ_Music_Unk1_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
DSEQ_SFXPtr_Pause:
    dw      DSEQ_DummyTrack
    dw      DSEQ_SFX_Pause_CH2
    dw      DSEQ_DummyTrack
    dw      DSEQ_DummyTrack
    
; ================================
    
DSEQ_SFX_Pause_CH2:
    notetype 1,7
    pulse   0,0,0
    panning 3,3
    octave  3
    volume  15
    note    F_,2
    note    C_,2
    note    F_,2
    octave_up
    note    F_,2
    note    C_,2
    note    F_,2
    octave_down
    volume  8
    note    F_,2
    note    C_,2
    note    F_,2
    octave_up
    note    F_,2
    note    C_,2
    note    F_,2
    octave_down
    volume  4
    note    F_,2
    note    C_,2
    note    F_,2
    octave_up
    note    F_,2
    note    C_,2
    note    F_,2
    octave_down
    volume  1
    note    F_,2
    note    C_,2
    note    F_,2
    octave_up
    note    F_,2
    note    C_,2
    note    F_,2
    octave_down
    sound_ret
    
; ================================    

DSEQ_SFX_Unk5_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  7
    note    C_,3
    volume  12
    octave  6
    note    C_,0
    note    rest,0
    note    C#,0
    note    rest,0
    note    D_,0
    octave  3
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    note    rest,0
    sound_ret
    
; ================================    

DSEQ_SFX_Unk4_CH2:
    notetype 0,0
    volume  9
    pulse   1,0,0
    panning 3,3
    octave  6
    note    C_,3
    note    rest,3
    octave_down
    octave_down
    note    C_,3
    volume  7
    note    C_,3
    volume  5
    note    C_,3
    volume  3
    note    C_,3
    volume  1
    note    C_,3
    sound_ret
 
; ================================    
    
DSEQ_SFX_MarkTile_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  3
    volume  12
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    note    rest,0
    octave_up
    octave_up
    octave_up
    octave_up
    note    C_,0
    note    rest,0
    note    C#,0
    note    rest,0
    note    D_,0
    sound_ret

; ================================    
    
DSEQ_SFX_SelectTile_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  3
    note    C_,0
    sound_ret

; ================================    
    
DSEQ_SFX_Cursor_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  5
    note    B_,1
    note    D#,1
    volume  12
    note    B_,1
    note    D#,1
    volume  9
    note    B_,1
    note    D#,1
    volume  6
    note    B_,1
    note    D#,1
    volume  3
    note    B_,1
    note    D#,1
    volume  1
    note    B_,1
    note    D#,1
    sound_ret

; ================================    
    
DSEQ_SFX_Mistake_CH2:
    notetype 0,0
    volume  15
    pulse   1,0,0
    panning 3,3
    octave  7
    note    C_,3
    octave  4
    volume  15
    note    B_,0
    note    A#,0
    note    A_,1
    volume  12
    note    A#,0
    note    A_,0
    note    G#,1
    volume  9
    note    A_,0
    note    G#,0
    note    G_,1
    volume  6
    note    G#,0
    note    G_,0
    note    F#,1
    sound_ret

; ================================    
    
DSEQ_SFX_Checkmark_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  2
    note    C_,0
    note    rest,0
    note    G_,0
    note    rest,0
    octave_up
    note    C_,0
    note    rest,0
    octave  2
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    note    rest,0
    octave_down
    note    C_,0
    sound_ret
    
; ================================  

DSEQ_SFX_ClearTile_CH4:
    notetype 0,0
    volume  15
    panning 3,3
    note    rest,3
    noise   $47
    note    C_,0
    note    rest,2
    noise   $46
    note    C_,0
    note    rest,2
    noise   $45
    note    C_,0
    note    rest,1
    noise   $44
    note    C_,0
    note    rest,1
    noise   $43
    note    C_,0
    note    rest,0
    noise   $42
    note    C_,0
    note    rest,0
    noise   $41
    note    C_,0
    noise   $40
    note    C_,0
    sound_ret
 
; ================================    
   
DSEQ_SFX_Unk3_CH4:
    notetype 0,0
    volume  7
    panning 3,3
    noise   $0
    note    C_,0
    noise   $2
    note    C_,0
    noise   $4
    note    C_,0
    noise   $6
    note    C_,0
    sound_ret

; ================================    

DSEQ_SFX_ChiselTile_CH2:
    notetype 0,0
    volume  15
    pulse   0,0,0
    panning 3,3
    octave  7
    note    C_,3
    volume  12
    note    C_,3
    volume  9
    note    C_,3
    volume  6
    note    C_,3
    volume  3
    note    C_,3
    sound_ret
    
DSEQ_SFX_ChiselTile_CH4:
    notetype 0,0
    volume  15
    panning 3,3
    note    rest,3
    noise   $20
    note    C_,0
    note    rest,1
    noise   $40
    note    C_,0
    note    rest,1
    noise   $60
    note    C_,0
    note    rest,1
    noise   $61
    note    C_,0
    note    rest,1
    noise   $62
    note    C_,0
    note    rest,1
    noise   $63
    note    C_,0
    note    rest,1
    noise   $64
    note    C_,0
    note    rest,1
    sound_ret

; ================================    

DSEQ_SFX_Unk1_CH1:
    notetype 5,6
    octave  4
    volume  8
    pulse   0,2,2
    panning 3,1
    note    C_,3
    volume  6
    note    F_,3
    sound_ret

DSEQ_SFX_Unk1_CH2:
    notetype 5,6
    octave  4
    volume  8
    pulse   0,2,2
    panning 3,2
    note    F_,3
    volume  6
    note    A_,3
    sound_ret

; ================================    

DSEQ_SFX_Unk2_CH1:
    notetype 5,6
    octave  4
    volume  8
    pulse   0,2,2
    panning 3,1
    note    F_,3
    volume  6
    note    C_,3
    note    rest,1
    sound_ret

DSEQ_SFX_Unk2_CH2:
    notetype 5,6
    octave  4
    volume  8
    pulse   0,2,2
    panning 3,2
    note    A_,3
    volume  6
    note    F_,3
    note    rest,1
    sound_ret

; ================================    

DSEQ_SFX_Hint_CH2:
    notetype 8,7
    octave  4
    volume  13
    pulse   2,1,2
    panning 3,3
    note    C_,2
    note    D_,2
    note    E_,2
    volume  11
    note    D_,2
    note    E_,2
    note    F_,2
    volume  9
    note    E_,2
    note    F_,2
    note    G_,2
    sound_ret

; ================================    

DSEQ_SFX_MenuSelect_CH2:
    notetype 2,7
    octave  4
    volume  15
    pulse   0,1,1
    panning 3,3
    note    D_,2
    note    E_,2
    note    G_,2
    note    B_,2
    volume  7
    note    D_,2
    note    E_,2
    note    G_,2
    note    B_,2
    volume  3
    note    D_,2
    note    E_,2
    note    G_,2
    note    B_,2
    sound_ret

; ================================    

DSEQ_SFX_MenuBack_CH2:
    notetype 2,7
    octave  4
    volume  15
    pulse   0,1,1
    panning 3,3
    note    B_,2
    note    G_,2
    note    E_,2
    note    D_,2
    volume  7
    note    B_,2
    note    G_,2
    note    E_,2
    note    D_,2
    volume  3
    note    B_,2
    note    G_,2
    note    E_,2
    note    D_,2
    sound_ret

; ================================    
