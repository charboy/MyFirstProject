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

+ (UIView *) creatHeadViewLitfImg:(NSString *)lImgName
                    andLifSomeImg:(NSString *)slImagName
                      andRightImg:(NSString *)rImgName
                  andRightSomeImg:(NSString *)srImagName
                     andHeadTitle:(NSString *)aTitle
{
    //导航
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
    headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    
    //左
    UIView *liftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 61, 44)];
    [headView addSubview:liftView];
    UIButton *liftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    liftBt.frame = CGRectMake((61-22)/2, (44-21)/2, 22, 21);
    [liftBt setBackgroundImage:[UIImage imageNamed:lImgName] forState:UIControlStateNormal];
    [liftBt addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [liftView addSubview:liftBt];
    UIView *liftLine = [[UIView alloc]initWithFrame:CGRectMake(61, 0, 1, 44)];
    [liftLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:slImagName]]];
    
    [headView addSubview:liftLine];
    
    //右
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(320-61, 0, 61, 44)];
    //rightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"enter.png"]];
    [headView addSubview:rightView];
    UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBt.frame = CGRectMake((61-22)/2, (44-21)/2, 22, 21);
    [rightBt setBackgroundImage:[UIImage imageNamed:rImgName] forState:UIControlStateNormal];
    [rightView addSubview:rightBt];
    [rightBt addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
    [rightLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:srImagName]]];
    [headView addSubview:rightLine];
    
    UIView *dividLine = [[UIView alloc]initWithFrame:CGRectMake(0, 45, 320, 1)];
    [dividLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]]];
    [headView addSubview:dividLine];
    
    //标题
    UILabel *headTitle = [MyLabel creatLabelWith:CGRectMake(60, 5, 200, 34)
                              andBackGroundColor:[UIColor clearColor]
                                    andTextColor:[UIColor whiteColor]
                                         andFont:[UIFont systemFontOfSize:30]
                                        andTitle:aTitle
                                    andSendedStr:nil
                                    andAlignment:NSTextAlignmentCenter];
    [headView addSubview:headTitle];

    
    
    [rightLine release];
    [liftLine release];
    [dividLine release];
    [rightView release];
    [liftView release];
    [headTitle release];
    
    return [headView autorelease];
}



//



- (void)dealloc
 {
     [super dealloc];
                                
        }
                            
@end
