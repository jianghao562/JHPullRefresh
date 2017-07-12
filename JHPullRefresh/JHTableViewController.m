//
//  TableViewController.m
//  Test
//
//  Created by Jiang Hao on 2017/3/20.
//  Copyright © 2017年 Jiang Hao. All rights reserved.
//

#import "JHTableViewController.h"
#import "JHRefreshHeader.h"


@interface JHTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *arr;
@end

@implementation JHTableViewController

static  NSString * ID=@"newCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    _arr=@[@"ccccc",@"ddddd",@"ffggg",@"oioioio",@"wwwwww",@"ggggggg"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    
    self.tableView.mj_header =[JHRefreshHeader headerWithRefreshingBlock:^{
    
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             NSLog(@"开始刷新");
             [self.tableView.mj_header endRefreshing];
        });
       
        
    }];
    
 
    [self.tableView.mj_header beginRefreshing];
    
  
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text=self.arr[indexPath.row];
    NSLog(@"%@",cell.textLabel.text);
    
    return cell;
}


@end
