//
//  ViewController.m
//  ChartsDemo
//
//  Created by 神州锐达 on 2017/11/28.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDLineChartViewController.h"
#import "LSDPieChartViewController.h"
#import "LSDBarChartViewController.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)lineChartBtnClick:(id)sender {
    
    LSDLineChartViewController *lineChartVC = [[LSDLineChartViewController alloc]init];
    
    [self.navigationController pushViewController:lineChartVC animated:YES];
    
}
- (IBAction)pieChartBtnClick:(id)sender {
    
    
    LSDPieChartViewController *pieChartVC = [[LSDPieChartViewController alloc]init];
    
    [self.navigationController pushViewController:pieChartVC animated:YES];
}
- (IBAction)BarChartBtnClick:(id)sender {
    
    LSDBarChartViewController *barChartVC = [[LSDBarChartViewController alloc]init];
    
    [self.navigationController pushViewController:barChartVC animated:YES];
    
}


@end
