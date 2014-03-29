//
//  ViewController.m
//  FancyLoadingAnimation
//
//  Created by Johannes Harestad on 29.03.14.
//  Copyright (c) 2014 Johannes Harestad. All rights reserved.
//

#import "ViewController.h"
#import "LoadingAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)buttonPressed:(id)sender {
    [LoadingAnimationView showLoadingView];
    
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        [LoadingAnimationView hideLoadingView];
    });
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
