//
//  DKActivityVC.m
//  QiCheGou
//
//  Created by Meng Fan on 17/3/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "DKActivityVC.h"

@interface DKActivityVC () <UITableViewDelegate, UITableViewDataSource>

//viewModel
@property (nonatomic, strong) DKActivityVM *viewModel;

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation DKActivityVC
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}
#pragma mark - UI
- (void)setupViews {
    [self.view addSubview:self.tableView];
}


#pragma mark - action

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

//    cell.textLabel.text = @"cell";
    
    UITextField *textField =  [[UITextField alloc] initWithFrame:CGRectMake(10, 2, 200, 30)];
    textField.backgroundColor = [UIColor redColor];
    textField.placeholder = @"请输入...";
    [cell.contentView addSubview:textField];
    
    return cell;
}

#pragma mark - lazyLoading

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
