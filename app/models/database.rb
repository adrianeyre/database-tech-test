class VariableDatabase
  attr_reader :data

  def initialize()
    @data = {}
  end

  def add(key, value)
    @data[key] = value
  end

  def get(key)
    return {key=>@data[key]} if key_not_nil?(key)
    {}
  end

  def key_not_nil?(key)
    @data[key] != nil
  end
end
