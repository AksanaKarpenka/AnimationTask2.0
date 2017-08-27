//
//  ButtonsAnimationsViewController.h
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductBasketAnimationsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *scaleButton;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;
@property (weak, nonatomic) IBOutlet UIImageView *basketImage;

- (IBAction)scaleButtonAction:(UIButton *)sender;
- (IBAction)addProductToBasket:(UIButton *)sender;

@end
