DSEQ_Music_BGM2_CH1:
    tempo   144
    vibrato 16,16,8
    octave  3
    panning PAN_CENTER,PAN_CENTER
    pulse   PULSE_75,PULSE_50,4
    notetype 3,4
.loop
    volume  7
    sound_call .block1
    vibrato 16,16,8
    volume  7
    panning PAN_CENTER,PAN_CENTER
    notetype 3,4
    sound_call .block1
    vibrato 16,16,8
    volume  7
    panning PAN_CENTER,PAN_CENTER
    notetype 3,4
    octave_down
    note    A_,10
    note    A_,10
    octave_up
    note    C_,10
    note    C_,10
    octave_down
    note    G_,8
    note    G_,10
    octave_up
    note    C_,10
    octave_down
    note    B_,5
    octave_up
    note    C_,10
    octave_down
    note    A_,10
    note    A_,10
    octave_up
    note    C_,10
    note    D_,10
    notetype 3,7
    note    E_,8
    note    F_,5
    note    E_,8
    note    D_,10
    note    E_,5
    note    D_,10
    notetype 3,5
    note    C_,10
    note    rest,10
    octave_down
    note    A_,10
    octave_up
    note    C_,10
    notetype 3,7
    octave_down
    note    B_,8
    octave_up
    note    C_,5
    note    D_,8
    note    C_,10
    octave_down
    note    A_,5
    octave_up
    note    C_,10
    notetype 3,5
    note    E_,10
    note    E_,10
    note    C_,10
    octave_down
    note    A_,10
    octave_up
    note    E_,8
    note    E_,10
    note    D_,5
    note    hold,13
    note    hold,13
    note    rest,13
    sound_call .block1
    vibrato 16,16,8
    panning PAN_CENTER,PAN_CENTER
    notetype 3,4
    volume  7
    note    G_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    A_,5
    note    G_,8
    note    F_,5
    note    E_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    C_,10
    volume  6
    octave_down
    note    G_,5
    volume  7
    note    A_,8
    volume  6
    note    G_,5
    octave_up
    volume  7
    note    C_,8
    note    C_,8
    octave_down
    volume  6
    note    G_,5
    octave_up
    volume  7
    note    D_,10
    note    C_,5
    note    D_,8
    octave_down
    volume  6
    note    G_,5
    octave_up
    volume  7
    note    E_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    F_,5
    note    E_,8
    note    D_,5
    note    E_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    F_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    G_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    A_,8
    volume  6
    octave_down
    note    G_,5
    octave_up
    octave_up
    volume  7
    note    C_,8
    note    C_,10
    octave_down
    note    B_,5
    note    hold,13
    sound_jump .loop
.block1
    note    C_,10
    note    rest,10
    note    E_,10
    note    rest,10
    note    D_,8
    note    D_,10
    note    F_,10
    note    E_,5
    note    F_,10
    note    G_,10
    note    G_,10
    note    E_,10
    note    C_,10
    note    D_,8
    note    D_,10
    octave_down
    note    G_,11
    note    G_,10
    octave_up
    note    C_,10
    note    rest,10
    note    E_,10
    note    rest,10
    note    D_,8
    note    D_,10
    note    F_,10
    note    E_,5
    note    F_,10
    note    G_,10
    note    G_,10
    notetype 3,7
    note    E_,8
    note    C_,5
    note    D_,8
    notetype 3,5
    note    C_,5
    note    hold,10
    volume  5
    vibrato 1,40,100
    octave_up
    panning PAN_LEFT,PAN_LEFT
    note    G_,5
    note    rest,8
    octave_down
    octave_down
    panning PAN_RIGHT,PAN_RIGHT
    note    G_,10
    note    rest,10
    octave_up
    sound_ret

; ========
    
DSEQ_Music_BGM2_CH2:    
    tempo   144
    octave  3
    volume  7
    notetype 3,4
.loop
    volume  7
    pulse   0,2,8
    panning PAN_LEFT,PAN_LEFT
    pitch_offset 0
    vibrato 10,20,3
    panning PAN_LEFT,PAN_LEFT
    sound_call .block1
    volume  7
    vibrato 10,20,3
    panning PAN_LEFT,PAN_LEFT
    sound_call .block1
    volume  7
    vibrato 10,20,3
    panning PAN_LEFT,PAN_LEFT
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    G#,5
    note    A_,8
    note    B_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    note    A_,8
    note    C_,5
    note    B_,8
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    E_,8
    octave_down
    note    E_,5
    octave_up
    note    E_,8
    note    D_,10
    octave_down
    note    E_,5
    octave_up
    note    E_,10
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    octave_up
    note    C_,8
    octave_down
    note    C_,5
    note    C_,5
    note    E_,5
    note    A_,5
    octave_up
    note    C_,5
    note    E_,5
    note    G_,5
    note    A_,8
    octave_down
    note    A_,5
    octave_up
    note    A_,8
    octave_down
    note    A_,5
    octave_up
    note    A_,8
    octave_down
    note    A_,5
    octave_up
    note    A_,8
    octave_down
    note    A_,5
    octave_up
    note    A_,10
    note    rest,8
    note    B_,5
    note    hold,13
    note    rest,13
    note    rest,13
    panning PAN_LEFT,PAN_LEFT
    sound_call .block1
    vibrato 10,20,3
    panning PAN_LEFT,PAN_LEFT
    pitch_offset 40
    pulse   0,2,4
    volume  7
    note    rest,8
    note    G_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    A_,5
    note    G_,8
    note    F_,5
    note    E_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    C_,10
    volume  5
    octave_down
    note    G_,5
    volume  7
    note    A_,8
    volume  5
    note    G_,5
    octave_up
    volume  7
    note    C_,8
    note    C_,8
    octave_down
    volume  5
    note    G_,5
    octave_up
    volume  7
    note    D_,10
    note    C_,5
    note    D_,8
    octave_down
    volume  5
    note    G_,5
    octave_up
    volume  7
    note    E_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    octave_down
    note    G_,5
    octave_up
    note    G_,8
    volume  7
    note    F_,5
    note    E_,8
    note    D_,5
    note    E_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    F_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    G_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    volume  7
    note    A_,8
    volume  5
    octave_down
    note    G_,5
    octave_up
    octave_up
    volume  7
    note    C_,8
    note    C_,10
    octave_down
    note    B_,5
    note    hold,11
    sound_jump .loop
.block1
    note    rest,8
    note    C_,5
    octave_down
    note    G_,8
    octave_up
    note    C_,5
    note    E_,8
    note    E_,5
    note    G_,8
    note    G_,5
    note    F_,10
    note    E_,8
    note    D_,10
    note    C_,10
    note    E_,5
    note    hold,8
    note    C_,5
    octave_down
    note    G_,8
    octave_up
    note    C_,5
    note    E_,8
    note    E_,5
    note    G_,8
    note    G_,5
    note    A_,10
    note    G_,8
    note    F_,10
    note    E_,10
    note    G_,5
    note    hold,8
    note    C_,5
    octave_down
    note    G_,10
    octave_up
    note    C_,8
    note    C_,5
    note    G_,8
    note    G_,5
    note    F_,8
    note    E_,10
    note    F_,10
    note    F#,10
    note    G_,5
    note    hold,8
    note    G_,5
    note    E_,8
    note    E_,5
    note    F_,8
    note    F_,5
    note    G_,8
    note    G_,5
    octave_up
    note    C_,10
    vibrato 1,40,100
    volume  5
    panning PAN_LEFT,PAN_LEFT
    octave_up
    note    C_,5
    note    rest,8
    octave_down
    panning PAN_RIGHT,PAN_RIGHT
    note    C_,10
    note    rest,10
    octave_down
    sound_ret

; ========

DSEQ_Music_BGM2_CH3:
    tempo   144
    notetype 8,4
    volume  12
    panning PAN_CENTER,PAN_CENTER
    wave    13
    octave  2
.loop
    sound_call .block1
    sound_call .block1
    octave_down
    note    F_,10
    note    rest,10
    note    A_,10
    note    rest,10
    note    G_,10
    note    rest,8
    octave_up
    note    C_,10
    octave_down
    note    G_,5
    octave_up
    note    C_,8
    octave_down
    note    G_,5
    note    F_,8
    note    F_,5
    note    G_,10
    note    A_,10
    note    B_,10
    octave_up
    note    C_,8
    octave_down
    note    G_,5
    octave_up
    note    C_,8
    octave_down
    note    A#,10
    note    G_,5
    note    A#,10
    note    A_,10
    note    rest,10
    note    F_,10
    note    rest,10
    note    E_,8
    note    E_,10
    note    A_,11
    note    G_,10
    note    D_,8
    note    D_,5
    note    E_,10
    note    F_,10
    note    F#,10
    note    G_,10
    note    rest,8
    note    G_,13
    note    hold,5
    note    hold,8
    note    G_,5
    note    F_,10
    note    E_,10
    note    D_,10
    octave_up
    sound_call .block1
    note    C_,10
    note    rest,10
    octave_down
    note    A_,10
    note    rest,10
    octave_up
    note    D_,10
    note    rest,8
    octave_down
    note    G_,10
    note    G_,5
    note    B_,10
    octave_up
    note    C_,10
    note    C_,10
    octave_down
    note    A_,10
    note    A_,10
    octave_up
    note    D_,8
    note    D_,10
    octave_down
    note    G_,11
    note    B_,10
    octave_up
    note    C_,10
    note    rest,10
    octave_down
    note    A_,10
    note    rest,10
    octave_up
    note    D_,10
    note    rest,8
    octave_down
    note    G_,10
    note    G_,5
    note    B_,10
    octave_up
    note    C_,10
    note    C_,10
    octave_down
    note    A_,10
    note    A_,10
    note    F_,8
    note    F_,10
    note    G_,5
    note    hold,13
    octave_up
    sound_jump .loop
.block1
    note    C_,10
    note    rest,10
    octave_down
    note    A_,10
    note    rest,10
    octave_up
    note    D_,10
    note    rest,8
    octave_down
    note    G_,10
    note    G_,5
    note    B_,10
    octave_up
    note    C_,10
    note    D_,10
    note    D#,10
    note    E_,10
    note    G_,5
    note    D_,5
    octave_down
    note    A_,5
    note    D_,5
    note    hold,11
    note    G_,5
    note    B_,10
    octave_up
    note    C_,10
    note    rest,10
    octave_down
    note    A_,10
    note    rest,10
    octave_up
    note    D_,10
    note    rest,8
    octave_down
    note    G_,10
    note    G_,5
    note    B_,10
    octave_up
    note    C_,8
    note    C_,5
    octave_down
    note    A_,10
    note    A#,10
    note    B_,10
    octave_up
    note    C_,10
    note    rest,15
    sound_ret

; ========  

DSEQ_Music_BGM2_CH4:    
    volume  7
    notetype 0,4
    tempo   144
    panning PAN_RIGHT,PAN_RIGHT
.loop
    sound_call .block1
    sound_call .block1
    panning PAN_RIGHT,PAN_RIGHT
    notetype 0,4
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    panning PAN_LEFT,PAN_LEFT
    noise   $40
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,5
    note    C_,5
    notetype 0,4
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    panning PAN_LEFT,PAN_LEFT
    noise   $40
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    note    rest,8
    note    C_,5
    note    C_,5
    note    rest,5
    notetype 0,8
    note    C_,5
    notetype 0,4
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    note    C_,5
    notetype 0,8
    note    C_,10
    notetype 0,4
    loopcount 2
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    sound_loop
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,8
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,11
    note    C_,5
    note    hold,13
    note    rest,13
    note    rest,13
    sound_call .block1
    notetype 0,4
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    note    C_,5
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,5
    note    C_,5
    notetype 0,4
    note    C_,5
    note    rest,5
    note    C_,5
    notetype 0,4
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    note    C_,5
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,5
    note    C_,5
    notetype 0,4
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,8
    note    C_,10
    note    rest,5
    notetype 0,4
    note    C_,5
    note    C_,5
    note    C_,5
    sound_jump .loop
.block1
    notetype 0,4
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    note    C_,5
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,5
    note    C_,5
    notetype 0,4
    note    C_,5
    note    rest,5
    note    C_,5
    notetype 0,4
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,8
    noise   $10
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    note    C_,5
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $10
    note    C_,5
    note    rest,8
    note    C_,5
    note    rest,5
    note    C_,5
    noise   $40
    panning PAN_LEFT,PAN_LEFT
    note    C_,5
    panning PAN_RIGHT,PAN_RIGHT
    note    rest,5
    noise   $10
    notetype 0,5
    note    C_,5
    notetype 0,4
    note    C_,5
    note    rest,5
    note    C_,5
    note    C_,5
    note    rest,14
    note    C_,5
    note    C_,5
    notetype 0,5
    note    C_,5
    sound_ret
