//
//  DynamicTableViewModel.h
//  MVVMDemo
//
//  Created by mofeini on 17/2/11.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//  此类主要作用是  处理tableView的代理和数据源

#import "XYTableViewModelProtocol.h"

@interface DynamicTableViewModel : NSObject<XYTableViewModelProtocol>

@property (nonatomic, assign) BOOL shouldRemoveDataSourceWhenRequestNewData;

@end
