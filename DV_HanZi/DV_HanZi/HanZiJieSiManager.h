//
//  HanZiJieSiManager.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HanZiJieSi;

@interface HanZiJieSiManager : NSObject

@property (retain,nonatomic) HanZiJieSi *hanZi;

//传入汉字获得对应的接口
+ (HanZiJieSi *) managerWithKey:(NSString *)json;
- (HanZiJieSi *) hanZiJsonKey:(NSString *)key;
@end
