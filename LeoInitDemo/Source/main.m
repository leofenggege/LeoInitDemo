//
//  main.m
//  LeoInitDemo
//
//  Created by LeoGege on 3/11/21.
//

#import <UIKit/UIKit.h>
#import "LGGAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([LGGAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
