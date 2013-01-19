#import "Box.h"

@implementation Box
  @synthesize world;
  @synthesize body;
  @synthesize worldBridge;

  -(void) destroyBody
  {
    self.world->DestroyBody(self.body);
    self.body = NULL;
  }

  -(void) addBody
  {
    [self.worldBridge addBox: self];
  }
@end
