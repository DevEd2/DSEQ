section "DSEQ - Music pointers",romx[$4a7d]
DSEQ_MusicPointers:

DSEQ_Music_NoMusic:
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_BGM2:
    dw      DSEQ_Music_BGM2_CH1
    dw      DSEQ_Music_BGM2_CH2
    dw      DSEQ_Music_BGM2_CH3
    dw      DSEQ_Music_BGM2_CH4
DSEQ_Music_BGM5:
    dw      DSEQ_Music_BGM5_CH1
    dw      DSEQ_Music_BGM5_CH2
    dw      DSEQ_Music_BGM5_CH3
    dw      DSEQ_Music_BGM5_CH4
DSEQ_Music_BGM4:
    dw      DSEQ_Music_BGM4_CH1
    dw      DSEQ_Music_BGM4_CH2
    dw      DSEQ_Music_BGM4_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_PuzzleSelect:
    dw      DSEQ_Music_PuzzleSelect_CH1
    dw      DSEQ_Music_PuzzleSelect_CH2
    dw      DSEQ_Music_PuzzleSelect_CH3
    dw      DSEQ_Music_PuzzleSelect_CH4
DSEQ_Music_BGM1:
    dw      DSEQ_Music_BGM1_CH1
    dw      DSEQ_Music_BGM1_CH2
    dw      DSEQ_Music_BGM1_CH3
    dw      DSEQ_Music_BGM1_CH4
DSEQ_Music_AllClear:
    dw      DSEQ_Music_AllClear_CH1
    dw      DSEQ_Music_AllClear_CH2
    dw      DSEQ_Music_AllClear_CH3
    dw      DSEQ_Music_AllClear_CH4
DSEQ_Music_Congratulations:
    dw      DSEQ_Music_Congratulations_CH1
    dw      DSEQ_Music_Congratulations_CH2
    dw      DSEQ_Music_Congratulations_CH3
    dw      DSEQ_Music_Congratulations_CH4
DSEQ_Music_GameOver:
    dw      DSEQ_Music_GameOver_CH1
    dw      DSEQ_Music_GameOver_CH2
    dw      DSEQ_Music_GameOver_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_PuzzleReveal:
    dw      DSEQ_Music_PuzzleReveal_CH1
    dw      DSEQ_Music_PuzzleReveal_CH2
    dw      DSEQ_Music_PuzzleReveal_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_TitleScreen:
    dw      DSEQ_Music_TitleScreen_CH1
    dw      DSEQ_Music_TitleScreen_CH2
    dw      DSEQ_Music_TitleScreen_CH3
    dw      DSEQ_Music_TitleScreen_CH4
DSEQ_Music_BGM3:
    dw      DSEQ_Music_BGM3_CH1
    dw      DSEQ_Music_BGM3_CH2
    dw      DSEQ_Music_BGM3_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_Unk1:
    dw      DSEQ_Music_Unk1_CH1
    dw      DSEQ_Music_Unk1_CH2
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_GameSelect:
    dw      DSEQ_Music_GameSelect_CH1
    dw      DSEQ_Music_GameSelect_CH2
    dw      DSEQ_Music_GameSelect_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_CourseSelect:
    dw      DSEQ_Music_CourseSelect_CH1
    dw      DSEQ_Music_CourseSelect_CH2
    dw      DSEQ_Music_CourseSelect_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_TimeTrialResults:
    dw      DSEQ_Music_TimeTrialResults_CH1
    dw      DSEQ_Music_TimeTrialResults_CH2
    dw      DSEQ_Music_TimeTrialResults_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_StarCourse:
    dw      DSEQ_Music_StarCourse_CH1
    dw      DSEQ_Music_StarCourse_CH2
    dw      DSEQ_Music_StarCourse_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_Unk2:
    dw      DSEQ_Music_Unk2_CH1
    dw      DSEQ_Music_Unk2_CH2
    dw      DSEQ_Music_Unk2_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_PuzzleClear:
    dw      DSEQ_Music_PuzzleClear_CH1
    dw      DSEQ_Music_PuzzleClear_CH2
    dw      DSEQ_Music_PuzzleClear_CH3
    dw      DSEQ_Music_DummyTrack
DSEQ_Music_PuzzleClearShort:
    dw      DSEQ_Music_PuzzleClearShort_CH1
    dw      DSEQ_Music_PuzzleClearShort_CH2
    dw      DSEQ_Music_PuzzleClearShort_CH3
    dw      DSEQ_Music_DummyTrack
;DSEQ_Music_DriverTest_Vibrato_CHx:
;   dw      DSEQ_Music_DriverTest_Vibrato_CHx
;   dw      DSEQ_Music_DummyTrack
;   dw      DSEQ_Music_DummyTrack
;   dw      DSEQ_Music_DummyTrack
DSEQ_Music_DriverTest_Noise:
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DummyTrack
    dw      DSEQ_Music_DriverTest_Noise_CH4
;DSEQ_Music_Tulip:
;   dw      DSEQ_Music_Tulip_CH1
;   dw      DSEQ_Music_Tulip_CH2
;   dw      DSEQ_Music_Tulip_CH3
;   dw      DSEQ_Music_Tulip_CH4
    
; ================================================================

include "Audio/Music/bgm2.asm"              ; 
include "Audio/Music/bgm5.asm"              ; 
include "Audio/Music/bgm4.asm"              ; 
include "Audio/Music/puzzleselect.asm"      ; 
include "Audio/Music/bgm1.asm"              ; 
include "Audio/Music/allclear.asm"          ; 
include "Audio/Music/congratulations.asm"   ; 
include "Audio/Music/gameover.asm"          ; 
include "Audio/Music/puzzlereveal.asm"      ; 
include "Audio/Music/titlescreen.asm"       ; 
include "Audio/Music/bgm3.asm"              ; 
include "Audio/Music/unknown1.asm"          ; 
include "Audio/Music/gameselect.asm"        ; 
include "Audio/Music/courseselect.asm"      ; 
include "Audio/Music/timetrialresults.asm"  ;   
include "Audio/Music/starcourse.asm"        ; 
include "Audio/Music/unknown2.asm"          ; 
include "Audio/Music/puzzleclear.asm"       ; 
include "Audio/Music/puzzleclearshort.asm"  ; 

; ================================================

DSEQ_Music_DummyTrack:  
    volume  0
    sound_ret
    
; ================================================

; Unused, but referenced in the pointer table. 
DSEQ_Music_DriverTest_Vibrato_CHx: ; actual channel assignment is unknown
    notetype 0,8
    tempo   72
    octave  3
    volume  10
    panning 3,3
    vibrato 1,8,8
    note    C_,13
    note    hold,13
    vibrato 1,16,8
    note    D_,13
    note    hold,13
    vibrato 1,24,8
    note    E_,13
    note    hold,13
    vibrato 1,36,8
    note    F_,13
    note    hold,13
    vibrato 1,48,8
    note    G_,13
    note    hold,13
    vibrato 1,56,8
    note    A_,13
    note    hold,13
    vibrato 1,64,8
    note    B_,13
    note    hold,13
    vibrato 1,72,8
    octave_up
    note    C_,13
    note    hold,13
    octave_down
    vibrato 1,8,8
    note    C_,13
    note    hold,13
    vibrato 1,8,16
    note    D_,13
    note    hold,13
    vibrato 1,8,24
    note    E_,13
    note    hold,13
    vibrato 1,8,36
    note    F_,13
    note    hold,13
    vibrato 1,8,48
    note    G_,13
    note    hold,13
    vibrato 1,8,56
    note    A_,13
    note    hold,13
    vibrato 1,8,64
    note    B_,13
    note    hold,13
    vibrato 1,8,72
    octave_up
    note    C_,13
    note    hold,13
    octave_down
    ; BUG: This sequence isn't terminated properly, causing it to fall through into the next sequence

; ================================================

; Unused, but referenced in the pointer table. 
; BUG: This sequence fails to initialize noise parameters
DSEQ_Music_DriverTest_Noise_CH4:
    noise   $40
    note    C_,13
    note    hold,13
    noise   $41
    note    C_,13
    note    hold,13
    noise   $42
    note    C_,13
    note    hold,13
    noise   $43
    note    C_,13
    note    hold,13
    noise   $44
    note    C_,13
    note    hold,13
    noise   $45
    note    C_,13
    note    hold,13
    noise   $46
    note    C_,13
    note    hold,13
    noise   $47
    note    C_,13
    note    hold,13
    sound_ret
    
; ================================================

; Unused song!
include "Audio/Music/tulip.asm"
