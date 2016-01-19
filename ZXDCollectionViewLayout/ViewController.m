//
//  ViewController.m
//  ZXDCollectionViewLayout
//
//  Created by 张雪东 on 16/1/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import "ViewController.h"
#import "ZXDLineLayout.h"
#import "ZXDCircleLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView * collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZXDLineLayout * flowLayout  = [[ZXDLineLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(150, 150);
    flowLayout.minimumInteritemSpacing = 10;
    
//    ZXDCircleLayout * flowLayout = [[ZXDCircleLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(50, 50);
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 200) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 15;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

@end
