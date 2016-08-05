//
//  ViewController.m
//  MapIniOs
//
//  Created by Dilip Patidar on 04/08/16.
//  Copyright © 2016 Dilip Patidar. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property CollectionViewController* childVC;
@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    float cords[20]={12.97514926,77.60064625,12.97449707,77.60708017,12.98177251,77.58797611,12.9653112,77.60033687,12.98397826,77.58124646,12.9622057,77.5916768,12.96727593,77.61206671,12.97555741,77.60250862,12.96238266,77.60581674,12.98364548,77.60320179};
    
    CLLocationCoordinate2D location;
    
    for(int i=0;i<2*TOTAL_PLACES;){
        
        location.latitude = cords[i];
        location.longitude= cords[i+1];
        places[i/2]=location;
        i+=2;
        
    }

    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void) viewWillAppear:(BOOL)animated{

    CLLocationCoordinate2D location;
    location.latitude = 12.9716;
    location.longitude= 77.5946;

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location,2.5*METERS_PER_MILE, 2.5*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
    for(int i=0;i<TOTAL_PLACES;i++){
    
        @autoreleasepool {
            
            MKPointAnnotation *newAnnotation = [[MKPointAnnotation alloc] init];
            [newAnnotation setTitle:[NSString stringWithFormat:@"%@_%d",@"Bangalore",i]];
            [newAnnotation setCoordinate: places[i]];
            [self.mapView addAnnotation:newAnnotation];
        }
        
    }

}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    MKPointAnnotation *pointAnnotation=(MKPointAnnotation*)[view annotation];

    CLLocationCoordinate2D point =[pointAnnotation coordinate];
    
    int index=0;
    for (int i=0; i< TOTAL_PLACES; i++) {
        if (point.latitude==places[i].latitude && point.longitude==places[i].longitude) {
            index=i;
            break;
        }
    }
    
    NSLog(@"%d",index);
    
    if(self.childVC){
    
        [self.childVC scrollToAnIndex:index];
    
    }
    
}

-(void)didSelectItemAtIndex:(NSInteger)index{


    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(places[index],0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqual:@"mysegue"]){
    
       self.childVC=(CollectionViewController*)segue.destinationViewController;
       self.childVC.delegate=self;
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
