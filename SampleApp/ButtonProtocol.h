//
//  ButtonProtocol.h
//  SampleApp
//
//  Created by Limin on 2020/6/26.
//  Copyright © 2020 Limin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonProtocol <NSObject>

@required

- (void)pressButtonAction1;


@optional

- (void)pressButtonInViewController:(NSString *)viewController;

@end


NS_ASSUME_NONNULL_END
