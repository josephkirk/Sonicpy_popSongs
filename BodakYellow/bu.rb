# Bodak Yellow by Cardi-B

octave_offset = 0.25
use_bpm 125
use_debug false
print "BPM:", current_bpm

melody_synths = [:pluck, ]
main_melody = [:B3, :C4, :E4, :B3, :C4, :E4, :B3, :C4, :B3, :C4, :E4, :B3, :C4, :E4, :B3, :E4]

in_thread do
  live_loop :melody do
    use_synth melody_synths.choose
    print "current synth: ", current_synth
    use_synth_defaults release: 3, pluck_decay: 50, substain: 2, amp: 0.5, amp_slide: 5
    use_octave 0
    use_octave -1 if one_in(6) # 1/6 change to drop octave
    print "melody octave: ", current_octave
    with_fx :flanger, spread:16, mix:1, room:10, delay: 5 do
      with_fx :reverb, room: 1, amp: 1.5 do
        play_pattern main_melody
      end
    end
  end
end

snare_time = 0.5
live_loop :snare do
  4.times do
    sample :drum_cymbal_closed, rate: 0.75
    sleep snare_time
  end
  sample :drum_cymbal_closed, rate: 0.75
  sample :drum_cymbal_pedal, rate: 0.75
  sleep snare_time*4
end
