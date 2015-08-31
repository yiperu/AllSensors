//
//  ViewController.h
//  001Media_ios_ObjC
//
//  Created by Henry AT on 8/30/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

//Both UIImagePickerControllerDelegate and UINavigationControllerDelegate declarations
//are necessary for the class to interact with the UIImagePickerController.


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *pickButton;
@property (nonatomic, strong) UIImagePickerController *pickerController;

- (IBAction)pickImage:(id)sender;

@end

