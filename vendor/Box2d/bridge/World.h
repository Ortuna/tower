#import "../Box2D/Box2D.h"
#import "Box.h"

#define PTM_RATIO 16
const int SCALE = 24;

#pragma once

#ifndef TWORLD
#define TWORLD

@class Box;

@interface World : NSObject
@property b2World *world;
@property CGSize  worldSize;

-(void) setupWorld:(float)width
            height:(float)height;
-(void) addBox:(Box *)physicalView;
-(void) tick;
-(void) createBounds;
-(void) setupGravity;
@end

#endif
