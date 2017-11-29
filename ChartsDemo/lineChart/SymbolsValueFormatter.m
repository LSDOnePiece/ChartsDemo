//
//  SymbolsValueFormatter.m
//  ChartsDemo
//
//  Created by 神州锐达 on 2017/11/28.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "SymbolsValueFormatter.h"

@implementation SymbolsValueFormatter
-(id)init{
    if (self = [super init]) {
        
    }
    return self;}

//IChartAxisValueFormatter的代理方法
-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    return [NSString stringWithFormat:@"%ld%%",(NSInteger)value];
}

@end
