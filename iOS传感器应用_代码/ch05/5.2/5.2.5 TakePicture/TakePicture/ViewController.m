//
//  ViewController.m
//  TakePicture
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)takeImage:(id)sender {    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.allowsEditing =  YES;        
        
        _imagePicker.cameraOverlayView = [self customOverlayView];        
        _imagePicker.showsCameraControls = NO;
        
        CGFloat camScaleup = 1.8;
        _imagePicker.cameraViewTransform = CGAffineTransformScale(_imagePicker.cameraViewTransform, camScaleup, camScaleup);
        
        
        [self presentViewController:_imagePicker animated:YES completion:nil];
    } else {
        
        NSLog(@"照相机不可用。");
    }
}

-(UIView *)customOverlayView
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    UIButton *shootPictureButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 500, 120, 44)];
    shootPictureButton.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5];
    [shootPictureButton setTitle:@"拍摄" forState:UIControlStateNormal];
    [shootPictureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [shootPictureButton addTarget:_imagePicker action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:shootPictureButton];
    
    return view;
}


- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController *) picker
    didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *editedImage = (UIImage *) [info objectForKey:
                                           UIImagePickerControllerEditedImage];
    
    self.imageView.image = editedImage;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    UIImageWriteToSavedPhotosAlbum(editedImage, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   NULL);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
    UIAlertView *alert;
    
    if (error) {
        alert = [[UIAlertView alloc] initWithTitle:@"错误"
                                           message:@"保存图片失败。"
                                          delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"成功"
                                           message:@"保存图片成功。"
                                          delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    }
    [alert show];
   [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSLog(@"图像选择器将要显示。");
}


- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSLog(@"图像选择器显示结束。");
}

@end
