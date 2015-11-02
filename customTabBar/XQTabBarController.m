//
//  XQTabBarController.m
//  customTabBar
//
//  Created by Xia_Q on 15/11/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#define xMidViewWidth 49
#define xMidViewHeight 61
#define xMidBtnWidth xMidViewWidth
#define xMidBtnHeight 50

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#import "XQTabBarController.h"
#import "XQTabBarButton.h"
@interface XQTabBarController ()<UINavigationControllerDelegate>

@end

@implementation XQTabBarController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

-(void)setHidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed{
    self.myTabBar.hidden = hidesBottomBarWhenPushed;
    self.midView.hidden = hidesBottomBarWhenPushed;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;

    
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    Class class[5]={[LeftViewController class],[Left2ViewController class],[MidViewController class],[Right2ViewController class],[RightViewController class]};
    for (int i=0; i<5; i++) {
        RootViewController *rvc=[[class[i] alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rvc];
        [vcArray addObject:nav];
    }
    self.viewControllers = vcArray;

    
    CGRect frame=CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH ,49);
    UIView *tabBar=[self ViewAddBarButtonsWithFrame:frame];
    tabBar.frame=frame;
    tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab-_白色透明背景渐变"]];
    self.myTabBar=tabBar;
    [self.view addSubview:self.myTabBar];
    
    
    _midView=[[UIView alloc]init];
    _midView.center = CGPointMake(SCREEN_WIDTH*0.5, SCREEN_HEIGHT-(60*0.5));
    _midView.bounds = CGRectMake(0, 0, 49, 60);
    _midView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_摄影机图标背景"]];
    [self.view addSubview:_midView];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击前"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击后"] forState:UIControlStateHighlighted];
    btn.center=CGPointMake(49/2.0, 30);
    btn.bounds=CGRectMake(0, 0, 49, 49);
    btn.tag = 2;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_midView addSubview:btn];

    
}

-(UIView *)ViewAddBarButtonsWithFrame:(CGRect)frame
{
    UIView *tabBarView=[[UIView alloc]init];
    
    for (int i=0; i<5; i++) {
        CGFloat w=frame.size.width/5;
        CGFloat h=49;
        XQTabBarButton *btn=[[XQTabBarButton alloc]initWithFrame:CGRectMake(i*w, 0, w, h)];

        NSString *title;
        
        if (i==0) {
            title=@"1";

        }else if(i==1){
            title=@"2";
        }else if(i==2){
            
        }else if(i==3){
            title=@"4";
        }else
        {
            title=@"5";
        }
        btn.tag=i;
        
        if(btn.tag!=2)
        {
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"sel%d",i]] forState:UIControlStateSelected];
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize: 11.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleColor:RGB(29, 173, 248) forState:UIControlStateSelected];
            [btn setTitleColor:RGB(128, 128, 128) forState:UIControlStateNormal];
            [tabBarView addSubview:btn];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        }
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        if(i == 0){
            btn.selected=YES;
        }
    }
    return tabBarView;
    
}


-(void)btnClick:(UIButton *)btn
{
    
    if (btn.tag==2) {
        btn.selected=YES;
        for (UIView *view in _myTabBar.subviews) {
            if ([view isKindOfClass:[XQTabBarButton class]]) {
                XQTabBarButton *button=(XQTabBarButton *)view;
                button.selected=NO;
            }
        }
    }
    
    if (btn.tag!=2) {
        UIButton *button=(UIButton *)[_midView viewWithTag:2];
        button.selected=NO;
        for (UIView *view  in  _myTabBar.subviews) {
            XQTabBarButton *bt=(XQTabBarButton *)view;
            if (btn.tag==bt.tag) {
                bt.selected=YES;
            }else
            {
                bt.selected=NO;
            }
        }
    }
    
    self.selectedIndex = btn.tag;
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
