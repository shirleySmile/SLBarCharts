//
//  ShowStepDataView.m
//  downBigImage
//
//  Created by shaolei on 17/2/20.
//  Copyright © 2017年 sl. All rights reserved.
//

#import "SLShowStepDataView.h"
#import "SLShowStepView.h"
#import "SLHistogramView.h"

@interface SLShowStepDataView ()

@property(nonatomic,strong)UIScrollView *bgSView;

@end

@implementation SLShowStepDataView

- (instancetype)initWithFrame:(CGRect)frame yearArray:(NSArray *)yearArray monthArray:(NSArray *)monthArray  weekArray:(NSArray *)weekArray;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UISegmentedControl *segMent = [[UISegmentedControl alloc] initWithItems:@[@"周",@"月",@"年"]];
        segMent.frame = CGRectMake(0, 0, self.frame.size.width,35);
        [segMent addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        segMent.tintColor = [UIColor orangeColor];
        [self addSubview:segMent];
        
        _bgSView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segMent.frame)+20, self.frame.size.width, 300)];
        _bgSView.pagingEnabled = YES;
        _bgSView.contentSize = CGSizeMake(self.frame.size.width *3, self.frame.size.height);
        _bgSView.layer.cornerRadius = 5;
        _bgSView.layer.masksToBounds = YES;
        [self setScrollBgColor:_bgSView];
        [self addSubview:_bgSView];
        
        NSArray *showArr = @[weekArray,monthArray,yearArray];
        for (int i = 0; i<showArr.count; i++) {
            
            SLShowStepView *stepView = [[SLShowStepView alloc] initWithFrame:CGRectMake(20+(_bgSView.frame.size.width*i), 10, _bgSView.frame.size.width-40, 50) currentStep:566];
            stepView.averageStepNum = 755+i;
            [_bgSView addSubview:stepView];
            
            SLHistogramView *show = [[SLHistogramView alloc] initWithFrame:CGRectMake(_bgSView.frame.size.width*i, 60, _bgSView.frame.size.width, _bgSView.frame.size.height-60) dateArray:showArr[i] Xtype:2-i leftX:20];
            [_bgSView addSubview:show];
        }
        showArr = nil;
        segMent.selectedSegmentIndex = 0;
    }
    return self;
}

-(void)setScrollBgColor:(UIScrollView *)scrollV{
    //初始化渐变层
    UIView *sendV = [[UIView alloc] initWithFrame:scrollV.frame];
    sendV.layer.cornerRadius = 5;
    sendV.layer.masksToBounds = YES;
    [self addSubview:sendV];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = sendV.bounds;
    [sendV.layer addSublayer:gradientLayer];
    
    //设置渐变颜色方向
    gradientLayer.startPoint = CGPointMake(1, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    
    //设定颜色组
    gradientLayer.colors = @[(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
}

-(void)valueChange:(UISegmentedControl *)seg{

    [self.bgSView setContentOffset:CGPointMake(self.bgSView.frame.size.width*seg.selectedSegmentIndex, 0) animated:NO];
    
}

@end
