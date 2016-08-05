//
//  CollectionViewController.m
//  MapIniOs
//
//  Created by Dilip Patidar on 04/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    

    float cords[20]={12.97514926,77.60064625,12.97449707,77.60708017,12.98177251,77.58797611,12.9653112,77.60033687,12.98397826,77.58124646,12.9622057,77.5916768,12.96727593,77.61206671,12.97555741,77.60250862,12.96238266,77.60581674,12.98364548,77.60320179};
    
    CLLocationCoordinate2D location;
    
    for(int i=0;i<2*TOTAL_PLACES;){
        
        location.latitude = cords[i];
        location.longitude= cords[i+1];
        places[i/2]=location;
        i+=2;
        
    }

    
}


-(void) scrollToAnIndex:(NSInteger)index{

    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    
    NSInteger i=currentItem.row;
    
    NSInteger diff=index-i;

    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + diff inSection:currentItem.section];
    [self.collectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell

    CLLocationCoordinate2D point=self->places[indexPath.row];

    [cell.latLable setText:[NSString stringWithFormat:@"%@ : %.3f",@"Lat",point.latitude]];

    [cell.longLabel setText:[NSString stringWithFormat:@"%@ : %.3f",@"Long",point.longitude]];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  0.5* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self.delegate didSelectItemAtIndex:indexPath.row];
       
    });
    
    
    return cell;
}

//- (void)collectionView:(UICollectionView *)collectionView
//didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    [self.delegate didSelectItemAtIndex:indexPath.row];
//
//}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

// Uncomment this method to specify if the specified item should be selected
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
