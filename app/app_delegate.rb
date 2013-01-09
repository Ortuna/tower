class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    create_window
    create_level_view
    true
  end

  def create_level_view
    @level_view = Level.initWithWindow @window
  end

  def create_window
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.makeKeyAndVisible
  end
end
