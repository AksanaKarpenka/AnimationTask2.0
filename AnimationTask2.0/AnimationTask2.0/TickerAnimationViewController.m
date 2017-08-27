//
//  TickerViewController.m
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "TickerAnimationViewController.h"

@interface TickerAnimationViewController ()

@end

@implementation TickerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat labelWidth = self.tickerLabel.frame.size.width;
    CGFloat labelCoordinateX = self.tickerLabel.frame.origin.x;
    CGFloat viewCenterCoordinateY = self.view.center.y;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(labelCoordinateX + labelWidth + 200, viewCenterCoordinateY)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(labelCoordinateX - labelWidth, viewCenterCoordinateY)];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 5.;
    
    [self.tickerLabel.layer addAnimation:animation forKey:@"position"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.tickerLabel.layer removeAllAnimations];
}

@end
