//
//  XQTabBarButton.m
//  customTabBar
//
//  Created by Xia_Q on 15/11/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#define ItemImageRatio 0.8

#import "XQTabBarButton.h"

@implementation XQTabBarButton

#pragma mark 返回按钮内部titlelabel的边框
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, contentRect.size.height*ItemImageRatio-5, contentRect.size.width, contentRect.size.height-contentRect.size.height*ItemImageRatio);
}

#pragma mark 返回按钮内部UIImage的边框
-(CGRect) imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height*ItemImageRatio);//高度只有宽度的0.8
}


@end
