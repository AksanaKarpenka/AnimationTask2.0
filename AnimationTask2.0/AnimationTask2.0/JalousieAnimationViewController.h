//
//  JalousieAnimationViewController.h
//  AnimationTask2.0
//
//  Created by HomeStation on 8/19/17.
//  Copyright © 2017 AKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JalousieAnimationViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *mainFrontSideImageView;
@property (strong, nonatomic) IBOutlet UIImageView *mainBackSideImageView;

- (IBAction)animateBarButtonItemTapped:(UIBarButtonItem *)sender;

@end
