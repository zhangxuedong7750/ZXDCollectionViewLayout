//
//  ZXDCircleLayout.m
//  note
//
//  Created by 张雪东 on 15/11/16.
//  Copyright © 2015年 张雪东. All rights reserved.
//

#import "ZXDCircleLayout.h"

@interface ZXDCircleLayout()

@property (nonatomic,strong) NSMutableArray *attrsArray;  //布局属性

@end

@implementation ZXDCircleLayout

//懒加载
-(NSMutableArray *)attrsArray{

    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    
    return _attrsArray;
}

-(void)prepareLayout{

    [super prepareLayout];
    
    [self.attrsArray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i ++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    return self.attrsArray;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGFloat radius = 70;  //半径
    CGFloat oY = self.collectionView.frame.size.height / 2;
    CGFloat oX = self.collectionView.frame.size.width / 2;
    
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = self.itemSize;
    if (count == 1) {
        attrs.center = CGPointMake(oX, oY);
    }else{
    
        CGFloat angel = (2 * M_PI / count) * indexPath.item;
        CGFloat centerX = oX + radius * sin(angel);
        CGFloat centerY = oY + radius * cos(angel);
        attrs.center = CGPointMake(centerX, centerY);
    }
    
    return attrs;
    
}



@end
