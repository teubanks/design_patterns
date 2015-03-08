class MediaPlayer
  class << self
    def play(file)
      mime_type = get_mime(file)
      player_adapter = MediaAdapter.new(file, mime_type)
      player_adapter.play
    end

    # imagine this function examines a file and pulls out its mime type
    def get_mime(file)
      file[-3..-1]
    end
  end
end

