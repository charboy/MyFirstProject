//
//  XianXiViews.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XianXiViews : NSObject


+ (UIView *) creatViewWithFrame:(CGRect ) frame
                    andImgFrame:(CGRect ) imgFrame
                        andName:(NSString *)imgName
                       andTitle:(NSString *)atitle;

@end
