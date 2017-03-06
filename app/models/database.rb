class VariableDatabase
  attr_reader :data

  def initialize()
    @data = {}
  end

  def add(hash)
    @data[hash.keys[0]] = hash.values[0]
  end

  def get(key)
    return {key=>@data[key]} if key_not_nil?(key)
    {}
  end

  private
  
  def key_not_nil?(key)
    @data[key] != nil
  end
end
