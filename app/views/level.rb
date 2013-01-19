class Level < UIView
  def initWithFrame(*args)
    super
    @world = World.new
    @world.setupWorld
    (1..5).each do |item|
        @blue_view = Box.alloc.initWithFrame CGRectMake(5 + item*2, 5 + item*2, 50, 50)
        self.addSubview @blue_view
        @world.addBox @blue_view
    end

    @timer = NSTimer.scheduledTimerWithTimeInterval(1.0/60.0, target:self, selector:'timeHandler:', userInfo:nil, repeats:true)

    self
  end

  def timeHandler(sender)
    @world.tick
  end
end
