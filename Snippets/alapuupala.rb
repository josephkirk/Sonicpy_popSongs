# Alapu upala - Godzilla Singular point song
# 3/4
use_bpm 96
octave_loop = [1,-4].ring
amp_loop = [1, ].ring
notes = [
  [:d4, :e4, :f4, :e4, :d4, :a4],
  [:g4 , :a4, :g4, :f4, :e4, :f4, :d4],
  [:d4, :e4, :f4, :e4, :d4, :a4, :a4, :a4],
  [:a4, :g4 , :a4, :g4, :f4, :e4, :f4, :d4],
  [:d4, :e4, :f4, :e4, :d4, :db4, :e4],
  [:e4, :f4, :g4, :f4, :e4, :f4, :d4],
  [:f4, :g4, :a4, :g4, :f4, :e4, :bb4],
  [:a3, :ab3, :db4, :e4, :f4, :d4],
].ring
note_timmings = [
  [1, 0.5, 0.5, 0.5, 0.5, 3],
  [1, 0.5, 0.5, 0.5, 0.5, 1, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 1, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 1, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 1, 2],
  [1, 0.5, 0.5, 0.5, 0.5, 3]
].ring

live_loop :melody do
  tick
  # tick advance beat
  # look return current tick
  with_fx :reverb, room: 1, damp: 0.25, amp: 0.25 do
    with_synth :fm do
      play_pattern_timed notes.look, note_timmings.look, amp: amp_loop.look, octave: octave_loop.look, attack: 0.0, sustain: 0.5, subtain_level: 1, release: rrand(1,2)
    end
  end
end

live_loop :melody2 do
  tick
  # tick advance beat
  # look return current tick
  with_fx :reverb, room: 1, damp: 1, amp: 0.5 do
    with_synth :kalimba do
      play_pattern_timed notes.look, note_timmings.look, amp: amp_loop.look, octave: octave_loop.look, attack: 0.0, sustain: 0.5, subtain_level: 0.4, release: rrand(1,2)
    end
  end
end