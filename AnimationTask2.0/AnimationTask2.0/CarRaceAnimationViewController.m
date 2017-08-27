
//
//  CarRaceAnimationViewController.m
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "CarRaceAnimationViewController.h"

@interface CarRaceAnimationViewController ()

@property (nonatomic, strong) UIBezierPath *racetrack;
@property (nonatomic, strong) CAShapeLayer *roadMarkupShapeLayer;

@end

@implementation CarRaceAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startCarRace];
}

- (void)startCarRace {
    
    [self createRacetrack];
    
    [self addRoadSurfaceToRacetrack:self.racetrack];
    
    self.roadMarkupShapeLayer = [self createRoadMarkupShapeLayer];
    
    [self.view.layer addSublayer:self.roadMarkupShapeLayer];
    
    [self.roadMarkupShapeLayer addSublayer:[self carLayerWithAnimation]];
}

- (void)createRacetrack {
    CGFloat viewCoordinateX = self.view.frame.origin.x;
    CGFloat viewCoordinateY = self.view.frame.origin.y;
    CGFloat viewWidth = self.view.frame.size.width;
    
    self.racetrack = [UIBezierPath bezierPath];
    
    [self.racetrack moveToPoint:CGPointMake(viewCoordinateX + 50, viewCoordinateY + 350)];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewCoordinateX + 50, viewCoordinateY + 120)
                           controlPoint:CGPointMake(viewCoordinateX + 10, viewCoordinateY + 130)];
    
    [self.racetrack addCurveToPoint:CGPointMake(viewWidth - 20, 120)
                      controlPoint1:CGPointMake(viewWidth - 20, 120)
                      controlPoint2:CGPointMake(viewWidth - 20, 60)];
    
    [self.racetrack addLineToPoint:CGPointMake(viewWidth - 20, 200)];
    
    [self.racetrack addCurveToPoint:CGPointMake(viewWidth - 60, 300)
                      controlPoint1:CGPointMake(viewWidth - 20, 200)
                      controlPoint2:CGPointMake(viewWidth - 20, 350)];
    
    [self.racetrack addLineToPoint:CGPointMake(viewWidth - 150, 200)];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 250, 300)
                           controlPoint:CGPointMake(viewWidth - 250, 120)];
    
    [self.racetrack addLineToPoint:CGPointMake(viewWidth - 250, 550)];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 160, 450)
                           controlPoint:CGPointMake(viewWidth - 250, 600)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 190, 450)
                           controlPoint:CGPointMake(viewWidth - 140, 400)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 190, 400)
                           controlPoint:CGPointMake(viewWidth - 240, 500)
     ];
    
    [self.racetrack addLineToPoint:CGPointMake(viewWidth - 160, 350)];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 190, 350)
                           controlPoint:CGPointMake(viewWidth - 140, 300)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 200, 250)
                           controlPoint:CGPointMake(viewWidth - 260, 400)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewWidth - 60, 500)
                           controlPoint:CGPointMake(viewWidth - 150, 150)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewCoordinateX + 120, 600)
                           controlPoint:CGPointMake(viewWidth - 20, 650)
     ];
    
    [self.racetrack addQuadCurveToPoint:CGPointMake(viewCoordinateX + 50, viewCoordinateY + 350)
                           controlPoint:CGPointMake(viewCoordinateX + 80, 600)
     ];
}

- (void)addRoadSurfaceToRacetrack:(UIBezierPath *)racetrack {
    CAShapeLayer* roadShapeLayer = [CAShapeLayer layer];
    roadShapeLayer.fillColor = [UIColor clearColor].CGColor;
    [roadShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
    [roadShapeLayer setLineWidth:10.0f];
    roadShapeLayer.path = self.racetrack.CGPath;
    
    [self.view.layer addSublayer:roadShapeLayer];
}

- (CAShapeLayer *)createRoadMarkupShapeLayer {
    CAShapeLayer *roadMarkupShapeLayer = [CAShapeLayer layer];
    roadMarkupShapeLayer.fillColor = [UIColor clearColor].CGColor;
    [roadMarkupShapeLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
    [roadMarkupShapeLayer setLineWidth:3.0f];
    [roadMarkupShapeLayer setLineJoin:kCALineJoinRound];
    [roadMarkupShapeLayer setLineDashPattern: [NSArray arrayWithObjects:[NSNumber numberWithInt:10], [NSNumber numberWithInt:5], nil]];
    roadMarkupShapeLayer.path = self.racetrack.CGPath;
    
    return roadMarkupShapeLayer;
}

- (CALayer *)carLayerWithAnimation {
    UIImage *carImage = [UIImage imageNamed:@"raceCar"];
    
    CALayer *carLayer = [[CALayer alloc] init];
    carLayer.contents = (id)carImage.CGImage;
    carLayer.bounds = CGRectMake(200, 200, carImage.size.width, carImage.size.height);
    carLayer.position = CGPointMake(50, 120);
    
    [carLayer addAnimation:[self carLayerAnimation] forKey:nil];
    
    return carLayer;
}

- (CAKeyframeAnimation *)carLayerAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = self.racetrack.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = YES;
    animation.duration = 8.5f;
    animation.repeatCount = HUGE_VALF;
    
    return animation;
}

@end
