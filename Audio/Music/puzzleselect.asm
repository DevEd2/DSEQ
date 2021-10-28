DSEQ_Music_PuzzleSelect_CH1:    
    tempo   120
    pulse   0,2,4
    panning 3,1
    volume  9
    octave  2
    vibrato 24,16,6
.loop
    notetype 4,8
    note    F_,9
    notetype 4,5
    note    A#,7
    note    rest,10
    note    F_,7
    note    F_,4
    note    A#,7
    note    F_,7
    notetype 4,8
    note    E_,9
    notetype 4,5
    note    A#,7
    note    rest,10
    note    E_,7
    note    E_,4
    note    A#,7
    note    E_,7
    notetype 4,8
    note    D#,9
    notetype 4,5
    note    A#,7
    note    rest,10
    note    D#,7
    note    D#,4
    note    A#,7
    note    D#,7
    note    D_,7
    notetype 4,8
    note    D_,7
    note    D#,4
    note    D_,4
    note    D#,4
    notetype 4,5
    note    F_,4
    note    hold,13
    sound_jump .loop

; ================

DSEQ_Music_PuzzleSelect_CH2:    
    tempo   120
    pulse   0,2,4
    panning 3,2
    volume  7
    octave  2
    vibrato 24,16,6
.loop
    notetype 4,8
    note    C_,9
    notetype 4,5
    note    F_,7
    note    rest,10
    note    C_,7
    note    C_,4
    note    F_,7
    note    C_,7
    octave_down
    notetype 4,8
    note    A#,9
    notetype 4,5
    octave_up
    note    E_,7
    note    rest,10
    octave_down
    note    A#,7
    note    A#,4
    octave_up
    note    E_,7
    octave_down
    note    A#,7
    notetype 4,8
    note    A#,9
    notetype 4,5
    octave_up
    note    D#,7
    note    rest,10
    octave_down
    note    A#,7
    note    A#,4
    octave_up
    note    D#,7
    octave_down
    note    A#,7
    note    A#,7
    notetype 4,8
    note    A#,7
    octave_up
    note    C_,4
    octave_down
    note    A#,4
    octave_up
    note    C_,4
    notetype 4,5
    note    D_,4
    note    hold,13
    sound_jump .loop

; ================

DSEQ_Music_PuzzleSelect_CH3:    
    tempo   120
    wave    6
    notetype 8,5
    panning 3,3
    volume  14
    octave  2
.loop
    loopcount 3
    note    D_,9
    note    C_,9
    octave_down
    note    A_,7
    note    A#,9
    octave_up
    note    F_,9
    octave_down
    note    F_,7
    octave_up
    sound_loop
    note    D_,9
    note    C_,9
    octave_down
    note    F_,7
    octave_up
    note    F_,9
    note    D#,9
    octave_down
    note    F_,7
    octave_up
    sound_jump .loop

; ================

DSEQ_Music_PuzzleSelect_CH4:    
    volume  9
    tempo   120
    notetype 3,5
.loop
    loopcount 3
    noise   $20
    panning 1,1
    note    rest,7
    note    C_,4
    note    rest,4
    noise   $30
    panning 2,2
    note    C_,4
    note    C_,4
    note    rest,4
    noise   $20
    panning 1,1
    note    C_,4
    note    rest,4
    note    C_,4
    note    rest,4
    note    C_,4
    noise   $30
    panning 2,2
    note    C_,4
    note    rest,4
    note    C_,4
    note    rest,4
    sound_loop
    note    rest,7
    noise   $20
    panning 1,1
    note    C_,4
    note    rest,4
    noise   $30
    panning 2,2
    note    C_,4
    note    C_,4
    note    rest,4
    noise   $20
    panning 1,1
    note    C_,2
    note    C_,2
    note    C_,4
    note    rest,1
    note    C_,4
    note    rest,1
    note    C_,4
    note    rest,1
    note    C_,4
    note    rest,4
    note    C_,4
    note    rest,4
    sound_jump .loop
