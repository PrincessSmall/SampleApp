//
//  SceneDelegate.m
//  SampleApp
//
//  Created by Limin on 2020/6/24.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "InfoViewController.h"
#import "SerchViewController.h"
#import "RecommendViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        ViewController *vc = [[ViewController alloc] init];
        vc.view.backgroundColor = [UIColor purpleColor];
        vc.tabBarItem.title = @"新闻";
    
        InfoViewController *infoViewController = [[InfoViewController alloc]init];
        SerchViewController *serchViewController = [[SerchViewController alloc]init];
        RecommendViewController *recommendViewController = [[RecommendViewController alloc]init];
    
        UIViewController *vc4 = [[UIViewController alloc]init];
        vc4.tabBarItem.title = @"我的";
        vc4.view.backgroundColor = [UIColor grayColor];
    
        UITabBarController *tabBarController = [[UITabBarController alloc]init];
        [tabBarController setViewControllers:@[vc,infoViewController,serchViewController,recommendViewController,vc4]];
    
        UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.window setWindowScene:windowScene];
        self.window.rootViewController = navigationController;
        [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
