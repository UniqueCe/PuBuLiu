//
//  PuBuLiuFlowLayout.m
//  pubuliu
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "PuBuLiuFlowLayout.h"

@implementation PuBuLiuFlowLayout

- (void)prepareLayout {
    
    [super prepareLayout];

    self.minimumLineSpacing = 20;
    self.minimumInteritemSpacing = 20;
    
    self.itemSize = CGSizeMake(150, 200);
    
    
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    
    
}


@end
