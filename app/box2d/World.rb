class World

  def initialize
    @bodies = []
  end

  def add_body(body)
    @bodies << body
  end

  def remove_body(body)
    @bodies.delete(body)
  end

  def step(dt)
    calculate_collision
    step_bodies dt
  end

  def calculate_collision
    @bodies.each do |body|
      @bodies.each do |body2|
        next if body == body2
        if(CGRectIntersectsRect(body.frame, body2.frame))
          body.static = true
          body2.static = true
        end
      end
    end
  end

  def step_bodies(dt)
    @bodies.each do |body|
      next if body.is_static?
      body.position = CGPointMake(body.position.x, body.position.y + 1)
    end
  end
end
