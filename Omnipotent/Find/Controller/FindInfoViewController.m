//
//  FindInfoViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/12.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "FindInfoViewController.h"

@interface FindInfoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *findInfoTableView;

@end

@implementation FindInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"论坛话题";
    
    [self initTableView];

}

-(void)initTableView
{
    self.findInfoTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.findInfoTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.findInfoTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.findInfoTableView.delegate = self;
    self.findInfoTableView.dataSource = self;
    [self.view addSubview:self.findInfoTableView];
}

#pragma mark -
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"FindInfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"帖子 %d", indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FindInfoViewController *findInfoViewController = [[FindInfoViewController alloc] init];
    [self.navigationController pushViewController:findInfoViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
