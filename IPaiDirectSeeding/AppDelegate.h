//
//  AppDelegate.h
//  IPaiDirectSeeding
//
//  Created by 牧仁者 on 2017/5/6.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UITabBarController *tabBarController;

- (void)showLoginController;//去登录页
- (void)showTabBarController;

@end

