//
//  XianXiViews.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "XianXiViews.h"

@implementation XianXiViews

+ (UIView *) creatViewWithFrame:(CGRect ) frame
                    andImgFrame:(CGRect ) imgFrame
                        andName:(NSString *)imgName
                       andTitle:(NSString *)atitle
{
    
    UIView *view = [[[UIView alloc]initWithFrame:frame]autorelease];
    UIImageView *shuFaView = [[[UIImageView alloc]initWithFrame:imgFrame]autorelease];
    shuFaView.image = [UIImage imageNamed:imgName];
    
    UILabel *title = [[[UILabel alloc]initWithFrame:CGRectMake(5, 30, 48, 12)]autorelease];
    title.font = [UIFont systemFontOfSize:12.0];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.text = atitle;
    title.backgroundColor = [UIColor clearColor];
    [view addSubview:title];
    [view addSubview:shuFaView];
    
    
    return [view autorelease];
    
}



- (void)dealloc
{
    [super dealloc];
}

@end
