class LevelController < UIViewController
  def viewDidLoad
    super
    view = self.view
    @level = Level.alloc.initWithFrame(CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height))

    @level.backgroundColor = UIColor.whiteColor
    view.addSubview @level
  end

end
