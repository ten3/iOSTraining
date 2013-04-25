//
//  TVSCustomCell.m
//  TableViewSample
//
//  Created by 武田 祐一 on 2013/04/23.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TVSCustomCell.h"

@implementation TVSCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(CGFloat)calculateCellHeightWithText:(NSString *)text
{
    // TODO : UILabel の高さ計算 [2]
    
    NSLog(@"%@" , self.textLabel.font);
    UIFont *font = _bodyLabel.font;
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(self.bodyLabel.frame.size.width, 1000.0f) lineBreakMode:NSLineBreakByWordWrapping];

    CGFloat top = 20.0f;
    CGFloat bottom = 20.0f;
    return size.height + top + bottom;
}

@end
