c= [chord(:Eb, :major7), chord(:Db, :major7), chord(:Fb, :major7)]
loop do
  d = c.tick.ring.shuffle
  5.times do
    play d.choose, release: 0.1
    sleep 0.25
  end
  play d.choose, release: 0.1
  sleep 0.5
end