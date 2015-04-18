//
//  ViewController.m
//  DroneSpike
//
//  Created by Fran_DEV on 13/04/15.
//  Copyright (c) 2015 Francisco J. Belchi. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    
    self.motionManager.deviceMotionUpdateInterval = 0.01f;
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                 withHandler:^(CMDeviceMotion *data, NSError *error) {
                                     //double rotation = atan2(data.gravity.x, data.gravity.y) - M_PI;
                                     NSLog(@"y: %f",data.rotationRate.y);
                                 }];
}


@end
