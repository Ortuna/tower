class Level < UIScrollView
  def initWithFrame(*args)
    super
    setupLevel
    setupWorld
    createBoxes
    scrollToBottom
    setupTimer
    self
  end

  def createBoxes
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
  end

  def timeHandler(sender); @world.tick; end

  def setupWorld
    @world = World.new
    @world.setupWorld(self.contentSize.width, height: self.contentSize.height)
  end

  def setupTimer
    @timer = NSTimer.scheduledTimerWithTimeInterval(1.0/60.0,
      target:self,
      selector:'timeHandler:',
      userInfo:nil,
      repeats:true
    )
    #Run timers while scrolling
    #http://stackoverflow.com/questions/605027/uiscrollview-pauses-nstimer-until-scrolling-finishes
    NSRunLoop.mainRunLoop.addTimer(@timer, forMode: NSRunLoopCommonModes)
  end

  def setupLevel
    @box_pixel_scale = 24
    self.backgroundColor = UIColor.blackColor
    width  = UIScreen.mainScreen.bounds.size.width
    height = UIScreen.mainScreen.bounds.size.height * 3
    size   = CGSizeMake(width, height)
    self.setContentSize(size)
    self.setShowsHorizontalScrollIndicator false
    self.setShowsVerticalScrollIndicator false
  end

  def scrollToBottom
    bottomOffset = CGPointMake(0, self.contentSize.height-self.bounds.size.height)
    self.setContentOffset(bottomOffset, anitmated: false)
  end

  def touchesEnded(touches, withEvent: event)
    active_box = @world.activeBox
    active_box.placeAtEvent(event, withAngle: 0) if active_box
  end
end
