//
//  GameViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/9.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

/*
 挑战 -》列表  (over)
 游戏 -》游戏 转盘
 发现 -》预设人、知名队员。 (over)
 我的 -》头像、昵称、等级、累积的积分、捐出去的积分。
 */
#import "GameViewController.h"

@interface GameViewController ()
{
    double _startValue;
}

@property (nonatomic, strong)TurnTableView *turnTableView;
@property (nonatomic, strong)UIImageView *pointer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _startValue = 0;
    //旋转转盘用到了随机数，这里获取时间作为种子
    srand((unsigned)time(0));
    
    UIColor *color= [UIColor colorWithRed:115/255.0 green:172/255.0 blue:42/255.0 alpha:1];
    [self.view setBackgroundColor:color];
    
    [self setUpUI];
}

- (void)setUpUI
{
    NSDictionary *dataDic = [NSDictionary
                             dictionaryWithObjectsAndKeys:
                             @(1),@"0",
                             @(1),@"1",
                             @(1),@"2",
                             @(2),@"3",
                             @(1),@"4",
                             @(3),@"5",
                             @(2),@"6",
                             @(1),@"7",
                             @(3),@"8",
                             @(2),@"9",
                             nil];
    
    //设置转盘
    self.turnTableView = [[TurnTableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 140, [UIScreen mainScreen].bounds.size.width - 140)withData:dataDic];
    [self.turnTableView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, self.view.frame.size.height/3 - 60)];
    [self.turnTableView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.turnTableView];
    
    //设置红色指针
    self.pointer = [[UIImageView alloc]initWithFrame:CGRectMake(self.turnTableView.center.x + 60, 0, self.turnTableView.frame.size.width/2, 10)];
    [self.pointer setCenter:CGPointMake(self.pointer.center.x, self.turnTableView.center.y)];
    [self.pointer setImage:[UIImage imageNamed:@"red.png"]];
    [self.pointer setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.pointer];
    
    UIColor *color2= [UIColor colorWithRed:250/255.0 green:182/255.0 blue:64/255.0 alpha:1];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 90, 40)];
    btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2 - 10, self.view.frame.size.height/2);
    [btn setBackgroundColor:color2];
    [btn setTitle:@"Start" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(turnTheTable) forControlEvents:UIControlEventTouchUpInside];
    //设置按钮圆角
    [btn.layer setCornerRadius:10];
    [self.view addSubview:btn];
}

- (void)turnTheTable
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//z的意思是绕z轴旋转，此处的z轴是垂直于iPhone，正方向从背面指向屏幕前方
    double endValue = _startValue+(rand()%100)/100.0 * M_PI + M_PI*(rand()%5+5); //这里的endValue单位是弧度，2PI是一圈
    
    //设置旋转的起始值与终止值
    rotationAnimation.fromValue = @(_startValue);
    rotationAnimation.toValue = @(endValue);
    
    //旋转时长
    rotationAnimation.duration = (endValue - _startValue)/(M_PI*2);
    rotationAnimation.autoreverses = NO;
    
    //速度函数
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeBoth;
    [self.turnTableView.layer addAnimation:rotationAnimation forKey:@"TurnTableAnimation"];
    
    //记下当前旋转的位置，作为下一次旋转的起始值
    //    _startValue = endValue;
    NSLog(@"value %f", endValue);
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
