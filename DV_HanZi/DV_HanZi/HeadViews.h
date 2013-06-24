//
//  HeadViews.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreatHeadView.h"


@interface HeadViews : NSObject

@property (assign,nonatomic) id<CreatHeadView>goDaleget;//翻页协议


+ (UIView *) creatLifSomeImg:(NSString *)slImagName
             andRightSomeImg:(NSString *)srImagName
                andHeadTitle:(NSString *)aTitle;


@end
