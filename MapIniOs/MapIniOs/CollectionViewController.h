//
//  CollectionViewController.h
//  MapIniOs
//
//  Created by Dilip Patidar on 04/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CollectionViewCell.h"

#ifndef TOTAL_PLACES
#define TOTAL_PLACES 10
#endif

@protocol CollectionViewDelegate <NSObject>

@optional
-(void) didSelectItemAtIndex:(NSInteger) index;

@end

@interface CollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    @private
    CLLocationCoordinate2D places[TOTAL_PLACES];
    
}
@property (nonatomic,weak) id<CollectionViewDelegate> delegate;
-(void) scrollToAnIndex:(NSInteger)index;

@end
