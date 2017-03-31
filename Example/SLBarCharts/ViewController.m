//
//  ViewController.m
//  SLBarCharts
//
//  Created by shaolei on 17/3/11.
//  Copyright © 2017年 sl. All rights reserved.
//

#import "ViewController.h"
#import <SLBarCharts/SLShowStepDataView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SLShowStepDataView *data = [[SLShowStepDataView alloc] initWithFrame:CGRectMake(10, 60, self.view.frame.size.width-20, 200) yearArray:@[@"12",@"225",@"5256",@"0",@"325",@"1228",@"0",@"5456",@"1000",@"2000",@"14758",@"233"] monthArray:@[@"12",@"225",@"5256",@"0",@"325",@"1228",@"0",@"12",@"225",@"5256",@"0",@"325",@"1228",@"0",@"12",@"225",@"5256",@"0",@"325",@"1228",@"0",@"12",@"225",@"5256",@"0",@"325",@"1228",@"55",@"22",@"222"]weekArray:@[@"12",@"225",@"5256",@"0",@"325",@"1228",@"55"]];
    [self.view addSubview:data];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
