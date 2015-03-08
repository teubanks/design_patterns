# Adapter Pattern
## Description
The adapter pattern is useful when you have two different classes or libraries that you'd like merged into one unified interface. A good example of this would be creating an interface to play different types of media. Let's say you have 3 classes; each one plays a specific type of media, MP3, MOV, and OGG

## Example

Here are three classes that we want to create a unified interface for

```ruby
class MOVPlayer
  attr :mov_file

  def initialize(file)
    @mov_file = file
  end

  def show_movie
    puts "showing the movie #{mov_file}"
  end
end

class MP3Player
  attr :mp3_file

  def initialize(file)
    @mp3_file = file
  end

  def play_mp3
    puts "playing MP3: #{mp3_file}"
  end
end

class OGGPlayer
  attr :ogg_file

  def initialize(file)
    @ogg_file = file
  end

  def play_ogg
    puts "playing ogg file: #{ogg_file}"
  end
end
```

First, we create our adapter class to determine which path should be taken based on what file it's been given

```ruby
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
```

Now we can create our player class to call the adapter class

```ruby
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
```

Finally, let's run it all

```ruby
class AdapterDemo
  def self.run_demo
    MediaPlayer.play('Blink 182 - All the Small Thigs.mp3')
    MediaPlayer.play('Masquerade.mov')
    MediaPlayer.play('Metric - Give Simpathy.ogg')
    MediaPlayer.play('Death Cab for Cutie - Grapevine Fires.aac')
  end
end
```

output:

```
ruby adapter/ruby/adapter_demo.rb
>> playing MP3: Blink 182 - All the Small Thigs.mp3
>> showing the movie Masquerade.mov
>> playing ogg file: Metric - Give Simpathy.ogg
>> design_patterns/adapter/ruby/media_adapter.rb:20:in `initialize_player': unsupported file type `aac' (RuntimeError)
```

## More examples
You can find more instances of the adapter pattern at work within the Rails codebase. Check out [ActiveRecord's connection adapters](https://github.com/rails/rails/tree/master/activerecord/lib/active_record/connection_adapters)
