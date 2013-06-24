//
//  XianXiViewController.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "XianXiViewController.h"
#import "MyLabel.h"
#import "XianXiViews.h"
#import "HanZiJieSiManager.h"
#import "HanZiJieSi.h"
#import "XianXiDownLoad.h"
#import "HeadViews.h"
#import "SelectViewController.h"



@interface XianXiViewController ()

@end

@implementation XianXiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	//文本内容
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(2, 190, 316, 291)];
    [mainView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"informatianlow.png"]]];
    [self.view addSubview:mainView];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(260, -13, 35, 54)];
    img.image = [UIImage imageNamed:@"brooch.png"];
    [mainView addSubview:img];
    
    self.hanZiJS = [[HanZiJieSiManager alloc]hanZiJsonKey:@"http://www.chazidian.com/service/word/办"];
    
    
    //页内容
//    UILabel *mainLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 2, 280, 280)];
//    mainLabel.backgroundColor = [UIColor greenColor];
//    mainLabel.text = self.hanZiJS.hzBase;
//    
//    [mainView addSubview:mainLabel];
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 2, 280, 280)];
    self.textView.userInteractionEnabled = NO;
    //self.textView.
    self.textView.backgroundColor = [UIColor greenColor];
    [mainView addSubview:_textView];
    _textView.text = self.hanZiJS.hzBase;
    
    
   // [mainView release];
    [img release ];
    
    //加载Views
    [self loadViews];
    //加载Labels
    [self loadLabels];
    
    //发音按钮
    UIButton *soundBt1 = [UIButton buttonWithType:UIButtonTypeCustom];
    soundBt1.frame = CGRectMake(135, 55, 25, 23);
    [soundBt1 setBackgroundImage:[UIImage imageNamed:@"loud.png"] forState:UIControlStateNormal];
    [soundBt1 addTarget:self action:@selector(sound1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:soundBt1];
    
    UIButton *soundBt2 = [UIButton buttonWithType:UIButtonTypeCustom];
    soundBt2.frame = CGRectMake(225, 55, 25, 23);
    [soundBt2 setBackgroundImage:[UIImage imageNamed:@"loud.png"] forState:UIControlStateNormal];
    [soundBt2 addTarget:self action:@selector(sound1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:soundBt2];
    
    //选择条
    NSArray *arr = [[NSArray alloc]initWithObjects:@"基本信息",@"汉语字典",@"组词成语",@"英语翻译", nil];
    
    UISegmentedControl *hanZiSeg = [[UISegmentedControl alloc]initWithItems:arr];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor, [UIFont fontWithName:@"SnellRoundhand-Bold"size:14],UITextAttributeFont ,[UIColor whiteColor],UITextAttributeTextShadowColor, nil];//设置字体、颜色
    [hanZiSeg setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    hanZiSeg.frame = CGRectMake(5, 145, 310, 35);
    [hanZiSeg setBackgroundImage:[UIImage imageNamed:@"pyjz_normal01.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [hanZiSeg setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    hanZiSeg.segmentedControlStyle = UISegmentedControlStyleBar;
    
    hanZiSeg.selectedSegmentIndex = 0;
    [hanZiSeg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:hanZiSeg];
    
    [arr release];
    [hanZiSeg release];
    
    
    
    
}
- (void)loadViews
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    
    //导航
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
    self.headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    [self.view addSubview:self.headView];
    //左
    UIView *liftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 61, 44)];
    [self.headView addSubview:liftView];
    UIButton *liftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    liftBt.frame = CGRectMake((61-22)/2, (44-21)/2, 22, 21);
    [liftBt setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [liftBt addTarget:self action:@selector(back ) forControlEvents:UIControlEventTouchUpInside];
    [liftView addSubview:liftBt];
    UIView *liftLine = [[UIView alloc]initWithFrame:CGRectMake(61, 0, 1, 44)];
    [liftLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]]];
    
    [self.headView addSubview:liftLine];
//
//    //右
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(320-61, 0, 61, 44)];
    //rightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"enter.png"]];
    [self.headView addSubview:rightView];
    UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBt.frame = CGRectMake((61-22)/2, (44-21)/2, 22, 21);
    [rightBt setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [rightView addSubview:rightBt];
    [rightBt addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(320-61, 0, 1, 44)];
    [rightLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]]];
    [self.headView addSubview:rightLine];
    
    UIView *dividLine = [[UIView alloc]initWithFrame:CGRectMake(0, 45, 320, 1)];
    [dividLine setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]]];
    [self.view addSubview:dividLine];
//
    //标题
    UILabel *headTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, 200, 34)];
    headTitle.textAlignment = NSTextAlignmentCenter;
    headTitle.backgroundColor = [UIColor clearColor];
    headTitle.text = @"呵呵呵";
    [self.headView addSubview:headTitle];
//    
    [rightLine release];
    [liftLine release];
    [dividLine release];
    [rightView release];
    [liftView release];
    [headTitle release];
    
    //页签效果
    self.footView = [[UIView alloc]initWithFrame:CGRectMake(0, 460-45, 320, 45)];
    self.footView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    [self.view addSubview:self.footView];
    
    self.shuFaJia = [XianXiViews creatViewWithFrame:CGRectMake(10, 0, 59, 44)
                                        andImgFrame:CGRectMake(35/2, 2, 25, 28)
                                            andName:@"pen.png"
                                           andTitle:@"书法家"];
    [self.footView addSubview:self.shuFaJia];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBackImg:)];
    [_shuFaJia addGestureRecognizer:tap];
    
    self.fuZi = [XianXiViews creatViewWithFrame:CGRectMake(80, 0, 59, 44)
                                    andImgFrame:CGRectMake(35/2, 5, 29, 21)
                                        andName:@"document.png"
                                       andTitle:@"复制"];
    [self.footView addSubview:self.fuZi];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBackImg1:)];
    [_fuZi addGestureRecognizer:tap1];
    
    self.shouCan = [XianXiViews creatViewWithFrame:CGRectMake(160, 0, 59, 44)
                                    andImgFrame:CGRectMake(35/2, 2, 28, 27)
                                        andName:@"star.png"
                                       andTitle:@"收藏"];
    [self.footView addSubview:self.shouCan];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBackImg2:)];
    [_shouCan addGestureRecognizer:tap2];
    
    self.fenXian = [XianXiViews creatViewWithFrame:CGRectMake(320-59-10, 0, 59, 44)
                                       andImgFrame:CGRectMake(35/2, 3, 24, 24)
                                           andName:@"share.png"
                                          andTitle:@"分享"];
    [self.footView addSubview:self.fenXian];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBackImg3:)];
    [_fenXian addGestureRecognizer:tap3];
    
}

- (void)home
{
    NSLog(@"home");
}

- (void)back
{
    //SelectViewController *select = [[SelectViewController alloc]init];
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
    
}

//书法家
- (void)changeBackImg:(UITapGestureRecognizer*)sender
{
    [self.shuFaJia  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"concave.png"]]];
    [self.fuZi  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.shouCan  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fenXian  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
}
//复制
- (void)changeBackImg1:(UITapGestureRecognizer*)sender
{
    [self.shuFaJia  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fuZi  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"concave.png"]]];
    [self.shouCan  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fenXian  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    
    UIAlertView *copyAlert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"字典内容复制成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [copyAlert show];
    
}
//收藏
- (void)changeBackImg2:(UITapGestureRecognizer*)sender
{
    [self.shuFaJia  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fuZi  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.shouCan  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"concave.png"]]];
    [self.fenXian  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    UIAlertView *copyAlert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功，您可以在“我的收藏”中看到收藏内容" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [copyAlert show];
}
//分享
- (void)changeBackImg3:(UITapGestureRecognizer*)sender
{
    [self.shuFaJia  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fuZi  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.shouCan  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@" "]]];
    [self.fenXian  setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"concave.png"]]];
    
}

//选项条
- (void)segmentAction:(UISegmentedControl *)sender
{
    int index = [sender selectedSegmentIndex];
    
    switch (index) {
        case 0:
            NSLog(@"0");
            _textView.text = self.hanZiJS.hzBase;
            break;
        case 1:
            NSLog(@"1");
            _textView.text = self.hanZiJS.hzHanyu;
            break;
        case 2:
            NSLog(@"2");
            _textView.text = self.hanZiJS.hzChenyu;
            break;
        case 3:
            NSLog(@"3");
            _textView.text = self.hanZiJS.hzEnglish;
            break;
        default:
            break;
    }
    
    
}

- (void)loadLabels
{
    //米
    self.miZiGeLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 60, 60, 61)];
    [self.miZiGeLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"banmizige.png"]]];
    self.miZiGeLabel.textAlignment = NSTextAlignmentCenter;
    self.miZiGeLabel.font = [UIFont fontWithName:@"Chalkduster" size:50     ];
    self.miZiGeLabel.text = @"米";
    [self.view addSubview:self.miZiGeLabel];
    
    //拼音
    self.zhuYin = [MyLabel creatLabelWith:CGRectMake(70+95, 60, 95, 15)
                       andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"注音:" andSendedStr:@"山是" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.zhuYin];
    
    self.fanTi = [MyLabel creatLabelWith:CGRectMake(70+95, 80, 95, 15)
                      andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"结构:" andSendedStr:@"帮" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.fanTi];
    
    self.buShouBiHua = [MyLabel creatLabelWith:CGRectMake(70+95, 100, 95, 15)
                            andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"部首笔画:" andSendedStr:@"2" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.buShouBiHua];
    
    self.fanTi = [MyLabel creatLabelWith:CGRectMake(70, 80, 95, 15)
                      andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"繁体:" andSendedStr:@"吧" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.fanTi];
    
    self.buShou = [MyLabel creatLabelWith:CGRectMake(70, 100, 95, 15)
                       andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"部首:" andSendedStr:@"l" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.buShou];
    
    self.pinYin = [MyLabel creatLabelWith:CGRectMake(70, 60, 95, 15)
                       andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"拼音:" andSendedStr:@"ban" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.pinYin];
    
    self.biShun = [MyLabel creatLabelWith:CGRectMake(70, 120, 95, 15)
                       andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"笔顺:" andSendedStr:@"打开的" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.biShun];
    
    self.biHua = [MyLabel creatLabelWith:CGRectMake(70+95+95, 100, 75, 15)
                      andBackGroundColor:[UIColor clearColor] andTextColor:[UIColor redColor] andFont:[UIFont fontWithName:@"Chalkduster" size:12] andTitle:@"笔画:" andSendedStr:@"3" andAlignment:NSTextAlignmentLeft];
    [self.view addSubview:self.biHua];
}

- (void)sound1{
    NSLog(@"sound!");
    self.hanZiJS.hzTitle = @"去";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=%@",self.hanZiJS.hzTitle]];
    NSLog(@"soundKey%@",self.hanZiJS.hzTitle);
    
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:url];
    req.delegate = self;
    [req startAsynchronous];
    [req setCompletionBlock:^{
        NSData *soundData = [req responseData];
        NSError *error = nil;
        self.soundPlay = [[AVAudioPlayer alloc]initWithData:soundData error:&error];
    [self.soundPlay play];
    }];
}



//- (void)back{
//    NSLog(@"back->");
//}
//
//- (void)home{
//    NSLog(@"home->");
//}



- (void)dealloc
{
    [_headView release];
    [_footView release];
    [_miZiGeLabel release];
    [_myLabel release];
    [_pinYin release];
    [_fanTi release];
    [_buShou release];
    [_biShun release];
    [_zhuYin release];
    [_jieGou release];
    [_buShouBiHua release];
    [_biHua release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
