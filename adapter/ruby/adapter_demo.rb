require_relative 'media_adapter'
require_relative 'media_player'
require_relative 'mov_player'
require_relative 'mp3_player'
require_relative 'ogg_player'

class AdapterDemo
  def self.run_demo
    MediaPlayer.play('Blink 182 - All the Small Thigs.mp3')
    MediaPlayer.play('Masquerade.mov')
    MediaPlayer.play('Metric - Give Simpathy.ogg')
    MediaPlayer.play('Death Cab for Cutie - Grapevine Fires.aac')
  end
end

AdapterDemo.run_demo
