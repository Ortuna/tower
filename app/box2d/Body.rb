class Body < UIView
  attr_accessor :static

  def initWithFrame(*args)
    super
    self.static = false
    self
  end

  def is_static?
    static
  end
end
