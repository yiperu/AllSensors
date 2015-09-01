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
  [musicPlayer beginGeneratingPlaybackNotifications];
  
  NSNotificationCenter *notificationCenter =
  [NSNotificationCenter defaultCenter];
  
  [notificationCenter addObserver:self selector:@selector(handleNowPlayingItemChanged:) name:@"MPMusicPlayerControllerNowPlayingItemDidChangeNotification" object:musicPlayer];
  
  
  [notificationCenter addObserver:self selector:@selector(handlePlaybackStateChanged:) name:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" object:musicPlayer];
  
}


- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker {
  [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - MPMusicPlayerController Notifications

- (void)handleNowPlayingItemChanged:(id)notification {
  MPMediaItem *currentItem = [musicPlayer nowPlayingItem];
  NSString *title = [currentItem valueForProperty:MPMediaItemPropertyTitle];
  NSLog(@"Song title = %@", title);
}
- (void)handlePlaybackStateChanged:(id)notification {
  MPMusicPlaybackState playbackState = [musicPlayer playbackState];
  if (playbackState == MPMusicPlaybackStatePaused) {
    NSLog(@"Paused");
    
  } else if (playbackState == MPMusicPlaybackStatePlaying) {
    NSLog(@"Playing");
    
  } else if (playbackState == MPMusicPlaybackStateStopped) {
    NSLog(@"Stopped");
    
  }
}
































@end
