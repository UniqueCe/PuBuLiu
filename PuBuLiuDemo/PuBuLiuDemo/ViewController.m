//
//  ViewController.m
//  PuBuLiuDemo
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "PuBuLiuFlowLayout.h"
#import "CollectionViewCell.h"
#import "ToController.h"


#define LPCRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define LPCRandColor LPCRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PuBuLiuFlowLayout *PBLLayout = [[PuBuLiuFlowLayout alloc] init];
    
    PBLLayout.space = 20;
    PBLLayout.MarginEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
    PBLLayout.columnNumber = 2;

    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:PBLLayout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:collectionView];
}

#pragma mark-->UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = LPCRandColor;
    
    return cell;
    
}

#pragma mark-->UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ToController *toVC = [[ToController alloc] init];
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    toVC.color = cell.backgroundColor;
    
    [self.navigationController pushViewController:toVC animated:YES];
    
}




@end
