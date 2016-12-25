//
//  PuBuLiuFlowLayout.m
//  pubuliu
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "PuBuLiuFlowLayout.h"

@implementation PuBuLiuFlowLayout {
    //存储每个item的高度
    NSMutableArray *itemHeightArrayM;
    //存储布局属性
    NSMutableArray *attributedArrayM;
}

- (void)prepareLayout {
    
    [super prepareLayout];
    
    itemHeightArrayM = [NSMutableArray arrayWithCapacity:self.columnNumber];
    
    attributedArrayM = [NSMutableArray arrayWithCapacity:self.columnNumber];
    
    for (int i = 0; i < _columnNumber; i ++) {
        
        itemHeightArrayM[i] = @(_MarginEdgeInsets.top);
    }
    
    //总宽度
    CGFloat totalWidth = [UIScreen mainScreen].bounds.size.width;
    
    //item的总宽度
    CGFloat itemTotalWidth = totalWidth - self.MarginEdgeInsets.left - self.MarginEdgeInsets.right - self.space *(self.columnNumber - 1);
    
    //每个item的宽度
    CGFloat itemWidth = itemTotalWidth / self.columnNumber;
    
    //获取cell的个数
    NSInteger itemNum = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0 ; i < itemNum; i++) {
        
        NSInteger currentColumn = [self minYColumn];
        
        CGFloat x = self.MarginEdgeInsets.left + currentColumn * (itemWidth + self.space);
        
        CGFloat y = [itemHeightArrayM[currentColumn] floatValue];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
#warning ---随机的高度
#pragma mark--↓----↓----↓--高度--↓----↓----↓--
        CGFloat itemHeight = arc4random_uniform(80)+200;
#pragma mark--↑----↑----↑--高度--↑----↑----↑--
        
        CGRect frame = CGRectMake(x, y, itemWidth, itemHeight);
        
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        attribute.frame = frame;
        
        [attributedArrayM addObject:attribute];
        
        CGFloat newY = y + itemHeight + self.space;
        
        itemHeightArrayM[currentColumn] = @(newY);
    }
}

- (CGSize)collectionViewContentSize {
    
    CGFloat width = CGRectGetWidth(self.collectionView.frame);
    
    NSInteger index = [self maxYColumn];
    
    CGFloat height = [itemHeightArrayM[index] floatValue];
    
    return CGSizeMake(width, height);
}

//获取Y值最小的列
- (NSInteger)minYColumn {
    
    __block CGFloat minHeight = MAXFLOAT;
    
    __block NSInteger minColumn = 0;
    
    [itemHeightArrayM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat height = [itemHeightArrayM[idx] floatValue];
        
        if (height < minHeight) {
            
            minHeight = height;
            
            minColumn = idx;
        }
    }];
    
    return minColumn;
}

- (NSInteger)maxYColumn {
    
    __block CGFloat maxHeight = 0.0;
    
    __block NSInteger maxIndex = 0;
    
    [itemHeightArrayM enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat heightInArray = [itemHeightArrayM[idx] floatValue];
        
        if (heightInArray > maxHeight ) {
            
            maxHeight = heightInArray;
            
            maxIndex = idx;
        }
    }];
    
    return maxIndex;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    /* NSMutableArray *resultArrM = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attribute in attributedArrayM) {
        if (CGRectIntersectsRect(attribute.frame, rect)) {
            [resultArrM addObject:attribute];
        }
    } */
    return attributedArrayM;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return attributedArrayM[indexPath.item];
}


@end
