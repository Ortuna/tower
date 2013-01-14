#import "Box2D/Box2D.h"

#define PTM_RATIO 56
const int SCALE = 24;

#pragma once

@interface World : NSObject
  @property b2World *world;
-(void) setupWorld;
-(void) addBox:(UIView *)physicalView;
-(void) tick;
-(void) createBounds;
@end

