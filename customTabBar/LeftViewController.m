//
//  LeftViewController.m
//  customTabBar
//
//  Created by Xia_Q on 15/11/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "LeftViewController.h"
#import "ViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)jump:(id)sender {
    ViewController *vc=[[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
