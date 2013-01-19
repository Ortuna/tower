#import "../Box2D/Box2D.h"
#import "World.h"

#pragma once

#ifndef TBOX
#define TBOX

@class World;

@interface Box : UIView
@property b2World *world;
@property b2Body  *body;
@property World *worldBridge;

-(void) destroyBody;
-(void) addBody;
@end
#endif
