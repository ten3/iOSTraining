//
//  SVSViewController.m
//  scrollViewSample
//
//  Created by 武田 祐一 on 2013/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "SVSViewController.h"

@interface SVSViewController ()
@property(nonatomic,strong) UIScrollView *scroll;
@end

@implementation SVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _scroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_scroll];
    
    UIImage *image = [UIImage imageNamed:@"big_image.jpg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, image.size.width, image.size.height)];
    
    imageView.image = image;
    [_scroll addSubview:imageView];
    _scroll.contentSize = imageView.frame.size;
    
    _scroll.maximumZoomScale = 3.0f;
    _scroll.minimumZoomScale = 0.5f;
    
    _scroll.delegate = self;
    
    [UIView animateWithDuration:4.0
                     animations:^{
                         [_scroll setContentOffset:CGPointMake(40.0f, 40.0f)];
                         [_scroll setZoomScale:2.0f];
                     }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    for (UIView *view in scrollView.subviews ){
        if( [view isKindOfClass:[UIImageView class]]){
            return view;
        }
    }
    return nil;
}

-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    NSLog(@"%f , %f" , scrollView.contentOffset.x , scrollView.contentOffset.y);
}
@end
