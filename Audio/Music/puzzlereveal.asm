DSEQ_Music_PuzzleReveal_CH1:    
    tempo   120
    volume  9
    notetype 4,4
    panning 3,2
    pulse   1,1,4
    vibrato 24,16,8
    octave  3
DSEQ_Music_PuzzleReveal_loop:
    loopcount 2
    note    G_,7
    octave_down
    note    G_,7
    octave_up
    note    D_,7
    octave_down
    note    G_,7
    octave_up
    note    C_,7
    octave_down
    note    G_,7
    note    G_,7
    octave_down
    note    G_,7
    octave_up
    note    D_,7
    octave_down
    note    G_,7
    octave_up
    note    C_,7
    octave_down
    note    G_,7
    octave_up
    octave_up
    sound_loop
    loopcount 2
    note    F_,7
    octave_down
    note    F_,7
    octave_up
    note    C_,7
    octave_down
    note    F_,7
    note    A#,7
    note    F_,7
    note    F_,7
    octave_down
    note    F_,7
    octave_up
    note    C_,7
    octave_down
    note    F_,7
    note    A#,7
    note    F_,7
    octave_up
    octave_up
    sound_loop
    note    D#,7
    octave_down
    note    D#,7
    note    A#,7
    note    D#,7
    note    G#,7
    note    D#,7
    note    D#,7
    octave_down
    note    D#,7
    note    A#,7
    note    D#,7
    note    G#,7
    note    D#,7
    octave_up
    octave_up
    note    F_,7
    octave_down
    note    F_,7
    octave_up
    note    C_,7
    octave_down
    note    F_,7
    note    A#,7
    note    F_,7
    note    F_,7
    octave_down
    note    F_,7
    octave_up
    note    C_,7
    octave_down
    note    F_,7
    note    A#,7
    note    F_,7
    octave_up
    octave_up
    sound_jump DSEQ_Music_PuzzleReveal_loop

; ================

DSEQ_Music_PuzzleReveal_CH2:    
    tempo   120
    volume  4
    notetype 4,4
    panning 3,1
    pulse   1,1,4
    vibrato 24,16,8
    octave  3
    pitch_offset 20
    note    rest,8
    sound_jump DSEQ_Music_PuzzleReveal_loop

; ================

DSEQ_Music_PuzzleReveal_CH3:    
    tempo   120
    volume  8
    notetype 4,4
    panning 3,2
    wave    2
    octave  4
    pitch_offset 40
    note    rest,11
    sound_jump DSEQ_Music_PuzzleReveal_loop
