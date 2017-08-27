//
//  PlanetsOrbitsViewController.m
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "PlanetsOrbitsAnimationViewController.h"

@interface PlanetsOrbitsAnimationViewController ()

@end

@implementation PlanetsOrbitsAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *orbitLarge = [self createOrbitLayerWithWidth:200
                                                   height:200
                                                    color:[UIColor redColor]
                                             cornerRadius:100
                                              borderWidth:1.5
                                                 position:self.view.center];
    [self.view.layer addSublayer:orbitLarge];
    
    CALayer *planetLarge = [self createPlanetLayerWithWidth:30
                                                     height:30
                                                      color:[UIColor redColor]
                                               cornerRadius:15
                                                   position:CGPointMake(100, 0)];
    [orbitLarge addSublayer:planetLarge];

    CALayer *orbitMedium = [self createOrbitLayerWithWidth:100
                                                    height:100
                                                     color:[UIColor blueColor]
                                              cornerRadius:50
                                               borderWidth:1.5
                                                  position:CGPointMake(100, 0)];
    [orbitLarge addSublayer:orbitMedium];
    
    CALayer *planetMedium = [self createPlanetLayerWithWidth:16
                                                      height:16
                                                       color:[UIColor blueColor]
                                                cornerRadius:8
                                                    position:CGPointMake(50, 0)];
    [orbitMedium addSublayer:planetMedium];
    
    CALayer *orbitSmall = [self createOrbitLayerWithWidth:50
                                                   height:50
                                                    color:[UIColor grayColor]
                                             cornerRadius:25
                                              borderWidth:1.5
                                                 position:CGPointMake(50, 0)];
    [orbitMedium addSublayer:orbitSmall];
    
    CALayer *planetSmall = [self createPlanetLayerWithWidth:12
                                                     height:12
                                                      color:[UIColor grayColor]
                                               cornerRadius:6
                                                   position:CGPointMake(25, 0)];
    [orbitSmall addSublayer:planetSmall];
    
    CABasicAnimation *animationSmallPlanet = [self createOrbitAnimationWithDuration:5.];
    [orbitSmall addAnimation:animationSmallPlanet forKey:nil];
    
    CABasicAnimation *animationMediumPlanet = [self createOrbitAnimationWithDuration:6.];
    [orbitMedium addAnimation:animationMediumPlanet forKey:nil];
    
    CABasicAnimation *animationLargePlanet = [self createOrbitAnimationWithDuration:8.];
    [orbitLarge addAnimation:animationLargePlanet forKey:nil];
}

- (CALayer *)createOrbitLayerWithWidth:(CGFloat)orbitWidth height:(CGFloat)orbitHeight color:(UIColor *)orbitColor cornerRadius:(CGFloat)orbitCornerRadius borderWidth:(CGFloat)orbitBorderWidth position:(CGPoint)orbitPosition {
    
    CALayer *orbitLayer = [[CALayer alloc] init];
    orbitLayer.bounds = CGRectMake(0, 0, orbitWidth, orbitHeight);
    orbitLayer.borderColor = orbitColor.CGColor;
    orbitLayer.cornerRadius = orbitCornerRadius;
    orbitLayer.borderWidth = orbitBorderWidth;
    orbitLayer.position = orbitPosition;
    
    return orbitLayer;
}

- (CALayer *)createPlanetLayerWithWidth:(CGFloat)width height:(CGFloat)height color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius position:(CGPoint)position {
    CALayer *planetLayer = [[CALayer alloc] init];
    planetLayer.bounds = CGRectMake(0, 0, width, height);
    planetLayer.cornerRadius = cornerRadius;
    planetLayer.backgroundColor = color.CGColor;
    planetLayer.position = position;
    
    return planetLayer;
}

- (CABasicAnimation *)createOrbitAnimationWithDuration:(NSTimeInterval)duration {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithFloat:0.];
    animation.toValue = [NSNumber numberWithFloat:(360 * M_PI / 180)];
    animation.repeatCount = HUGE_VALF;
    animation.duration = duration;

    return animation;
}

@end
