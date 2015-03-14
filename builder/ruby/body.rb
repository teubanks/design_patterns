class Body
  BODY_TYPES = [ :coupe, :sedan, :sport ]

  attr :body_type
  def initialize(body_type)
    # Unimplemented: validate body type
    @body_type = body_type
  end
end
