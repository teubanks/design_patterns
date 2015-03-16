# Builder Pattern
The Builder Pattern breaks down the task of creating a complex object by composing smaller objects using a step by step approach.

## Example
Let's do something very cliché. I like cliché. Let's use the builder pattern to create a new car

First, let's enumerate the various objects that will make up the car. We'll start with the engine

```ruby
class Engine
  ENGINE_SIZES = [ 2, 4, 6, 8, 10, 12 ]
  ENGINE_TYPES = [ :vee, :straight ]

  attr :engine_size, :engine_type
  def initialize(engine_size: engine_size, engine_type: engine_type)

    # Unimplemented: validate engine size and engine type
    @engine_size = engine_size
    @engine_type = engine_type
  end

  def friendly_engine_name
    case engine_type
    when :vee
      "v#{engine_size}"
    when :straight
      "Straight #{engine_size}"
    end
  end
end
```

Next, let's see what a frame looks like
```ruby
class Frame
  FRAME_TYPES = [ :car, :truck ]

  attr :frame_type
  def initialize(frame_type: frame_type)
    # Unimplemented: validate frame types
    @frame_type = frame_type
  end
end
```

And now, the body of the car
```ruby
class Body
  BODY_TYPES = [ :coupe, :sedan, :sport ]

  attr :body_type
  def initialize(body_type: body_type)
    # Unimplemented: validate body type
    @body_type = body_type
  end
end
```

Finally, the car class that uses the above classes as components
```ruby
class Car
  attr :frame, :engine, :body
  def set_frame(frame)
    @frame = frame
  end

  def set_engine(engine)
    @engine = engine
  end

  def set_body(body)
    @body = body
  end

  # Cars require yearly inspections in most states. That's not what this
  # method does though. This just prints the cars attributes using a very
  # familiar Ruby/Rails method name
  def inspect
    puts "#{frame.frame_type} has a #{engine.friendly_engine_name}"
    puts "With a body type of #{body.body_type}"
  end
end
```

Now, we'll show how we can use the builder pattern to create a car from these various components
```ruby
class BuilderDemo
  attr :default_frame, :default_engine, :default_body

  def self.build_me_a_car(args={})
    builder_instance = self.new

    frame_attributes = args.fetch(:frame_attributes, builder_instance.default_frame)
    engine_attributes = args.fetch(:engine_attributes, builder_instance.default_engine)
    body_attributes = args.fetch(:body_attributes, builder_instance.default_body)

    frame  = builder_instance.build_frame(frame_attributes)
    engine = builder_instance.build_engine(engine_attributes)
    body   = builder_instance.build_body(body_attributes)

    new_car = Car.new
    new_car.set_frame(frame)
    new_car.set_engine(engine)
    new_car.set_body(body)
    new_car.inspect
  end

  def initialize
    @default_frame = {frame_type: :car}
    @default_engine = {engine_size: 8, engine_type: :vee}
    @default_body = {body_type: :sport}
  end

  def build_frame(frame_attributes)
    Frame.new(frame_attributes)
  end

  def build_engine(engine_attributes)
    Engine.new(engine_attributes)
  end

  def build_body(body_attributes)
    Body.new(body_attributes)
  end
end
```

And Voila! A builder demo!
