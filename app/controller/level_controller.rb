class LevelController < UIViewController
  def viewDidLoad
    super
    self.view.addSubview levelView
    self.view.addSubview overlayView
  end

  def levelView
    @level ||= createView(Level, screenSize)
    @level
  end

  def overlayView
    @overlay ||= createView(Overlay, screenSize)
    @overlay
  end

  def screenSize
    UIScreen.mainScreen.bounds.size
  end

  def createView(klass, size)
    view = klass.alloc.initWithFrame(CGRectMake(0, 0, size.width, size.height))
  end

end
