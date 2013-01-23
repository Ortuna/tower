#import "World.h"

@implementation World
  @synthesize world;

-(void) setupWorld:(float)width
            height:(float)height
{
  self.worldSize = CGSizeMake(width, height);
  [self setupGravity];
  [self createBounds];
}

-(void) setupGravity
{
  b2Vec2 gravity;
  gravity.Set(0.0f, -50.00f);
  self.world = new b2World(gravity);
}

-(void) createBounds
{

  CGSize screenSize = self.worldSize;

  float width  = screenSize.width/PTM_RATIO;
  float height = screenSize.height/PTM_RATIO;
  float ratio  = -(height/1.53333);

  //bottom
  [self createEdge: b2Vec2(0, ratio)
                v2: b2Vec2(width, ratio)];
  //top
  [self createEdge: b2Vec2(0,height)
                v2: b2Vec2(width, height)];
  //left
  [self createEdge: b2Vec2(0,height)
                v2: b2Vec2(0,ratio)];
  //right
  [self createEdge: b2Vec2(width, height)
                v2: b2Vec2(width, ratio)];
}

-(void) createEdge:(b2Vec2) v1 v2: (b2Vec2) v2
{
  b2BodyDef bodyDef;
  b2Body*   body = world->CreateBody(&bodyDef);
  b2EdgeShape edge;
  edge.Set(v1, v2);
  body->CreateFixture(&edge, 0);
}

-(void) addBox:(Box *)physicalView
{

  b2BodyDef bodyDef;
  bodyDef.type = b2_dynamicBody;
  CGSize screenSize = UIScreen.mainScreen.bounds.size;

  CGPoint p = physicalView.center;
  CGPoint boxDimensions = CGPointMake(physicalView.bounds.size.width/PTM_RATIO/2.0,
                                      physicalView.bounds.size.height/PTM_RATIO/2.0);

  bodyDef.position.Set(p.x/PTM_RATIO, (screenSize.height - p.y)/PTM_RATIO);
  bodyDef.userData = (__bridge void*) physicalView;

  b2Body *body = world->CreateBody(&bodyDef);


  b2PolygonShape dynamicBox;
  dynamicBox.SetAsBox(boxDimensions.x, boxDimensions.y);

  b2FixtureDef fixtureDef;
  fixtureDef.shape       = &dynamicBox;
  fixtureDef.density     = 3.0f;
  fixtureDef.friction    = 0.5f;
  fixtureDef.restitution = 0.6f; // 0 is a lead ball, 1 is a super bouncy ball
  body->CreateFixture(&fixtureDef);
  body->SetType(b2_dynamicBody);

  /*Ref back to the world and body*/
  physicalView.world = world;
  physicalView.body  = body;
  physicalView.worldBridge = self;

}

-(void) tick
{
  //It is recommended that a fixed time step is used with Box2D for stability
  //of the simulation, however, we are using a variable time step here.
  //You need to make an informed choice, the following URL is useful
  //http://gafferongames.com/game-physics/fix-your-timestep/
  CGSize screenSize = UIScreen.mainScreen.bounds.size;

  int32 velocityIterations = 8;
  int32 positionIterations = 1;

  // Instruct the world to perform a single step of simulation. It is
  // generally best to keep the time step and iterations fixed.
  world->Step(1.0f/60.0f, velocityIterations, positionIterations);

  //Iterate over the bodies in the physics world
  for (b2Body* b = world->GetBodyList(); b; b = b->GetNext())
  {
    if (b->GetUserData() != NULL)
    {
      Box *box = (__bridge Box *)b->GetUserData();
      CGPoint center = CGPointMake(b->GetPosition().x * PTM_RATIO,
                                      screenSize.height - b->GetPosition().y * PTM_RATIO);
      CGAffineTransform transform = CGAffineTransformMakeRotation(- b->GetAngle());
      box.center = center;
      box.transform = transform;
    }
  }
}

@end
