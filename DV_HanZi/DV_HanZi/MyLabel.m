//
//  MyLabel.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

//米字格旁边的信息
+ (UILabel *) creatLabelWith:(CGRect)frame
          andBackGroundColor:(UIColor*)aColor
                andTextColor:(UIColor *) color
                     andFont:(UIFont *) aFont
                    andTitle:(NSString *) title
                andSendedStr:(NSString *) sendStr
                andAlignment:(NSTextAlignment)setAlig{
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.backgroundColor = aColor;
    label.textColor = color;
    label.text = [NSString stringWithFormat:@"%@ %@",title,sendStr];
    label.font = aFont;
    label.textAlignment = setAlig;
    
    return [label autorelease];
}

//主要信息界面






@end
