//
//  MixiTestQueue.h
//  Homework_1_sandbox
//
//  Created by 長田 乾 on 2013/04/17.
//  Copyright (c) 2013年 長田 乾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MixiTestQueue : NSObject
{
    @private
    NSMutableArray *m_strage;
}
-(id) init;
-(void) push:(id)object;
-(id) pop;
-(NSInteger) size;

@end
