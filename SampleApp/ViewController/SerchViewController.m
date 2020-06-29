//
//  SerchViewController.m
//  SampleApp
//
//  Created by Limin on 2020/6/28.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "SerchViewController.h"

@interface SerchViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SerchViewController

- (instancetype)init {
    if (self = [super init]) {
     self.tabBarItem.title = @"搜索";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
}


#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reusableIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


#pragma UICollectionViewDelegateFlowLayout

/// 根据indexPath返回item的size，
/// @param collectionView <#collectionView description#>
/// @param collectionViewLayout <#collectionViewLayout description#>
/// @param indexPath <#indexPath description#>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item %3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 80);
    }else {
        return CGSizeMake((self.view.frame.size.width - 10)/2, 100);
    }
}


#pragma lazy

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];//不设置layout属性的时候默认展示50*50的cell
//        layout.itemSize = CGSizeMake((self.view.frame.size.width-10)
//                                     /2, 100);
        layout.minimumInteritemSpacing = 10.f;
        layout.minimumLineSpacing = 10.f;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//collectionView的移动方向，可以确定cell是按照行排列还是纵排列
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reusableIdentifier"];
        
    }
    return _collectionView;
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
