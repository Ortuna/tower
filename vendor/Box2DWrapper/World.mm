#import "World.h"


@implementation B2Vec
  @synthesize world;


-(void)setupWorld {
  b2Vec2 gravity;
  gravity.Set(0.0f, -25.00f);
  self.world = new b2World(gravity);
}

-(void) addBox:(UIView *)physicalView
{

  b2BodyDef bodyDef;
  bodyDef.type = b2_dynamicBody;

  CGPoint p = physicalView.center;
  CGPoint boxDimensions = CGPointMake(physicalView.bounds.size.width/PTM_RATIO/2.0,
                                      physicalView.bounds.size.height/PTM_RATIO/2.0);

  bodyDef.position.Set(p.x/PTM_RATIO, (300 - p.y)/PTM_RATIO);
  bodyDef.userData = (__bridge void*) physicalView;

  b2Body *body = world->CreateBody(&bodyDef);


  b2PolygonShape dynamicBox;
  dynamicBox.SetAsBox(boxDimensions.x, boxDimensions.y);

  b2FixtureDef fixtureDef;
  fixtureDef.shape       = &dynamicBox;
  fixtureDef.density     = 1.0f;
  fixtureDef.friction    = 0.5f;
  fixtureDef.restitution = 0.5f; // 0 is a lead ball, 1 is a super bouncy ball
  body->CreateFixture(&fixtureDef);

  body->SetType(b2_dynamicBody);

  // physicalView.body  = body;
  // physicalView.world = world;
  // physicalView.controllerWorld = self;
}

@end
