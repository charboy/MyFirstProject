//
//  HanZiJieSiManager.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "HanZiJieSiManager.h"
#import "JSON.h"
#import "HanZiJieSi.h"

@implementation HanZiJieSiManager

+ (id) managerWithKey:(NSString *)json{
    
    HanZiJieSiManager *manager = [[HanZiJieSiManager alloc]init];
    
    [manager hanZiJsonKey:json];
    
    return [manager autorelease];
    
}


//json解析
- (HanZiJieSi *) hanZiJsonKey:(NSString *)key{
    
    NSURL *url = [NSURL URLWithString:key];//@"http://www.chazidian.com/service/word/%E5%8A%9E"
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    NSData *getData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    NSString *jsonStr = [[NSString alloc]initWithData:getData encoding:NSUTF8StringEncoding];
    
    NSDictionary *dicJson = [jsonStr JSONValue];
    NSDictionary *dataJson = [dicJson objectForKey:@"data"];
    NSString *baseJson = [dataJson objectForKey:@"base"];
    NSString *hanyuJson = [dataJson objectForKey:@"hanyu"];
    NSString *englishJson = [dataJson objectForKey:@"english"];
    NSString *idiomJson = [dataJson objectForKey:@"idiom"];
    
    self.hanZi = [[[HanZiJieSi alloc]init]autorelease];
    self.hanZi.hzBase = baseJson;
    //NSLog(@"self.hanZi.hzBase==%@",self.hanZi.hzBase);
    self.hanZi.hzHanyu = hanyuJson;
    self.hanZi.hzChenyu = idiomJson;
    self.hanZi.hzEnglish = englishJson;
    
    return self.hanZi;
    
}

- (void)dealloc{
    [_hanZi release];
    [super dealloc];
}



@end
