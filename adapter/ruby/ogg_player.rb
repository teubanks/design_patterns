class OGGPlayer
  attr :ogg_file

  def initialize(file)
    @ogg_file = file
  end

  def play_ogg
    puts "playing ogg file: #{ogg_file}"
  end
end

