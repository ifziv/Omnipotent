//
//  MeViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/9.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataAry;
@property (strong, nonatomic) UITableView *meTableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _dataAry = @[@"安全中心",@"系统设置",@"关于"];
    [self initTableView];
}

-(void)initTableView
{
    self.meTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.meTableView.delegate = self;
    self.meTableView.dataSource = self;
    [self.view addSubview:self.meTableView];
}

#pragma mark -
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return [_dataAry count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"ChallengeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    if (indexPath.section == 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0, 10.0, 70.0, 70.0)];
        imageView.layer.cornerRadius = imageView.frame.size.height/2;
        imageView.layer.masksToBounds = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [imageView setClipsToBounds:YES];
        imageView.layer.shadowColor = [UIColor whiteColor].CGColor;
        imageView.layer.shadowOffset = CGSizeMake(4.0, 4.0);
        imageView.layer.shadowOpacity = 0.5;
        imageView.layer.shadowRadius = 2.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 2.0f;
        imageView.image = [UIImage imageNamed:@"ProfileAvart.png"];
        [cell.contentView addSubview:imageView];
        
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 13.0, 150.0, 35.0)];
        labelView.backgroundColor = [UIColor clearColor];
        labelView.text = @"用户名";
        [cell.contentView addSubview:labelView];
        
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 47.0, 150.0, 35.0)];
        labelName.backgroundColor = [UIColor clearColor];
        labelName.text = @"明儿见";
        labelName.font = [UIFont systemFontOfSize:15.0f];
        [cell.contentView addSubview:labelName];
        
    }
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [_dataAry objectAtIndex:indexPath.row]];
    }
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90.0f;
    }
    else {
        return 50.0f;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        PersonalViewController *personalViewController = [[PersonalViewController alloc] init];
        [self.navigationController pushViewController:personalViewController animated:YES];
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SecurityViewController *securityViewController = [[SecurityViewController alloc] init];
            [self.navigationController pushViewController:securityViewController animated:YES];
        }
        else if (indexPath.row == 1) {
            SystemViewController *systemViewController = [[SystemViewController alloc] init];
            [self.navigationController pushViewController:systemViewController animated:YES];
        }
        else {
            AboutViewController *aboutViewController = [[AboutViewController alloc] init];
            [self.navigationController pushViewController:aboutViewController animated:YES];
        }
    }
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
