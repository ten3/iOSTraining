//
//  MixiViewController.m
//  Homework_1_sandbox
//
//  Created by 長田 乾 on 2013/04/17.
//  Copyright (c) 2013年 長田 乾. All rights reserved.
//

#import "MixiViewController.h"
#import "MixiTestQueue.h"
#import "MixiTestStack.h"
#import "MixiKadai3ViewController.h"

@interface MixiViewController ()
- (void) _arrayTest;
- (void) _dictionaryTest;
- (void) _kadai1;
- (void) _kadai2;
- (NSDictionary*) _makeDomain:(NSString*)data WithEntries:(NSArray*)entries;
@property(nonatomic,strong) MixiKadai3ViewController *popup;
@end

@implementation MixiViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Hell world.");

    //[self _arrayTest];
    
    //[self _dictionaryTest];
    
    [self _kadai1];
    [self _kadai2];
    
    _popup = [[MixiKadai3ViewController alloc] initWithNibName:@"MixiKadai3ViewController" bundle:nil];
    _popup.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) _arrayTest{
    NSArray *array = @[ @1 , @2 ];
    
    id obj = array[0];
    
    NSLog( @"array first : %@", obj );
    
    NSMutableArray *mutable_array = [NSMutableArray array];
    
    
    [mutable_array addObject:@"pemo"];
    [mutable_array addObject:@"pomo"];

    NSLog( @"mutable array : %@" , mutable_array);
    [mutable_array removeObjectAtIndex:0];
    
    NSLog(@"changed array : %@" , mutable_array);
    
}

-(void) _dictionaryTest{
    NSDictionary *dictionary = @{ @"key1" : @1 , @"key2" : @2};
    
    NSLog( @"dictionary : %@" , dictionary);
    id obj = dictionary[@"key1"];
    NSLog( @"key1 is %@" , obj);
    
}

-(void) _kadai1{
    NSDictionary *data1 = [self _makeDomain:@"mixi.jp" WithEntries:@[@"list_voice.pl" , @"list_diary.pl", @"list_mymall_item.pl"]];
    NSDictionary *data2 = [self _makeDomain:@"mmal.jp" WithEntries:@[ @{ @"path":@"add_diary.pl", @"query":@[ @{@"tag_id" :@7}]}]];
    NSDictionary *data3 = [self _makeDomain:@"itunes.apple.com" WithEntries:nil];
    NSArray *array = @[ data1 , data2 , data3 ];
    
    NSLog(@" data : %@" , array );

}

-(NSDictionary *) _makeDomain : (NSString *) data WithEntries : (NSArray *) entries{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"domain"] = data;
    if(entries){
        dict[@"entry"] = entries;
    }
    
    return dict;
}

-(void) _kadai2{
    MixiTestQueue *queue = [[MixiTestQueue alloc] init];
    
    [queue push:@1];
    [queue push:@2];
    
    NSInteger queue_size = [queue size];
    
    id data1 = [queue pop];
    id data2 = [queue pop];
    
    if( queue_size == 2 && [data1 isEqual:@1] && [data2 isEqual:@2] ){
        NSLog(@"success queue");
    }
    
    MixiTestStack *stack = [[MixiTestStack alloc] init];
    
    [stack push:@3];
    [stack push:@4];
    
    NSInteger stack_size = [stack size];
    
    id data3 = [stack pop];
    id data4 = [stack pop];
    
    if( stack_size == 2 && [data3 isEqual:@4] && [data4 isEqual:@3]){
        NSLog(@"success stack");
    }
}

- (IBAction)pressOpenButton:(id)sender {
    [self presentViewController:_popup animated:YES completion:nil];
}

- (void)didPressCloseButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didDisappear{
    [self presentViewController:_popup animated:YES completion:nil];
}
@end
