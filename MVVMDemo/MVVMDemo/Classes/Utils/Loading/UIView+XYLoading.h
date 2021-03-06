//
//  UIView+XYLoading.h
//  MVVMDemo
//
//  Created by mofeini on 17/2/11.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYLoadingView.h"

@interface UIView (XYLoading)

@property (nonatomic) XYLoadingView *loadingView;

/// 当数据加载失败时，可调用此方法在block中做处理，点击重新加载时，会回调此block
/// 注意：此方法对block进行了强引用
- (void)reloadBlock:(void(^)())block;

/// 正在加载中
- (void)loading;
/// 加载完成
- (void)loadFinished;
/// 加载失败
- (void)loadFailure;

@end
