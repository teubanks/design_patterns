class Frame
  FRAME_TYPES = [ :car, :truck ]

  attr :frame_type
  def initialize(frame_type: frame_type)
    # Unimplemented: validate frame types
    @frame_type = frame_type
  end
end
