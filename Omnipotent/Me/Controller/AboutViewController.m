//
//  AboutViewController.m
//  Omnipotent
//
//  Created by zivInfo on 16/9/13.
//  Copyright © 2016年 xiwangtech.com. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"关于";
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 35.0, 50.0, 70.0, 70.0)];
    imageView.image = [UIImage imageNamed:@"ProfileAvart.png"];
    [self.view addSubview:imageView];

    
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width / 2 - 60.0, self.view.center.y + 70.0, 120.0, 35.0)];
    labelName.backgroundColor = [UIColor clearColor];
    labelName.text = [NSString stringWithFormat:@"Version %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    labelName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelName];
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
