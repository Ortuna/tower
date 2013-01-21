class World
  attr_accessor :activeBox

  def activeBox=(box)
    @activeBox.setAlpha(1) if @activeBox
    @activeBox = box
    box.setAlpha(0.5)
  end

  def clearActive
    @activeBox.setAlpha(1) if @activeBox
    @activeBox = nil
  end
end
