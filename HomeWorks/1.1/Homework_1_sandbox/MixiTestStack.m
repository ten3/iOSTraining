//
//  MixiTestStack.m
//  Homework_1_sandbox
//
//  Created by 長田 乾 on 2013/04/17.
//  Copyright (c) 2013年 長田 乾. All rights reserved.
//

#import "MixiTestStack.h"

@implementation MixiTestStack
-(id) init{
    self = [super init];
    
    if( self ){
        m_strage = [NSMutableArray array];
    }
    
    return self;
}

-(void) push:(id)object{
    if( m_strage && object ){
        [m_strage addObject:object];
    }
}

-(id) pop{
    if( !m_strage) return nil;
    if( ![m_strage count] ){
        return nil;
    }
    NSInteger size = [self size];
    id response = m_strage[size-1];
    [m_strage removeObjectAtIndex:size-1];

    return response;
}

-(NSInteger) size{
    return [m_strage count];
}
@end
