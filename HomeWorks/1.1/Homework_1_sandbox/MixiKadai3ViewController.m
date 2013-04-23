//
//  MixiKadai3ViewController.m
//  Homework_1_sandbox
//
//  Created by 長田 乾 on 2013/04/17.
//  Copyright (c) 2013年 長田 乾. All rights reserved.
//

#import "MixiKadai3ViewController.h"

@interface MixiKadai3ViewController ()

@end

@implementation MixiKadai3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidDisappear:(BOOL)animated
{
    if( [_delegate respondsToSelector:@selector(didPressCloseButton)]){
        [_delegate didDisappear];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressCloseButton:(id)sender {
    if( [_delegate respondsToSelector:@selector(didPressCloseButton)]){
        [_delegate didPressCloseButton];
    }
}
@end
