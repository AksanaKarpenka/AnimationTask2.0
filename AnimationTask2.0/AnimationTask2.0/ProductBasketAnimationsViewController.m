//
//  ButtonsAnimationsViewController.m
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "ProductBasketAnimationsViewController.h"

@interface ProductBasketAnimationsViewController ()

@end

@implementation ProductBasketAnimationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)scaleButtonAction:(UIButton *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)];
    animation.duration = .5;
    
    [sender.layer addAnimation:animation forKey:nil];
}

- (IBAction)addProductToBasket:(UIButton *)sender {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.phoneImage.center];
    [bezierPath addCurveToPoint:CGPointMake(self.basketImage.center.x, self.basketImage.center.y)
                  controlPoint1:CGPointMake(250, 450)
                  controlPoint2:CGPointMake(100, 50)];
    
    CAShapeLayer* layerShape = [CAShapeLayer layer];
    layerShape.fillColor = [UIColor clearColor].CGColor;
    layerShape.path = bezierPath.CGPath;
    
    [self.view.layer addSublayer:layerShape];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animation];
    transformAnimation.keyPath = @"transform";
    transformAnimation.autoreverses = YES;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0., 0., 0.)];
    transformAnimation.removedOnCompletion = YES;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    animation.removedOnCompletion = YES;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation, transformAnimation];
    animationGroup.duration = 0.9f;
    animationGroup.autoreverses = NO;
    animationGroup.removedOnCompletion = YES;
    
    [self.phoneImage.layer addAnimation:animationGroup forKey:@"animationForAddingToBasket"];
}

@end
