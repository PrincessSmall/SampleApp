//
//  BViewController.m
//  SampleApp
//
//  Created by Limin on 2020/6/26.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "BViewController.h"
#import "CViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *buttonA = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 100)];
    buttonA.backgroundColor = [UIColor redColor];
    [buttonA addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonA];
}

- (void)pushAction {
    if (self.pressButtonDelegate) {
        [self.pressButtonDelegate pressButtonAction1];
        if ([self.pressButtonDelegate respondsToSelector:@selector(pressButtonInViewController:)]) {
            NSString *viewController = NSStringFromClass([self class]);
            [self.pressButtonDelegate pressButtonInViewController:viewController];
        }
    }

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
