class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    create_window
    true
  end

  def create_window
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = LevelController.alloc.init
    @window.makeKeyAndVisible
  end
end
