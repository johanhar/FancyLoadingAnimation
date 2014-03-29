//
//  AnimatedCircleUtility.h
//  FancyLoadingAnimation
//
//  Created by Johannes Harestad on 29.03.14.
//  Copyright (c) 2014 Johannes Harestad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimatedCircleUtility : NSObject

+ (void)addAnimatedCircleToView:(UIView *)view
                   withDiameter:(CGFloat)diameter
                         center:(CGPoint)center
                          color:(UIColor *)color
                   movingRadius:(CGFloat)radius
                      clockwise:(BOOL)clockwise
                       duration:(CGFloat)duration;

@end
