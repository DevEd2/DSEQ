DSEQ_Music_CourseSelect_CH1:    
    tempo   80
    vibrato 8,16,8
    octave  3
    panning 3,1
    pulse   0,2,4
    notetype 4,7
    volume  5
.loop
    note    D_,5
    octave_down
    note    B_,5
    note    F_,5
    note    hold,15
    note    C_,13
    octave_down
    note    B_,13
    octave_up
    note    D_,5
    note    G_,5
    octave_up
    note    C_,5
    note    hold,15
    octave_down
    note    B_,13
    note    hold,13
    octave_up
    sound_jump .loop

; ================

DSEQ_Music_CourseSelect_CH2:    
    tempo   80
    vibrato 8,16,8
    octave  3
    panning 3,2
    pulse   0,2,4
    notetype 4,7
    volume  5
.loop
    note    rest,3
    note    C_,5
    octave_down
    note    G_,5
    note    D_,3
    note    hold,15
    note    hold,13
    note    hold,13
    note    rest,3
    note    F_,5
    note    B_,5
    octave_up
    note    D_,3
    note    hold,15
    note    hold,13
    note    hold,13
    sound_jump .loop


; ================

DSEQ_Music_CourseSelect_CH3:    
    tempo   80
    notetype 4,4
    volume  12
    panning 3,3
    wave    6
    octave  1
.loop
    loopcount  4
    note    G_,10
    note    G_,7
    note    G_,7
    note    G_,10
    note    G_,7
    note    G_,7
    sound_loop
    sound_jump .loop
