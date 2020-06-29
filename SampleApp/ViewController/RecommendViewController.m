//
//  RecommendViewController.m
//  SampleApp
//
//  Created by Limin on 2020/6/28.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *topImageView;


@end

@implementation RecommendViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    NSLog(@"screenSize %@",NSStringFromCGRect([UIScreen mainScreen].bounds));
    
//    NSLog(@"scrollViewDidLoad contentOffset== %@, contentSize == %@,contentInset == %@",NSStringFromCGPoint(self.scrollView.contentOffset),NSStringFromCGSize(self.scrollView.contentSize),NSStringFromUIEdgeInsets(self.scrollView.contentInset));//这句代码为什么不执行，而且如果不写这句，就不会执行下面这个代理
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


#pragma UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //方法一：
//    CGPoint point = scrollView.contentOffset;//这一段是实现scrollView头部image下拉放大效果的实现的
//    if (point.y < -300) {
//        CGRect rect = self.topImageView.frame;
//        rect.origin.y = point.y;
//        rect.size.height = -point.y;
//        self.topImageView.frame = rect;
//    }
    //方法二：
//    CGPoint point = scrollView.contentOffset;
//    if (point.y < -20) {
//        CGRect rect = self.topImageView.frame;
//        rect.origin.y = point.y + 20;//向下移动的距离的相反数
//        rect.size.height = -point.y - 20 + 300;
//        self.topImageView.frame = rect;
//    }

    
    NSLog(@"scrollViewDidScroll contentOffset== %@, contentSize == %@,contentInset == %@",NSStringFromCGPoint(scrollView.contentOffset),NSStringFromCGSize(scrollView.contentSize),NSStringFromUIEdgeInsets(scrollView.contentInset));//向左滑动，contentOffset.x一直增加，是正的。contentOffset.y起始点是-64；
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDragging");//在手指准备拖拽的时候调用一次
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSLog(@"scrollViewDidEndDragging");//在手指停止拖拽的时候调用一次
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDecelerating");//在view开始减速的时候调用一次，在会有减速的滑动才会调用
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidEndDecelerating");//在view停止减速时候调用一次
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewShouldScrollToTop");
    return YES;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScrollToTop");
}


#pragma lazy

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, _scrollView.bounds.size.width, 300)];
        imageView.image = [UIImage imageNamed:@"shot"];
        self.topImageView = imageView;
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, imageView.frame.origin.y + 300, _scrollView.bounds.size.width, 500)];
        view1.backgroundColor = [UIColor redColor];
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, view1.frame.origin.y + 500, _scrollView.bounds.size.width, 600)];
        view2.backgroundColor = [UIColor blueColor];
        [_scrollView addSubview:imageView];
        [_scrollView addSubview:view1];
        [_scrollView addSubview:view2];
        
        
//        _scrollView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0);//这个和contentSize的先后顺序竟然影响后面的展示效果了。TODO
        _scrollView.contentSize = CGSizeMake(375, 1400);//width分别设置为375,275,175依次查看效果
        
//        _scrollView.contentOffset = CGPointMake(0, 0);//即将scrollView的坐标设为图片和色块的坐标原点？这里好像是因为有导航栏，所以就放到了导航栏下面TODO
        
//        NSArray *colorArray = @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor],[UIColor yellowColor],[UIColor purpleColor]];
//        for (int i = 0; i < 5; i++) {
//            UIView *pageView = [[UIView alloc]init];
//            pageView.frame = CGRectMake(_scrollView.frame.size.width * i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
//            pageView.backgroundColor = colorArray[i];
//            [_scrollView addSubview:pageView];
//        }
        _scrollView.delegate = self;
    }
    return _scrollView;
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
