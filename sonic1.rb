with_fx :reverb, room: 0.9 do
  live_loop :chords do
    use_synth :piano
    play_chord [:e4,:g4, :b4, :cs4,:fs5,:gs5,:as5],release: 8, pan: -1, amp: 1
    sleep 4
  end
  
  live_loop :chords2 do
    use_synth :bass_foundation
    play_chord [:e2,:g2,:c3,:d4],release: 0.2, pan: rrand(-0.9,0.9), amp: 0.8
    sleep 0.3333
  end
  
  live_loop :mel do
    sample :ambi_choir, rpitch: 4, amp: 0.5
    sleep 0.25
  end
end
live_loop :bass1 do
  with_fx :reverb, room: 0.9 do
    with_fx :slicer, phase: 0.125  do
      use_synth :bass_foundation
      play 36,attack: 500,amp: 4, pan: rrand(-0.9,0.9)
      sleep 6
    end
  end
end

with_fx :lpf, cutoff: 100 do
  live_loop :bass2 do
    use_synth :piano
    play (octs (knit :E1, 2, :E2, 2, :G2, 2, :E2, 2, :C1, 2, :C2, 1, :E2, 1 ).tick, 2), amp: 5, release: 0.2
    sleep 0.25
  end
end
live_loop :arp do
  with_fx :slicer, phase: 0.13 do
    if one_in(2)
      use_synth :pretty_bell
      play chord(:e4, :m13).choose, amp: 0.4,pan: 1
      sleep 1
    else
      use_synth :prophet if one_in(2)
      play chord(:e4, :m11).choose, amp: 0.4, pan: -1
      sleep 1
    end
  end
end

live_loop :ryth1 do
  sample :drum_heavy_kick,amp: 10
  sleep 0.5
  
  
end