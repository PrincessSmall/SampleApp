//
//  BViewController.h
//  SampleApp
//
//  Created by Limin on 2020/6/26.
//  Copyright © 2020 Limin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PressButtonDelegate <NSObject>

@required

- (void)pressButtonAction1;


@optional

- (void)pressButtonInViewController:(NSString *)viewController;

@end

@interface BViewController : UIViewController

@property (nonatomic, weak) id <PressButtonDelegate> pressButtonDelegate;

@end

NS_ASSUME_NONNULL_END
