# Welcome to Sonic Pi

loop do
  sample :perc_bell, rate: (rrand 0.124, 1.5)
  
  sleep rrand(0, 2)
  
  with_fx :reverb, mix: 0.2 do
    play scale(:Eb2, :minor_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
    
    sleep 0.1
    
  end
  
  with_fx :bitcrusher, mix: 0.5 do
    
    s = synth [:dark_ambience, :bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0.2, 4), subtain: rrand(1, 2), release: rrand(1, 3), cutoff_slide: rrand(1, 3), cutoff: rrand(60, 80), pan: rrand(-1, 1), pan_slide: 1, amp: rrand(0.5, 1)
    
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 115)
    
    sleep rrand(2, 3)
    
  end
  
end

