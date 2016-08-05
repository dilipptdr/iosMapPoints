//
//  CollectionViewFlowLayout.m
//  MapIniOs
//
//  Created by Dilip Patidar on 05/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//

#import "CollectionViewFlowLayout.h"

@implementation CollectionViewFlowLayout

- (void)awakeFromNib
{
    offset=20;
   
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    width=screenWidth-4*offset;//240;
    height=120;
    self.itemSize = CGSizeMake(width, height);
    self.minimumInteritemSpacing = offset;
    self.minimumLineSpacing = offset;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(offset,offset,offset,offset);
    
}


#pragma mark - Pagination
- (CGFloat)pageWidth {
    return self.itemSize.width +self.minimumLineSpacing;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalOffset = proposedContentOffset.x + 2*offset;
    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in array) {
        CGFloat itemOffset = layoutAttributes.frame.origin.x;
        if (ABS(itemOffset - horizontalOffset) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemOffset - horizontalOffset;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}



- (CGFloat)flickVelocity {
    return 0.5;
}

@end
