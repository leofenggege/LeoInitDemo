//
//  AppDelegate.m
//  LeoInitDemo
//
//  Created by LeoGege on 3/11/21.
//

#import "LGGAppDelegate.h"
#import "LGGRootTabbarContrller.h"



@interface LGGAppDelegate ()

@end

@implementation LGGAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LGGRootTabbarContrller *rootTab = [[LGGRootTabbarContrller alloc] init];
    self.window.rootViewController = rootTab;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
