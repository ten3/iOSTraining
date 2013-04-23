//
//  MixiKadai3ViewController.h
//  Homework_1_sandbox
//
//  Created by 長田 乾 on 2013/04/17.
//  Copyright (c) 2013年 長田 乾. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MixiKadai3ViewControllerDelegate <NSObject>
- (void) didPressCloseButton;
- (void) didDisappear;
@end

@interface MixiKadai3ViewController : UIViewController
@property(nonatomic, weak) id<MixiKadai3ViewControllerDelegate> delegate;

- (IBAction)pressCloseButton:(id)sender;

@end
