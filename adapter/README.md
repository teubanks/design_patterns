# Adapter Pattern
## Description
The adapter pattern is useful when you have two different classes or libraries that you'd like merged into one unified interface. A good example of this would be creating an interface to play different types of media. Let's say you have 3 classes; each one plays a specific type of media, MP3, MOV, and OGG

## Example
```ruby
class MP3Player
  def initialize(file)
    play_mp3(file)
  end
end

class MOVPlayer
  def initialize(file)
    play_mov(file)
  end
end

class OGGPlayer
  def initialize(file)
    play_ogg(file)
  end
end
```

Now assume you want to just call one media player class and have it decide which player class to use based on the file's mime type. You could do something like this

```ruby
class MediaPlayer
  def initialize(file)
    mime_type = get_mime(file)

    player = case mime_type
      when 'mp3'
        MP3Player.new(file)
      when 'mov'
        MOVPlayer.new(file)
      when 'ogg'
        OGGPlayer.new(file)
      default
        raise 'unsupported file type'
    end
  end
end
```

## More examples
You can find more instances of the adapter pattern at work within the Rails codebase. Check out [ActiveRecord's connection adapters](https://github.com/rails/rails/tree/master/activerecord/lib/active_record/connection_adapters)
