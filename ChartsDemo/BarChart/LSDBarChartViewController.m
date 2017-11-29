//
//  LSDBarChartViewController.m
//  ChartsDemo
//
//  Created by 神州锐达 on 2017/11/29.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "LSDBarChartViewController.h"

@interface LSDBarChartViewController ()<ChartViewDelegate>

@property(strong,nonatomic)BarChartView *chartView;

/** citys */
@property (nonatomic, strong) NSArray *citys;

/** data */
@property (nonatomic, strong) NSArray *datas;

@end

@implementation LSDBarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.citys = @[@"江苏", @"辽宁", @"北京", @"河北", @"天津", @"重庆", @"吉林", @"黑龙江", @"广东", @"山东", @"山西", @"河南", @"陕西", @"福建", @"江西"];
    
    self.datas = @[@"11.5", @"10.2", @"9.5", @"8.7", @"6.1", @"5.5", @"4.3", @"4.1", @"3.5", @"3.4", @"3.2", @"3.1", @"2.9", @"2.6", @"1.9"];
    
    
}

- (void)setBarChart:(BarChartView *)barChart xValues:(NSArray *)xValues yValues:(NSArray *)yValues barTitle:(NSString *)bar
{
    barChart.noDataText = @"暂无数据";
    
    [barChart setDescriptionText:@""];
    barChart.userInteractionEnabled = NO;
    
    ChartXAxis *xAxis = barChart.xAxis;
    xAxis.labelPosition = XAxisLabelPositionBottom;
    xAxis.drawGridLinesEnabled = NO;
    xAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] initWithValues:xValues];
    xAxis.labelFont = [UIFont systemFontOfSize:10];
    xAxis.labelCount = xValues.count;
    xAxis.drawAxisLineEnabled = NO;
    
    // 隐藏上下轴
    barChart.leftAxis.enabled = NO;
    barChart.rightAxis.enabled = NO;
    
    // 设置图例
    ChartLegend *legend = barChart.legend;
    
    legend.horizontalAlignment = ChartLegendHorizontalAlignmentCenter;
    legend.verticalAlignment = ChartLegendVerticalAlignmentBottom;
    legend.orientation = ChartLegendOrientationHorizontal;
    legend.drawInside = YES;
    legend.direction = ChartLegendDirectionLeftToRight;
    legend.form = ChartLegendFormSquare;
    legend.formSize = 10;
    legend.font = [UIFont systemFontOfSize:10];
    legend.textColor = [UIColor magentaColor];
    legend.xOffset = -15;
    
    barChart.extraBottomOffset = 30;
    barChart.extraTopOffset = 30;
    barChart.fitBars = YES;
    
    BarChartData *data = [self generateBarChartData:yValues title:bar barColor:[UIColor orangeColor]];
    
    barChart.data = data;
    
    [barChart animateWithYAxisDuration:1.0];
}

- (BarChartData *)generateBarChartData:(NSArray *)yValues title:(NSString *)title barColor:(UIColor *)barColor
{
    NSMutableArray *entries = [NSMutableArray array];
    for (int i =0; i<yValues.count; i++) {
        BarChartDataEntry *barEntry = [[BarChartDataEntry alloc] initWithX:i y:[yValues[i] doubleValue] icon:[UIImage imageNamed:@"icon"]];
        [entries addObject:barEntry];
    }
    BarChartDataSet *set = [[BarChartDataSet alloc] initWithValues:entries label:title];
    set.colors = @[barColor];
    set.drawValuesEnabled = YES;//是否在柱形图上面显示数值
    set.drawIconsEnabled = YES; // 同时开启即可
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set];
    
    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
    
    
    // 更改显示格式
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    
    [numFormatter setNumberStyle:NSNumberFormatterPercentStyle];
    [numFormatter setPositiveFormat:@"#0.0%%"];
    ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numFormatter];
    [data setValueFormatter:formatter];
    [data setValueFont:[UIFont systemFontOfSize:10]];
    [data setValueTextColor:[UIColor greenColor]];
    
    return data;
}


// 纵向
- (IBAction)portraitAction:(id)sender {
    
    [self.chartView removeFromSuperview];
    
    BarChartView *barChartView = [[BarChartView alloc] init];
    barChartView.delegate = self;
    self.chartView = barChartView;
    self.chartView.frame = CGRectMake(0, 200, self.view.frame.size.width, 400);
    [self.view addSubview:self.chartView];
    
    [self setBarChart:self.chartView xValues:self.citys yValues:self.datas barTitle:@"纵向视图"];
}


// 横向
- (IBAction)landscapeAction:(id)sender {
    
    [self.chartView removeFromSuperview];
    
    HorizontalBarChartView *barChartView = [[HorizontalBarChartView alloc] init];
    barChartView.delegate = self;
    self.chartView = barChartView;
    self.chartView.frame = CGRectMake(0, 200, self.view.frame.size.width, 400);
    [self.view addSubview:self.chartView];
    
    
    [self setBarChart:self.chartView xValues:self.citys yValues:self.datas barTitle:@"横向视图"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
