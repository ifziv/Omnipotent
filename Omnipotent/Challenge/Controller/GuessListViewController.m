//
//  GuessListViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/12.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "GuessListViewController.h"

@interface GuessListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataAry;
@property (strong, nonatomic) UITableView *challengeTableView;

@end

@implementation GuessListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"足球竞猜";
    
    _dataAry = @[@"竞猜1",@"竞猜2"];
    
    [self initBarButton];
    [self initTableView];
}

-(void)initBarButton
{
    self.navigationItem.rightBarButtonItem = [ZVBarButtonItem itemWithTargat:self action:@selector(addDevice) image:@"addDevice" highImage:@"addDevice"];
}

-(void)addDevice
{
//    AddGuessViewController *addGuessViewController = [[AddGuessViewController alloc] init];
//    [self.navigationController pushViewController:addGuessViewController animated:YES];
}

-(void)initTableView
{
    self.challengeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.challengeTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.challengeTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    self.challengeTableView.delegate = self;
    self.challengeTableView.dataSource = self;
    [self.view addSubview:self.challengeTableView];
}

#pragma mark -
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataAry count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"GuessListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_dataAry objectAtIndex:indexPath.row]];
    
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
    
    JoinGuessViewController *joinGuessViewController = [[JoinGuessViewController alloc] init];
    [self.navigationController pushViewController:joinGuessViewController animated:YES];
    
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
