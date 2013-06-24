//
//  XianXiDownLoad.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"


@interface XianXiDownLoad : NSObject <ASIHTTPRequestDelegate>

@property (retain, nonatomic) NSData *getData;

- (id) getDataFromUrl:(NSString *)urlStr;
@end
