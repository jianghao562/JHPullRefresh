# JHPullRefresh
一款带有进度圈的下拉控件，直接导入即可使用！
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