//
//  HeadViews.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "HeadViews.h"
#import "MyLabel.h"


@implementation HeadViews




+ (UIView *) creatLifSomeImg:(NSString *)slImagName
             andRightSomeImg:(NSString *)srImagName
                andHeadTitle:(NSString *)aTitle
{
    //导航
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
    headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    
    //左

    
    UIView *liftLine = [[UIView alloc]initWithFrame:CGRectMake(61, 0, 1, 44)];
    [liftLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:slImagName]]];
    
    [headView addSubview:liftLine];
    
    //右
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
    [rightLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:srImagName]]];
    [headView addSubview:rightLine];
    
    UIView *dividLine = [[UIView alloc]initWithFrame:CGRectMake(0, 46, 320, 1)];
    [dividLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]]];
    [headView addSubview:dividLine];
    
    
    //标题
    UILabel *headTitle = [MyLabel creatLabelWith:CGRectMake(60, 5, 200, 34)
                              andBackGroundColor:[UIColor clearColor]
                                    andTextColor:[UIColor whiteColor]
                                         andFont:[UIFont systemFontOfSize:30]
                                        andTitle:nil
                                    andSendedStr:nil
                                    andAlignment:NSTextAlignmentCenter];
    headTitle.text = aTitle;
    
    [headView addSubview:headTitle];
    
//    [rightLine release];
//    [liftLine release];
//    [dividLine release];
//    [headTitle release];
    
    return [headView autorelease];
}


- (void)dealloc
 {
     [super dealloc];
                                
        }
                            
@end
