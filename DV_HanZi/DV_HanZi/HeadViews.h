//
//  HeadViews.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol goBackOrNext <NSObject>

@optional
- (void) goBack;
- (void) goNext;

@end

@interface HeadViews : NSObject

@property (assign,nonatomic) id<goBackOrNext>goDaleget;//翻页协议

+ (UIView *) creatHeadViewLitfImg:(NSString *)lImgName
                    andLifSomeImg:(NSString *) slImagName
                      andRightImg:(NSString *)rImgName
                  andRightSomeImg:(NSString *)srImagName
                     andHeadTitle:(NSString *)aTitle;

@end
