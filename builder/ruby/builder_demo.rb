# This demo requires passing in a list of arguments. There are multiple ways
# to do this type of thing, which can get hefty. One solution is to
# create methods for each type of object you want to build (ie, creating a
# method called build_ford_f150 that knows exactly how to build an F150)
# Another solution would be to retain flexibility while making the interface a
# bit different by accepting a block to the build_me_a_car method which would
# allow the programmer to set attributes within the block
# ```ruby
# BuilderDemo.build_me_a_car do |builder|
#   builder.frame_type = :truck
#   builder.engine_size = 6
#   ....
# end
# ```
#
# All three of these solutions have their drawbacks
class BuilderDemo
  class << self
    def build_me_a_car(args)
      frame_attributes = args.fetch(:frame_attributes, default_frame)
      engine_attributes = arges.fetch(:engine_attributes, default_engine)
      body_attributes = args.fetch(:body_attributes, default_body)

      frame  = build_frame(frame_attributes)
      engine = build_engine(engine_attributes)
      body   = build_body(body_attributes)

      new_car = Car.new
      new_car.set_frame(frame)
      new_car.set_engine(engine)
      new_car.set_body(body)
      new_car.inspect
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
end
