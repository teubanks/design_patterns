class MP3Player
  attr :mp3_file

  def initialize(file)
    @mp3_file = file
  end

  def play_mp3
    puts "playing MP3: #{mp3_file}"
  end
end


