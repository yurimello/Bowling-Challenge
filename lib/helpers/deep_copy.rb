# This module deep copy objects
module DeepCopy
  def deep_copy(object)
    Marshal.load(Marshal.dump(object))
  end
end
