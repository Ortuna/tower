class Box
  def initWithFrame(frame)
    super
    if self
      self.layer.cornerRadius = 3.0
      self.layer.masksToBounds = true

      background = UIColor.colorWithPatternImage(UIImage.imageNamed("images/orange_gradient@2x.png"))
      self.backgroundColor = background
      self.exclusiveTouch  = true
    end
    self
  end

  def touchesBegan(touches, withEvent: event)
    self.destroyBody
    @touchStart = touches.anyObject.locationInView(self)
  end

  def touchesMoved(touches, withEvent: event)
    point = touches.anyObject.locationInView(self)
    self.center = CGPointMake(self.center.x + point.x - @touchStart.x, self.center.y + point.y - @touchStart.y);
  end

  def touchesEnded(touches, withEvent: event)
    self.addBody
  end
end
