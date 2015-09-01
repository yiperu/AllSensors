//
//  ViewController.m
//  002Audio_ios_ObjC
//
//  Created by Henry AT on 9/1/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize musicPlayer;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)pushedPick:(id)sender {
  
  MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAnyAudio];
  mediaPicker.delegate = self;
  mediaPicker.allowsPickingMultipleItems = YES;
  [self presentViewController:mediaPicker animated:YES completion:nil];
  
}

- (IBAction)pushedPlay:(id)sender {
  [musicPlayer play];
}

- (IBAction)pushedPause:(id)sender {
  [musicPlayer pause];
}

- (IBAction)pushedStop:(id)sender {
  [musicPlayer stop];
}


#pragma mark -
#pragma mark - Implementation method of Delegates

-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {

  [self dismissViewControllerAnimated:YES completion:nil];
  musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
  [musicPlayer setQueueWithItemCollection:mediaItemCollection];
  
}




- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
