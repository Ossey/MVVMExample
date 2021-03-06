//
//  Example2VC.m
//  MVVMDemo
//
//  Created by mofeini on 17/2/10.
//  Copyright © 2017年 com.test.demo. All rights reserved.
//

#import "Example2VC.h"
#import "SecondViewModel.h"
#import "SecondTableView_ViewModel.h"
#import "SUIUtils.h"
#import "UIView+XYLoading.h"

@interface Example2VC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SecondTableView_ViewModel *tableView_ViewModel;
@property (nonatomic, strong) SecondViewModel *vm;

@end

@implementation Example2VC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Example2VC";
    [self initTableView];
}

/// 对tableView进行初始化操作
- (void)initTableView {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    /// 传递tableView给tableView_ViewModel，将tableView的代理和数据源转交给tableView_ViewModel内部处理
    [self.tableView_ViewModel prepareTableView:self.tableView];
    
    [self loadDataFromNetwork];
    
    uWeakSelf
    /// 当网络加载失败时，点击按钮可重新加载
    [self.tableView reloadBlock:^{
        [weakSelf loadDataFromNetwork];
    }];
}

- (void)loadDataFromNetwork {
    [self.tableView loading];
    [self.vm xy_viewModelWithProgress:nil success:^(id responseObject) {
        
        [self.tableView loadFinished];
        /// 将数据传给tableView_ViewModel，由其内部处理
        [self.tableView_ViewModel getDataSourceBlock:^NSArray *{
            return responseObject;
        } completion:^{
            /// 加载完成后 刷新数据源
            [self.tableView reloadData];
        }];
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
        
        [self.tableView loadFailure];
    }];

}


#pragma mark - lazy
- (SecondTableView_ViewModel *)tableView_ViewModel {
    if (_tableView_ViewModel == nil) {
        _tableView_ViewModel = [SecondTableView_ViewModel new];
    }
    return _tableView_ViewModel;
}

- (SecondViewModel *)vm {
    if (_vm == nil) {
        _vm = [SecondViewModel new];
    }
    return _vm;
}


- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
