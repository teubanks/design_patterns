# The final product of the builder demo
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
