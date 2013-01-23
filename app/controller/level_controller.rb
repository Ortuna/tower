class LevelController < UIViewController
  def viewDidLoad
    super
    self.view.addSubview createLevelView
  end

  def createLevelView
    level = createView(Level, screenSize)
    level.backgroundColor = UIColor.blackColor
    level
  end

  def createOverlayView
    overlay = creaetView(Overlay, screenSize)
    overlay.backgroundColor = UIColor.blackColor
    overlay
  end

  def screenSize
    UIScreen.mainScreen.bounds.size
  end

  def createView(klass, size)
    view = klass.alloc.initWithFrame(CGRectMake(0, 0, size.width, size.height))
  end

end
