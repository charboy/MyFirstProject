//
//  SelectViewController.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "SelectViewController.h"
#import "HeadViews.h"
#import "XianXiViewController.h"
#import "CellOfSelect.h"

@interface SelectViewController ()

@end

@implementation SelectViewController

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
	[self loadViews];
    
    self.selectedTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-88)];
    [self.view addSubview:self.selectedTable];
    self.selectedTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    self.selectedTable.delegate = self;
    self.selectedTable.dataSource = self;
    
}


- (void)loadViews
{
    UIView *headView = [HeadViews creatLifSomeImg:@"top.png" andRightSomeImg:@"top.png" andHeadTitle:@"Title"];
    [self.view addSubview:headView];
    
    UIButton *liftBt = [UIButton buttonWithType:UIButtonTypeCustom];
    liftBt.frame = CGRectMake((61-22)/2, (44-21)/2, 22, 21);
    [liftBt setBackgroundImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [liftBt addTarget:self action:@selector(back ) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:liftBt];
    
    UIButton *rightBt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBt.frame = CGRectMake(320-42, (44-21)/2, 22, 21);
    [rightBt setBackgroundImage:[UIImage imageNamed:@"home.png"] forState:UIControlStateNormal];
    [headView addSubview:rightBt];
    [rightBt addTarget:self action:@selector(home) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)home
{
    NSLog(@"home");
    XianXiViewController *xianXi = [[XianXiViewController alloc]init];
    [self presentViewController:xianXi animated:YES completion:^{
        nil;
    }];

    
}

- (void)back
{
    NSLog(@"home");
    XianXiViewController *xianXi = [[XianXiViewController alloc]init];
    [self presentViewController:xianXi animated:YES completion:^{
        nil;
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CellOfSelect *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CellOfSelect alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.pinYin.text = @"dkd";
    cell.buShou.text = @"l";
    cell.biHua.text = @"4";
    cell.titleLabel.text = @"好";
        
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
