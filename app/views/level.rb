class Level < UIScrollView
  def initWithFrame(*args)
    super
    levelSetup

    @world = World.new
    @world.setupWorld(self.contentSize.width, height: self.contentSize.height)

    @box_pixel_scale = 24
    (1..10).each do |item|
        width = Random.rand(3) + 1
        height = Random.rand(3) + 1
        @blue_view = Box.alloc.initWithFrame CGRectMake(5 + item*2, 5 + item*2,
          @box_pixel_scale*width,
          @box_pixel_scale*height
        )
        self.addSubview @blue_view
        @world.addBox @blue_view
    end
    @timer = NSTimer.scheduledTimerWithTimeInterval(1.0/60.0,
      target:self,
      selector:'timeHandler:',
      userInfo:nil,
      repeats:true
    )

    self
  end

  def timeHandler(sender)
    @world.tick
  end

  def levelSetup
    size = CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height+1000)
    self.setContentSize(size)
  end

  def touchesEnded(touches, withEvent: event)
    active_box = @world.activeBox
    active_box.placeAtEvent(event, withAngle: 0) if active_box
  end
end
