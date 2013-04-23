//
//  NIMModalViewController.m
//  NavigationInModal
//
//  Created by 武田 祐一 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "NIMModalViewController.h"

@interface NIMModalViewController ()
@property(nonatomic,assign) int doublePop;
@end

@implementation NIMModalViewController


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

    self.title = [NSString stringWithFormat:@"%d", self.navigationController.viewControllers.count];

    // TODO ここに navigation bar の右上をpushするボタンを配置するコードを書く
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(pressPushButton)];
    // TODO さらに、一番先頭に戻るボタンを左に配置する
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"pop" style:UIBarButtonItemStylePlain target:self action:@selector(pressPopButton)];
        
    if( self.navigationController.viewControllers.count > 1){
        self.navigationItem.leftItemsSupplementBackButton = YES;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pressPushButton{
    NIMModalViewController *root = self.navigationController.viewControllers[0];
    [self.navigationController pushViewController:[[NIMModalViewController alloc]init] animated:YES];
    root.doublePop = 0;
}

- (void)pressPopButton{
    NIMModalViewController *root = self.navigationController.viewControllers[0];
    if( root.doublePop ){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    root.doublePop = 1;
    return;
}

@end
