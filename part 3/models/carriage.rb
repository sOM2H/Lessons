class Carriage
  attr_reader :type

  def initialize(type)
    @type = type

    validate!
  end

  private

  def validate!
    raise ArgumentError.new("Carriage type class must equals 'String'") unless @type.class.name == "String"
    raise ArgumentError.new("Carriage type must equals 'passenger' or 'cargo'") unless @type == 'passenger' || @type == 'cargo'
  end
end