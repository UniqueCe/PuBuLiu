//
//  PuBuLiuFlowLayout.h
//  pubuliu
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuBuLiuFlowLayout : UICollectionViewFlowLayout

//间隔
@property (nonatomic, assign) CGFloat space;

//边距
@property (nonatomic, assign) UIEdgeInsets MarginEdgeInsets;

//列数
@property (nonatomic, assign) NSInteger columnNumber;

@end
