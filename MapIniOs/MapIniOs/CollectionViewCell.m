//
//  CollectionViewCell.m
//  MapIniOs
//
//  Created by Dilip Patidar on 05/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

@synthesize latLable,longLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView* image=[[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 60, 44)];
        [image setImage:[UIImage imageNamed:@"house"]];
        
        self.latLable=[[UILabel alloc]initWithFrame:CGRectMake(100, 30, 180, 24)];
        
        self.longLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 74, 180, 24)];
        
        [self.contentView addSubview:image];
        [self.contentView addSubview:latLable];
        [self.contentView addSubview:longLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

@end
