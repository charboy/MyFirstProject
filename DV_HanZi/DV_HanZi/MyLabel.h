//
//  MyLabel.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyLabel : NSObject

+ (UILabel *) creatLabelWith:(CGRect)frame
          andBackGroundColor:(UIColor*)aColor
                andTextColor:(UIColor *) color
                     andFont:(UIFont *) aFont
                    andTitle:(NSString *) title
                andSendedStr:(NSString *) sendStr
                andAlignment:(NSTextAlignment)setAlig;

@end
