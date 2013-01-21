class Box
  def initWithFrame(frame)
    super
    if self
      self.layer.cornerRadius = 3.0
      self.layer.masksToBounds = true
      self.backgroundColor = backgroundImage
      self.exclusiveTouch  = true
    end
    self
  end

  def backgroundImage
    width, height = viewSize
    if width == 24 && height == 24
      color = "blue"
    elsif width == 24*2 && height == 24
      color = "red"
    elsif width == 24*3 && height == 24
      color = "green"
    elsif width == 24*2 && height == 24*2
      color = "orange"
    elsif width == 24 && height == 24*3
      color = "purple"
    else
      color = "blue"
    end

    image_path = "images/#{color}_gradient@2x.png"
    UIColor.colorWithPatternImage(UIImage.imageNamed(image_path))
  end

  def viewSize
    return self.bounds.size.width, self.bounds.size.height
  end

  def placeAtEvent(event, withAngle: angle)
    touch = event.allTouches.anyObject
    location = touch.locationInView(self.superview)
    self.setCenter(location)
    self.destroyBody()
    self.addBody()
    self.worldBridge.clearActive
  end

  def touchesEnded(touches, withEvent: event)
    self.worldBridge.activeBox = self
  end


end
