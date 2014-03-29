//
//  AnimatedCircleUtility.m
//  FancyLoadingAnimation
//
//  Created by Johannes Harestad on 29.03.14.
//  Copyright (c) 2014 Johannes Harestad. All rights reserved.
//

#import "AnimatedCircleUtility.h"

@implementation AnimatedCircleUtility

+ (void)addAnimatedCircleToView:(UIView *)view
                   withDiameter:(CGFloat)diameter
                         center:(CGPoint)center
                          color:(UIColor *)color
                   movingRadius:(CGFloat)radius
                      clockwise:(BOOL)clockwise
                       duration:(CGFloat)duration
{
    
    // Let's create the circle
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter)];
    circle.backgroundColor = color;
    
    // This will make it circular
    circle.layer.cornerRadius = diameter / 2;
    
    // Let's place it where we want it on the screen
    circle.center = center;
    
    // This path is where the circle will move along
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:clockwise];
    
    // This creates the animation
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = duration;
    
    // Let's use the UIBezier path we created
    pathAnimation.path = path.CGPath;
    
    // We add the animation to the circle
    [circle.layer addAnimation:pathAnimation forKey:@"movingAnimation"];
    
    [view addSubview:circle];
}


@end
