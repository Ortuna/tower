class Level < UIScrollView

  def self.initWithWindow(window)
    view = UIScrollView.alloc.initWithFrame(CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height))
    view.backgroundColor = UIColor.whiteColor
    view.setContentSize(CGSizeMake(view.size.width, view.size.height + 100))

    window.addSubview(view)
    view
  end
end
