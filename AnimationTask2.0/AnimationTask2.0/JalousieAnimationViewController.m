//
//  JalousieAnimationViewController.m
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import "JalousieAnimationViewController.h"

static NSInteger const layersCount = 7;

@interface JalousieAnimationViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *draftFrontSideImageView;
@property (nonatomic, strong) UIImageView *draftBackSideImageView;
@property (nonatomic, strong) UIImage *replacingImage;

@end

@implementation JalousieAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainBackSideImageView removeFromSuperview];
    self.mainFrontSideImageView.image = [UIImage imageNamed:@"imageBg"];
    self.mainFrontSideImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.mainBackSideImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (IBAction)animateBarButtonItemTapped:(UIBarButtonItem *)sender {
    if (self.mainBackSideImageView.superview == nil) {
        UIImage *fromImage = [UIImage imageNamed:@"imageBg"];
        self.replacingImage = [UIImage imageNamed:@"imageBg4"];
        self.draftFrontSideImageView = self.mainFrontSideImageView;
        self.draftBackSideImageView = self.mainBackSideImageView;
        
        [self animateSublayersInFrontView:self.mainFrontSideImageView fromImage:fromImage toImage:self.replacingImage backSideView:self.mainBackSideImageView];
    } else {
        UIImage *fromImage = [UIImage imageNamed:@"imageBg4"];
        self.replacingImage = [UIImage imageNamed:@"imageBg"];
        self.draftFrontSideImageView = self.mainBackSideImageView;
        self.draftBackSideImageView = self.mainFrontSideImageView;
        
        [self animateSublayersInFrontView:self.mainBackSideImageView fromImage:fromImage toImage:self.replacingImage backSideView:self.mainFrontSideImageView];
    }
}

- (void)animateSublayersInFrontView:(UIImageView *)frontSideView fromImage:(UIImage *)fromImage toImage:(UIImage *)toImage backSideView:(UIImageView *)backSideView {
    [self removeSublayers];
    
    int i = 0;
    
    float layerWidth = self.view.frame.size.width / layersCount;
    float layerOffset = 0;
    
    NSMutableArray *layers = [[NSMutableArray alloc] init];
    
    for (i = 0; i < layersCount; i++) {
        [layers addObject:[self createLayer:fromImage width:layerWidth offset:layerOffset]];
        
        layerOffset += layerWidth;
    }
    
    for (i = 0; i < [layers count]; i++) {
        [frontSideView.layer addSublayer:layers[i]];
        
        CABasicAnimation *rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 90.0 / 180.0];
        rotationAnimation.duration = 1.0f;
        rotationAnimation.repeatCount = 1;
        
        if (i == ([layers count] - 1)) {
            rotationAnimation.delegate = self;
        }
        
        [frontSideView.layer.sublayers[i] addAnimation:rotationAnimation forKey:nil];
    }
}

- (CALayer *)createLayer:(UIImage *)image width:(float)widthLine offset:(float)lineOffset {
    CALayer *layer= [[CALayer alloc] init];
    layer.bounds = CGRectMake(lineOffset, 0, widthLine, self.view.frame.size.height);
    layer.masksToBounds = YES;
    layer.position = CGPointMake(lineOffset, 0);
    layer.anchorPoint = CGPointMake(0, 0);
    
    [layer addSublayer:[self createSubLayer:image]];
    
    return layer;
}

- (CALayer *)createSubLayer:(UIImage *)image {
    CALayer *layer = [[CALayer alloc] init];
    layer.contents = (id)image.CGImage;
    layer.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    layer.anchorPoint = CGPointMake(0, 0);
    
    return layer;
}

- (void)animationDidStart:(CAAnimation *)anim {
    self.draftFrontSideImageView.image = self.replacingImage;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeSublayers];
    
    [self.draftFrontSideImageView removeFromSuperview];
    [self.view addSubview:self.draftBackSideImageView];
    
    self.draftBackSideImageView.image = self.replacingImage;
}

- (void)removeSublayers {
    self.draftFrontSideImageView.image = nil;
    self.draftBackSideImageView.image = nil;
    
    int i = 0;
    
    for (i = 0; i <= [self.draftFrontSideImageView.layer.sublayers count]; i++) {
        [self.draftFrontSideImageView.layer.sublayers[i] removeFromSuperlayer];
    }
    
    for (i = 0; i <= [self.draftBackSideImageView.layer.sublayers count]; i++) {
        [self.draftBackSideImageView.layer.sublayers[i] removeFromSuperlayer];
    }
}

@end
