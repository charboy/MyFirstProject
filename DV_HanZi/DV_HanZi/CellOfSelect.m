//
//  CellOfSelect.m
//  DV_HanZi
//
//  Created by ibokan on 13-6-23.
//  Copyright (c) 2013年 zzl. All rights reserved.
//

#import "CellOfSelect.h"

@implementation CellOfSelect

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        //标题
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 7, 39, 39)];
        self.titleLabel.font = [UIFont fontWithName:@"KaiTi_GB2312" size:30];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mizige.png"]];
        [self.contentView addSubview:self.titleLabel];
        
        //拼音
        self.pinYin = [[UILabel alloc]initWithFrame:CGRectMake(70, 7, 100, 18)];
        self.pinYin.backgroundColor = [UIColor clearColor];
        self.pinYin.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.pinYin];
        //部首
        self.buShou = [[UILabel alloc]initWithFrame:CGRectMake(70, 28, 100, 20)];
        self.buShou.backgroundColor = [UIColor clearColor];
        self.buShou.font = [UIFont fontWithName:@"KaiTi_GB2312" size:19];
        self.buShou.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.buShou];
        //笔画
        self.biHua = [[UILabel alloc]initWithFrame:CGRectMake(220, 28, 100, 20)];
        self.biHua.backgroundColor = [UIColor clearColor];
        self.biHua.font = [UIFont systemFontOfSize:19];
        [self.contentView addSubview:self.biHua];
        //喇叭
        self.soundBut = [UIButton buttonWithType:UIButtonTypeCustom];
        self.soundBut.frame = CGRectMake(175, 5, 25, 23);
        [self.soundBut setBackgroundImage:[UIImage imageNamed:@"loud.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.soundBut];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
