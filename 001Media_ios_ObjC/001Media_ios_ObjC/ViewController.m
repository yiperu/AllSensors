//
//  ViewController.m
//  001Media_ios_ObjC
//
//  Created by Henry AT on 8/30/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize pickerController;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  pickerController = [[UIImagePickerController alloc] init];
  pickerController.allowsEditing = NO;
  pickerController.delegate = self;
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)pickImage:(id)sender {
  
  
//  // First type: Here show actionsheetstyle for choise type
//  UIActionSheet * popupQuery = [[UIActionSheet alloc]
//                                initWithTitle:nil
//                                delegate:self
//                                cancelButtonTitle:@"Cancel"
//                                destructiveButtonTitle:nil
//                                otherButtonTitles:@"Foto",@"Video", nil];
//  
//  
//  popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
//  [popupQuery showInView:self.view];
  
// Second way: Here show actionsheetstyle for choise type in another way (Horizontal)
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    NSArray* mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypeCamera];
    pickerController.mediaTypes = mediaTypes;
  } else {
    pickerController.sourceType =
    UIImagePickerControllerSourceTypeSavedPhotosAlbum;
  }
  
  [self presentViewController:pickerController animated:YES completion:nil];
  
  
  
  
}




#pragma mark -
#pragma mark - Metodos of ActionSheet

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
  } else {
    pickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
  }
  
  if (buttonIndex == 0) {
    pickerController.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];

  } else if (buttonIndex == 1) {
    pickerController.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];

  }
  
  [self presentViewController:pickerController animated:YES completion:nil];
  
  
  
  
}


// = = =  =


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  
  if( [info objectForKey:@"UIImagePickerControllerMediaType"] == (NSString *) kUTTypeMovie ) {
    
    
//    NSString *tempFilePath =
//    [[info objectForKey:UIImagePickerControllerMediaURL] path];
//    if ( UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(tempFilePath) ){
//      UISaveVideoAtPathToSavedPhotosAlbum( tempFilePath, self,
//                                          @selector(video:didFinishSavingWithError:contextInfo:), tempFilePath);
//    }
//    
//    /*
//     CGSize pickerSize = CGSizeMake(picker.view.bounds.size.width, picker.view.bounds.size.height-100);
//     UIGraphicsBeginImageContext(pickerSize);
//     [picker.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//     UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
//     UIGraphicsEndImageContext();
//     imageView.image = thumbnail;
//     */
//    
//    AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:[info objectForKey:UIImagePickerControllerMediaURL] options:nil];
//    AVAssetImageGenerator *generator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
//    generator.appliesPreferredTrackTransform=TRUE;
//    [asset release];
//    CMTime thumbTime = CMTimeMakeWithSeconds(0,30);
//    
//    AVAssetImageGeneratorCompletionHandler handler = ^(CMTime requestedTime, CGImageRef im, CMTime actualTime, AVAssetImageGeneratorResult result, NSError *error){
//      if (result != AVAssetImageGeneratorSucceeded) {
//        NSLog(@"couldn't generate thumbnail, error:%@", error);
//      }
//      imageView.image = [[UIImage imageWithCGImage:im] retain];
//      [generator release];
//    };
//    
//    CGSize maxSize = CGSizeMake(320, 180);
//    generator.maximumSize = maxSize;
//    [generator generateCGImagesAsynchronouslyForTimes:[NSArray arrayWithObject:[NSValue valueWithCMTime:thumbTime]] completionHandler:handler];
//    
    
    
  } else {

    self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
//    UIImageWriteToSavedPhotosAlbum(
//                                   image,
//                                   self,
//                                   @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:),
//                                   nil);
//    
//    imageView.image = image;
    
  }
  [self dismissViewControllerAnimated:YES completion:nil];
}







@end
