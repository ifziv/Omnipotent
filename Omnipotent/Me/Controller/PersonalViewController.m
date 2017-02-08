//
//  PersonalViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/13.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataAry;
@property (strong, nonatomic) NSArray *dataAry2;
@property (strong, nonatomic) UITableView *personalTableView;

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人资料";
    
    _dataAry = @[@"等级", @"关注", @"粉丝", @"积分", @"收藏"];
    _dataAry2 = @[@"15", @"150", @"260", @"197800", @""];

    [self initView];
    [self initTableView];
}

-(void)initView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 35.0, 10.0, 70.0, 70.0)];
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
    [self.view addSubview:imageView];
    
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 85.0, 85.0, 170.0, 35.0)];
    labelName.backgroundColor = [UIColor clearColor];
    labelName.text = @"明儿见";
    labelName.font = [UIFont systemFontOfSize:14.0f];
    labelName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelName];

}

-(void)initTableView
{
    self.personalTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.personalTableView.delegate = self;
    self.personalTableView.dataSource = self;
    self.personalTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.personalTableView];
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
    static NSString *CellWithIdentifier = @"PersonalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellWithIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_dataAry objectAtIndex:indexPath.row]];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [_dataAry2 objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 150.0f;
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
