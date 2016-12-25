//
//  CollectionViewCell.m
//  pubuliu
//
//  Created by 刘培策 on 16/12/25.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "CollectionViewCell.h"

#define CellWidth self.bounds.size.width
#define CellHeight self.bounds.size.height


@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UIImageView *imagev = [[UIImageView alloc] init];
    
    imagev.frame = CGRectMake(CellWidth *0.2, CellHeight *0.2, CellWidth *0.6, CellHeight *0.6);
    
    imagev.image = [UIImage imageNamed:@"003"];
    
    [self addSubview:imagev];
    
}


@end
