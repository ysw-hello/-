//
//  ViewController.m
//  WhereAmI
//
//  Created by 关东升 on 12-9-24.
//  本书网站：http://www.iosbook1.com
//  智捷iOS课堂：http://www.51work6.com
//  智捷iOS课堂在线课堂：http://v.51work6.com
//  智捷iOS课堂新浪微博：http://weibo.com/u/3215753973
//  作者微博：http://weibo.com/516inc
//  官方csdn博客：http://blog.csdn.net/tonny_guan
//  QQ：1575716557 邮箱：jylong06@163.com
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //定位服务管理对象初始化
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.distanceFilter = 1000.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //开始定位
    [_locationManager startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    //停止定位
    [_locationManager stopUpdatingLocation];
}

#pragma mark Core Location委托方法用于实现位置的更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _currLocation = [locations lastObject];
	_txtLat.text = [NSString stringWithFormat:@"%3.5f",
                    _currLocation.coordinate.latitude];
	_txtLng.text = [NSString stringWithFormat:@"%3.5f",
                    _currLocation.coordinate.longitude];
    _txtAlt.text = [NSString stringWithFormat:@"%3.5f",
                    _currLocation.altitude];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error);
}


- (IBAction)reverseGeocode:(id)sender {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:_currLocation
                   completionHandler:^(NSArray *placemarks, NSError *error) {
                       
                       if ([placemarks count] > 0) {
                           
                           CLPlacemark *placemark = placemarks[0];
                           
                           NSDictionary *addressDictionary =  placemark.addressDictionary;
                           
                           NSString *address = [addressDictionary
                                                objectForKey:(NSString *)kABPersonAddressStreetKey];
                           address = address == nil ? @"": address;
                           
                           NSString *state = [addressDictionary
                                             objectForKey:(NSString *)kABPersonAddressStateKey];
                           state = state == nil ? @"": state;
                           
                           NSString *city = [addressDictionary
                                             objectForKey:(NSString *)kABPersonAddressCityKey];
                           city = city == nil ? @"": city;
                           
                           _txtView.text = [NSString stringWithFormat:@"%@ \n%@ \n%@",state, address,city];
                       }
                       
                   }];    
}


@end
