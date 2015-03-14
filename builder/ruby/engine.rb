class Engine
  ENGINE_SIZES = [ 2, 4, 6, 8, 10, 12 ]
  ENGINE_TYPES = [ :vee, :straight ]

  attr :engine_size, :engine_type
  def initialize(engine_size, engine_type)
    # Unimplemented: validate engine size and engine type
    @engine_size = engine_size
    @engine_type = engine_type
  end

  def friedly_engine_name
    case engine_type
    when :vee
      "v#{engine_size}"
    when :straight
      "Straight #{engine_size}"
    end
  end
end

