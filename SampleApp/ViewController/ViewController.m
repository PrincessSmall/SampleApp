//
//  ViewController.m
//  SampleApp
//
//  Created by Limin on 2020/6/24.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

//对这个重载不太懂
@interface TextView : UIView

@end

@implementation TextView

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
}


@end

@interface ViewController ()<PressButtonDelegate>

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

//日常工作当中所有与view相关的初始化工作都应该放在viewDidLoad当中
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"hello world";
//        NSLog(@"label before %f,%f,%f,%f",label.frame.origin.x,label.frame.origin.y,label.frame.size.width,label.frame.size.height);
//        [label sizeToFit] ;
//        NSLog(@"label center %f,%f,%f,%f",label.frame.origin.x,label.frame.origin.y,label.frame.size.width,label.frame.size.height);
//        label.center = CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
//        NSLog(@"label after %f,%f,%f,%f",label.frame.origin.x,label.frame.origin.y,label.frame.size.width,label.frame.size.height);
////       label.text = @"hello world";//将这句话放在这里就不显示hello world了，
//        label;//TODO 很少这样子添加label，不清楚这样子写有什么好处？
//        /*
//         打印结果，sizeToFit会根据文字自适应给label
//         2020-06-24 10:48:12.951590+0800 SampleApp[9156:6024540] label before 0.000000,0.000000,0.000000,0.000000
//         2020-06-24 10:48:12.988665+0800 SampleApp[9156:6024540] label center 0.000000,0.000000,83.000000,20.500000
//         2020-06-24 10:48:12.988846+0800 SampleApp[9156:6024540] label after 146.000000,323.250000,83.000000,20.500000
//         */
//    })];
    
    TextView *view1 = [[TextView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    view1.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view1];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushAction)];
    [view1 addGestureRecognizer:gesture];
    
//    UIView *view2 = [[UIView alloc] init];
//    view2.backgroundColor = [UIColor greenColor];
//    view2.frame = CGRectMake(150, 150, 100, 100);
//    [self.view addSubview:view2];
}

- (void)pushAction {
    BViewController *vc = [[BViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.navigationItem.title = @"内容";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:nil];

    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma PressButtonDelegate
- (void)pressButtonAction1 {
    NSLog(@"pressButtonAction1");
}

- (void)pressButtonInViewController:(NSString *)viewController {
    NSLog(@"pressButtonInViewController %@",viewController);
}



@end
