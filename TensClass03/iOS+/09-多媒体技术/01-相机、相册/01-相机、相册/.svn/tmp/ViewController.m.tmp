//
//  ViewController.m
//  01-相机、相册
//
//  Created by qinglinfu on 16/3/11.
//  Copyright © 2016年 十安科技. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
//#import <Photos/Photos.h>

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong)UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)openPhotos:(UIButton *)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:NULL];
}


- (IBAction)openCamera:(UIButton *)sender {
    
    
    // 使用相机前先判定设备是否可以
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //---------------------------------相机拍照设置---------------------------------
        
        // 是否可以编辑
        self.imagePicker.allowsEditing = YES;
        
        // 修改相机呈现视图的transform
        self.imagePicker.cameraViewTransform  = CGAffineTransformMakeRotation(M_PI_2);
        
        /* 设置摄像头的模式
         UIImagePickerControllerCameraDeviceRear, 后置
         UIImagePickerControllerCameraDeviceFront 前置
         */
        self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
        // 设置闪光灯，默认自动
        self.imagePicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
        
        
        //----------------------摄影设置----------------------------
        // 媒体类型
        self.imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
        // 相机模式为 video
        self.imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        // 视频的质量
        self.imagePicker.videoQuality = UIImagePickerControllerQualityType640x480;
        
        [self presentViewController:self.imagePicker animated:YES completion:NULL];
    } else {
        
        NSLog(@"相机不可用！");
    }
    
}


- (UIImagePickerController *)imagePicker
{
    if (!_imagePicker) {
        
        _imagePicker = [[UIImagePickerController alloc] init];
        
        /*
         UIImagePickerControllerSourceTypePhotoLibrary, // 照片库
         UIImagePickerControllerSourceTypeCamera, // 相机
         UIImagePickerControllerSourceTypeSavedPhotosAlbum // 相册
         
         */
         _imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
        
        _imagePicker.delegate = self;
    }
    
    return _imagePicker;
}

#pragma mark - <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@",info);
    
    /* 获取选择的图片数据
        UIImagePickerControllerMediaType  媒体类型
        UIImagePickerControllerOriginalImage 图片数据
        UIImagePickerControllerReferenceURL 媒体的链接地址
     */
    UIImage *photo = info[UIImagePickerControllerOriginalImage];
    self.photoImageView.image = photo;

    // 将图片保存到相册中
    UIImageWriteToSavedPhotosAlbum(photo, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    // 视频保存到相册中
    NSURL *mediaURL = info[UIImagePickerControllerMediaURL];
    UISaveVideoAtPathToSavedPhotosAlbum([mediaURL path], self, @selector(video:didFinishSavingWithError:contextInfo:), NULL);
    
    
    [self dismissViewControllerAnimated:self.imagePicker completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消");
    
    [self dismissViewControllerAnimated:self.imagePicker completion:NULL];
}


#pragma mark - 图片\video 保存后的回调方法
 - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        
        NSLog(@"图片保存成功！");
    }
    
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) {
        
        NSLog(@"视频保存成功：%@",videoPath);
    }
}

@end
