//
//  XQTabBarController.h
//  customTabBar
//
//  Created by Xia_Q on 15/11/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "LeftViewController.h"
#import "Left2ViewController.h"
#import "MidViewController.h"
#import "Right2ViewController.h"
#import "RightViewController.h"


@interface XQTabBarController : UITabBarController


@property(nonatomic,strong)UIView *myTabBar;
@property(nonatomic,strong)UIView *midView;
@property(nonatomic,strong)UIButton *midBtn;

@end
