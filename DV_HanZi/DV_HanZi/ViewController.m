//
//  ViewController.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "HanZiJieSi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.show = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    [self.view addSubview:self.show];
    
    
    HanZiJieSiManager *hz = [HanZiJieSiManager managerWithKey:@"http://www.chazidian.com/service/word/好"];
    NSLog(@"hz==%@",hz.hanZi.hzEnglish);
    NSLog(@"hz==%@",hz.hanZi.hzChenyu);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
