class Level < UIView
  def initWithFrame(*args)
    super
    @world = World.new
    @blue_view = Body.alloc.initWithFrame CGRectMake(100, 100, 50, 50)
    @blue_view.backgroundColor = UIColor.blueColor
    self.addSubview @blue_view
    @world.add_body(@blue_view)

    @red_view = Body.alloc.initWithFrame CGRectMake(100, 200, 50, 50)
    @red_view.backgroundColor = UIColor.redColor
    @red_view.static = true
    self.addSubview @red_view
    @world.add_body(@red_view)

    transform = CGAffineTransformMakeRotation(3.14159/4)
    @red_view.transform = transform

    @time_step = 1/60
    @timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector:'timeHandler:', userInfo:nil, repeats:true)

    self
  end

  def timeHandler(sender)
    @world.step(@time_step)
  end
end
