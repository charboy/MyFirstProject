//
//  XianXiDownLoad.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "XianXiDownLoad.h"

@implementation XianXiDownLoad

- (id) getDataFromUrl:(NSString *)urlStr{
    self.getData = [[NSData alloc]init];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:url];
    req.delegate = self;
    [req startAsynchronous];
    
    
    return [self.getData autorelease];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    self.getData = [request responseData];
}

@end
