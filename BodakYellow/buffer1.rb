# Bodak Yellow by Cardi-B

octave_offset = 0.25
use_bpm 125
use_debug false
print "BPM:", current_bpm

# variable
melody_synths = [:pluck, ]
main_melody = [:B3, :C4, :E4, :B3, :C4, :E4, :B3, :C4, :B3, :C4, :E4, :B3, :C4, :E4, :B3, :E4]

bodak_drumkits = "D:/Works/Sonicpy_popSongs/BodakYellow/drum_kit/"
bodak_808 = bodak_drumkits, "808"
bodak_808_2 = bodak_drumkits, "808_2"
basses = [bodak_808, bodak_808_2]
bass_melody = [
  [0, 0.5],
  [1, 0.5],
  [0, 0.25],
  [1, 0.25],
  [0, 0.25],
  [1, 0.25],
  [0, 0.5],
  [0, 0.25],
  [0, 0.5],
  [0, 0.75]]

snare_time = 0.5
bass_time = 0.5

# function

define :play_pattern_samples do |samplelist, patterns|
  patterns.count.times do
    pattern = patterns.tick
    sample samplelist[pattern[0]]
    sleep pattern[1]
  end
  tick_reset
end


# Main Melody
live_loop :melody do
  use_synth melody_synths.choose
  print "current synth: ", current_synth
  use_synth_defaults release: 3, pluck_decay: 50, substain: 2, amp: 0.5, amp_slide: 5
  use_octave 0
  use_octave -1 if one_in(6) # 1/6 change to drop octave
  print "melody octave: ", current_octave
  with_fx :flanger, feedback: 0.2, mix: 1, delay: 5, depth: 3 do
    with_fx :reverb, room: 1, amp: 1 do
      play_pattern main_melody
    end
  end
  print "melody beat:", beat
end

# Snare
live_loop :snare do
  snare_time = 0.5
  snare_time = 0.25 if one_in(4)
  with_fx :reverb, room: 1, damp: 0.2, amp: 0.2 do
    8.times do
      sample :drum_cymbal_closed, rate: 0.75
      sleep snare_time
    end
    print "snare beat:", beat
  end
end

# BASSSSS!!!!!
live_loop :sbass do
  with_fx :reverb, room: 1, damp: 0.5 do
    sleep 32 if beat<32
    use_sample_defaults amp: 2, rate: 1
    play_pattern_samples basses, bass_melody
    play_pattern_samples basses, bass_melody
    sleep 24
    print "bass beat:", beat
  end
end

