//
//  HanZiJieSi.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "HanZiJieSi.h"

@implementation HanZiJieSi


- (void)dealloc{
    [_hzTitle release];
    [_hzBase release];
    [_hzHanyu release];
    [_hzChenyu release];
    [_hzEnglish release];
    [super dealloc];
}
@end
