#import "Box2D/Box2D.h"

#define PTM_RATIO 56

#pragma once

@interface B2Vec : NSObject
  @property b2World *world;
-(void) setupWorld;
-(void) addBox:(UIView *)physicalView;
@end

