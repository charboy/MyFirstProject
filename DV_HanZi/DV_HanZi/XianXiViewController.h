//
//  XianXiViewController.h
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ASIHTTPRequest.h"

@class MyLabel;
@class HanZiJieSi;
@class HanZiJieSiManager;

@interface XianXiViewController : UIViewController<AVAudioPlayerDelegate,ASIHTTPRequestDelegate>//播放器的协议

@property (retain, nonatomic) UIView *headView;
@property (retain, nonatomic) UIView *footView;
@property (retain, nonatomic) UILabel *miZiGeLabel;
@property (retain, nonatomic) UIView *shuFaJia;//书法家
@property (retain, nonatomic) UIView *fuZi;//复制
@property (retain, nonatomic) UIView *shouCan;//收藏
@property (retain, nonatomic) UIView *fenXian;//分享
@property (retain, nonatomic) MyLabel *myLabel;
@property (copy, nonatomic) NSString *headTitle;//导航栏标题
//拼音等
@property (retain, nonatomic) UILabel *pinYin;
@property (retain, nonatomic) UILabel *fanTi;
@property (retain, nonatomic) UILabel *buShou;
@property (retain, nonatomic) UILabel *biShun;
@property (retain, nonatomic) UILabel *zhuYin;
@property (retain, nonatomic) UILabel *jieGou;
@property (retain, nonatomic) UILabel *buShouBiHua;
@property (retain, nonatomic) UILabel *biHua;

//汉字解释
@property (retain, nonatomic) HanZiJieSi *hanZiJS;
@property (retain, nonatomic) UITextView *textView;

//播音
@property (retain, nonatomic) AVAudioPlayer *soundPlay;


@end

