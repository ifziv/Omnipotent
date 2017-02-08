//
//  SystemViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/13.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "SystemViewController.h"

@interface SystemViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *systemTableView;

@end

@implementation SystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"系统设置";
    
    [self initTableView];
    [self initView];

}

-(void)initView
{
    UIButton *exitLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    exitLogin.frame = CGRectMake(30.0, self.view.center.y + 70.0, [[UIScreen mainScreen] bounds].size.width - 60.0, 45.0);
    [exitLogin setBackgroundColor:[UIColor redColor]];
    exitLogin.layer.cornerRadius = 4.0;
    exitLogin.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [exitLogin setTitle:@"退出登录" forState:UIControlStateNormal];
    [exitLogin setTintColor:[UIColor whiteColor]];
    [exitLogin addTarget:self action:@selector(exitLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.systemTableView addSubview:exitLogin];
}

-(void)exitLogin
{
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"APPIsLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [((AppDelegate*)[[UIApplication sharedApplication] delegate]) LoginAction];
}

-(void)initTableView
{
    self.systemTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.systemTableView.delegate = self;
    self.systemTableView.dataSource = self;
    [self.view addSubview:self.systemTableView];
}

#pragma mark -
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"SystemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    cell.textLabel.text = @"清除缓存";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"清理完成！" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"好的", nil];
    [alertView show];
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
