//
//  ViewController.h
//  MapIniOs
//
//  Created by Dilip Patidar on 04/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CollectionViewController.h"


#define TOTAL_PLACES 10
#define METERS_PER_MILE 1609.344

@interface ViewController : UIViewController<MKMapViewDelegate,CollectionViewDelegate>

{
    CLLocationCoordinate2D places[TOTAL_PLACES];

}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;



@end

