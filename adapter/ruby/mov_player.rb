class MOVPlayer
  attr :mov_file

  def initialize(file)
    @mov_file = file
  end

  def show_movie
    puts "showing the movie #{mov_file}"
  end
end
