//
//  LGGRootTabbarContrller.m
//  LeoInitDemo
//
//  Created by LeoGege on 3/15/21.
//

#import "LGGRootTabbarContrller.h"

#import "LGGOneVC.h"
#import "LGGTwoVC.h"
#import "LGGThreeVC.h"
#import "LGGFourVC.h"

#import <IQKeyboardManager.h>

@interface LGGRootTabbarContrller () <UITabBarControllerDelegate>


@end

@implementation LGGRootTabbarContrller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置tabbar和nav的基本设置
    [self setTabbarAndNav];
    
    // 设置键盘
    [self setKeyboard];
    
    // 设置子控制器
    [self setMyChildViewController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark =============================== tabbar ===============================
- (void)setTabbarAndNav {
    // 设置tabbar的透明度为0
    self.tabBar.translucent = NO;
    
    // 设置导航栏的透明度为0
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent = NO;
    navBar.tintColor = UIColor.whiteColor;
    /// 设置navbar的颜色
    [navBar setBackgroundImage:[UIImage LGG_imageWithColor:UIColor.redColor] forBarMetrics:UIBarMetricsDefault];
    /// 隐藏navbar下面的线条
    [navBar setShadowImage:[UIImage new]];
    /// 隐藏navbar的字体
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                     NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //隐藏导航分割线
    [[UINavigationBar appearance] setShadowImage:[UIImage LGG_imageWithColor:[UIColor clearColor]]];;
    //隐藏Tabbar分割线
    [[UITabBar appearance] setShadowImage:[UIImage LGG_imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.05]]];
    [[UITabBar appearance] setBackgroundImage:[UIImage LGG_imageWithColor:[UIColor clearColor]]];
    
    
    //TableView适配
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    // 统一设置searchbar的字体大小
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
    setDefaultTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    
    //ScrollView适配
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    
    if (@available(iOS 10.0, *)) {
        [[UITabBar appearance] setTintColor:UIColor.redColor];
        [[UITabBar appearance] setUnselectedItemTintColor: LGGHexColor(@"979797")];
    } else {
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],NSForegroundColorAttributeName:LGGHexColor(@"979797")}forState:UIControlStateNormal];
        
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f],NSForegroundColorAttributeName:LGGHexColor(@"979797")}forState:UIControlStateSelected];
    }
}

- (void)setKeyboard {
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

#pragma mark ============================== 子控制器 ====================================
- (void)setMyChildViewController {
    
    LGGOneVC *vc_one = [LGGOneVC new];
    HBDNavigationController *nav_one = [[HBDNavigationController alloc] initWithRootViewController:vc_one];
    
    LGGTwoVC *vc_two = [LGGTwoVC new];
    HBDNavigationController *nav_two = [[HBDNavigationController alloc] initWithRootViewController:vc_two];
    
    LGGThreeVC *vc_three = [LGGThreeVC new];
    HBDNavigationController *nav_three = [[HBDNavigationController alloc] initWithRootViewController:vc_three];
    
    LGGFourVC *vc_four = [LGGFourVC new];
    HBDNavigationController *nav_four = [[HBDNavigationController alloc] initWithRootViewController:vc_four];
    
    
    NSArray *arr_nav = @[nav_one,nav_two,nav_three,nav_four];
    NSArray *arr_title = @[@"1",@"2",@"3",@"4"];
    NSArray *arr_normalImgs = @[@"",@"",@"",@""];
    NSArray *arr_selectImgs = @[@"",@"",@"",@""];
    
    for (int i = 0; i < arr_nav.count; i++) {
        [self addChildViewController:arr_nav[i] title:arr_title[i] imageName:arr_normalImgs[i] selectedImageName:arr_selectImgs[i]];
    }
}



#pragma mark =============================== 设置 ===============================
- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    // 设置标题
    childViewController.tabBarItem.title = title;
    [childViewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
    // 默认状态下的图片
    childViewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 选中状态图片
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // 设置默认状态的字体和颜色
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :LGGHexColor(@"929292") , NSFontAttributeName : font(10)} forState:UIControlStateNormal];

    // 设置选中状态的字体和颜色
    [childViewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : LGGHexColor(@"108EE9") , NSFontAttributeName : font(10)} forState:UIControlStateSelected];
        
    // 添加 子控制器
    [self addChildViewController:childViewController];
}



@end
