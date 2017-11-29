//
//  PieValueFormatter.m
//  ChartsDemo
//
//  Created by 神州锐达 on 2017/11/28.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "PieValueFormatter.h"

@implementation PieValueFormatter

-(NSString *)stringForValue:(double)value entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler *)viewPortHandler{
    
    LSDLog(@"%zd",dataSetIndex);
    
    return [NSString stringWithFormat:@"%ld%%",(NSInteger)entry.y];
    
}

@end
