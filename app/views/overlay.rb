class Overlay < UIView
  def initWithFrame(*args)
    super
    setupView
    setupScore
    self
  end

  def setupScore
    @score = 500
    labelFrame = CGRectMake(0, 0, self.bounds.size.width, 50)
    @scoreLabel = UILabel.alloc.initWithFrame(labelFrame)
    @scoreLabel.textColor = UIColor.whiteColor
    @scoreLabel.backgroundColor = UIColor.blackColor
    @scoreLabel.text = "Score: #{@score}"
    self.addSubview @scoreLabel
  end

  def setupView
    # self.backgroundColor = UIColor.greenColor
    # self.alpha = 0.5
  end

  def pointInside(point, withEvent: event)
    #pass any events to next view
    false
  end

end
