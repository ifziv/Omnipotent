//
//  LoginViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/13.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSArray *dataAry;
@property (strong, nonatomic) UITableView *loginTableView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    [self initRightBarBtn];
    
    _dataAry = @[@"账号:",@"密码:"];
    [self initTableView];
    [self initLoginBtn];
    [self initOtherView];

}

-(void)initRightBarBtn
{
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithTitle:@"注册 " style:UIBarButtonItemStyleBordered target:self action:@selector(clickEvent)];
    self.navigationItem.rightBarButtonItem = myButton;
}

-(void)clickEvent
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

-(void)initLoginBtn
{
    UIButton *exitLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    exitLogin.frame = CGRectMake(30.0, self.view.center.y - 80.0, [[UIScreen mainScreen] bounds].size.width - 60.0, 45.0);
    [exitLogin setBackgroundColor:[UIColor colorWithRed:73.0/255.0 green:189.0/255.0 blue:204.0/255.0 alpha:1.0]];
    exitLogin.layer.cornerRadius = 4.0;
    exitLogin.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [exitLogin setTitle:@"登录" forState:UIControlStateNormal];
    [exitLogin setTintColor:[UIColor whiteColor]];
    [exitLogin addTarget:self action:@selector(btnLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginTableView addSubview:exitLogin];
}

-(void)initOtherView
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 3, self.view.center.y - 20, [[UIScreen mainScreen] bounds].size.width / 3, 40)];
    label.text = @"其它方式登录";
    label.font = [UIFont systemFontOfSize:15.0f];
    label.textAlignment = NSTextAlignmentCenter;
    [self.loginTableView addSubview:label];
    
    UIButton *QQLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    QQLogin.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 60, self.view.center.y + 30.0, 45.0, 45.0);
    [QQLogin setBackgroundColor:[UIColor colorWithRed:73.0/255.0 green:189.0/255.0 blue:204.0/255.0 alpha:1.0]];
    QQLogin.layer.cornerRadius = 4.0;
    QQLogin.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [QQLogin setTitle:@"QQ" forState:UIControlStateNormal];
    [QQLogin setTintColor:[UIColor whiteColor]];
    [QQLogin addTarget:self action:@selector(btnLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginTableView addSubview:QQLogin];
    
    UIButton *SinaLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    SinaLogin.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 + 15, self.view.center.y + 30.0, 45.0, 45.0);
    [SinaLogin setBackgroundColor:[UIColor colorWithRed:73.0/255.0 green:189.0/255.0 blue:204.0/255.0 alpha:1.0]];
    SinaLogin.layer.cornerRadius = 4.0;
    SinaLogin.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [SinaLogin setTitle:@"Sina" forState:UIControlStateNormal];
    [SinaLogin setTintColor:[UIColor whiteColor]];
    [SinaLogin addTarget:self action:@selector(btnLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginTableView addSubview:SinaLogin];

    
}

-(void)btnLogin
{
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"APPIsLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [((AppDelegate*)[[UIApplication sharedApplication] delegate]) RootAction];
}

-(void)initTableView
{
    self.loginTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    self.loginTableView.delegate = self;
    self.loginTableView.dataSource = self;
    [self.view addSubview:self.loginTableView];
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
    static NSString *CellWithIdentifier = @"SystemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_dataAry objectAtIndex:indexPath.row]];
    
    if (indexPath.row == 0) {
        UITextField *textName = [[UITextField alloc] initWithFrame:CGRectMake(60, 7, 250, 40)];
        textName.keyboardAppearance = UIReturnKeyDefault;
        textName.placeholder = @"";
        textName.delegate = self;
        [cell.contentView addSubview:textName];
    }
    else {
        UITextField *textPwd = [[UITextField alloc] initWithFrame:CGRectMake(60, 7, 250, 40)];
        textPwd.keyboardAppearance = UIReturnKeyDefault;
        textPwd.placeholder = @"";
        textPwd.delegate = self;
        [cell.contentView addSubview:textPwd];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0f;
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
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
