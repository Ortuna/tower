class Box
  def touchesBegan(touches, withEvent: event)
    @touchStart = touches.anyObject.locationInView(self)
    self.destroyBody
  end

  def touchesMoved(touches, withEvent: event)
    point = touches.anyObject.locationInView(self)
    self.center = CGPointMake(self.center.x + point.x - @touchStart.x, self.center.y + point.y - @touchStart.y);
  end

  def touchesEnded(touches, withEvent: event)
    self.addBody
  end
end
