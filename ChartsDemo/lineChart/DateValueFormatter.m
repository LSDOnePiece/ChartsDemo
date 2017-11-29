//
//  DateValueFormatter.m
//  ChartsDemo
//
//  Created by 神州锐达 on 2017/11/28.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "DateValueFormatter.h"

@interface DateValueFormatter()

@property(strong,nonatomic)NSArray *arr;

@end

@implementation DateValueFormatter
-(id)initWithArr:(NSArray *)arr{
    self = [super init];
    if (self)
    {
        _arr = arr;
        
    }
    return self;
}
-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    return _arr[(NSInteger)value];
}

@end
