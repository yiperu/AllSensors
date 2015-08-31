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
  
  
  // First type: Here show actionsheetstyle for choise type
  UIActionSheet * popupQuery = [[UIActionSheet alloc]
                                initWithTitle:nil
                                delegate:self
                                cancelButtonTitle:@"Cancel"
                                destructiveButtonTitle:nil
                                otherButtonTitles:@"Foto",@"Video", nil];
  
  
  popupQuery.actionSheetStyle = UIActionSheetStyleBlackOpaque;
  [popupQuery showInView:self.view];
  
  
  
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





@end
