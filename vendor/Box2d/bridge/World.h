#import "../Box2D/Box2D.h"
#import "Box.h"

#define PTM_RATIO 56
const int SCALE = 24;

#pragma once

#ifndef TWORLD
#define TWORLD

@class Box;

@interface World : NSObject
@property b2World *world;
-(void) setupWorld;
-(void) addBox:(Box *)physicalView;
-(void) tick;
-(void) createBounds;
@end

#endif
