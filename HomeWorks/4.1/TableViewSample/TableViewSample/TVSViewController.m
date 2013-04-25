//
//  TVSViewController.m
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/22.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TVSViewController.h"

#import "TVSCustomCell.h"

@interface TVSViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) TVSCustomCell *cellForCalcHeight;
@property (strong, nonatomic) NSArray *texts;
@end

@implementation TVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TVSCustomCell" bundle:nil] forCellReuseIdentifier:@"maimai"];

    _cellForCalcHeight = [_tableView dequeueReusableCellWithIdentifier:@"maimai"];

    //TODO : samplData.plist から NSArray を作成しましょう [1]
    _texts = [self readPlist:@"sampleData.plist"];
}

- (NSArray *) readPlist:(NSString *)fileName{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sampleData" ofType:@"plist"];
    NSLog( @"data : %@" , plistPath);
    
    NSData *plistXml = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSPropertyListFormat format;
    NSString *errorDesc;
    NSArray *propertyList = [NSPropertyListSerialization
                                         propertyListFromData:plistXml
                                         mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                         format:&format
                                         errorDescription:&errorDesc ];
    
    if ( !propertyList ){
        NSLog( @"plist read error : %@", errorDesc);
    }
    
    return propertyList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO : cellForCalcHeight の高さ計算メソッドを使って高さを計算しましょう
    return [_cellForCalcHeight calculateCellHeightWithText:_texts[indexPath.row]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_texts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"maimai";
    TVSCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.bodyLabel.text = _texts[indexPath.row];
    [cell.bodyLabel sizeToFit];
    return cell;
}

@end
