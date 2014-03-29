//
//  LoadingAnimationView.m
//  FancyLoadingAnimation
//
//  Created by Johannes Harestad on 29.03.14.
//  Copyright (c) 2014 Johannes Harestad. All rights reserved.
//

#import "LoadingAnimationView.h"
#import "AnimatedCircleUtility.h"

@implementation LoadingAnimationView

+ (instancetype)privateInstance
{
    static dispatch_once_t once;
    static LoadingAnimationView *privateInstance;
    dispatch_once(&once, ^{
        privateInstance = [[self alloc] init];
    });
    return privateInstance;
}

+ (void)showLoadingView
{
    LoadingAnimationView *loadingView = [LoadingAnimationView privateInstance];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [UIView transitionWithView:keyWindow
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [keyWindow addSubview:loadingView];
                    }
                    completion:^(BOOL finished) {
                        
                    }];
    
}

+ (void)hideLoadingView
{
    LoadingAnimationView *loadingView = [LoadingAnimationView privateInstance];
    [loadingView removeFromSuperview];
}

- (id)init
{
    self = [super init];
    if (self) {
        
        // Background with alpha so the view is transculent.
        self.backgroundColor = [UIColor colorWithWhite:0.2
                                                 alpha:0.85];
        
        // Get the size of the entire screen
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        // Set the frame for this view to be equal to the screen size
        self.frame = CGRectMake(0, 0, screenRect.size.width, screenRect.size.height);
        
        // Let's create a label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 100)];
        label.center = self.center;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor=[UIColor whiteColor];
        label.text = @"Loading";
        [self addSubview:label];
        
        [AnimatedCircleUtility
            addAnimatedCircleToView:self
            withDiameter:15
            center:self.center
            color:[UIColor blueColor]
            movingRadius:35
            clockwise:YES
            duration:2.0];
        
        [AnimatedCircleUtility
            addAnimatedCircleToView:self
            withDiameter:15
            center:self.center
            color:[UIColor greenColor]
            movingRadius:35
            clockwise:YES
            duration:3.0];
        
        [AnimatedCircleUtility
            addAnimatedCircleToView:self
            withDiameter:15
            center:self.center
            color:[UIColor yellowColor]
            movingRadius:35
            clockwise:NO
            duration:2.0];
        
        [AnimatedCircleUtility
            addAnimatedCircleToView:self
            withDiameter:15
            center:self.center
            color:[UIColor redColor]
            movingRadius:35
            clockwise:YES
            duration:4.0];
        
        [AnimatedCircleUtility
            addAnimatedCircleToView:self
            withDiameter:15
            center:self.center
            color:[UIColor brownColor]
            movingRadius:35
            clockwise:NO
            duration:5.0];
        
    }
    return self;
}


@end
