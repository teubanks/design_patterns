# MediaAdapter acts as a middle man between MediaPlayer and the various other
# player classes

class MediaAdapter
  attr :file, :type, :player
  def initialize(file, type)
    @file, @type = file, type
    @player = initialize_player
  end

  def initialize_player
    case type
    when 'mp3'
      MP3Player.new(file)
    when 'mov'
      MOVPlayer.new(file)
    when 'ogg'
      OGGPlayer.new(file)
    else
      raise "unsupported file type '#{type}'"
    end
  end

  def play
    case type
    when 'mp3'
      player.play_mp3
    when 'mov'
      player.show_movie
    when 'ogg'
      player.play_ogg
    end
  end
end
