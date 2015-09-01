//
//  ViewController.h
//  002Audio_ios_ObjC
//
//  Created by Henry AT on 9/1/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController <MPMediaPickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *pickButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
// IBAction:



- (IBAction)pushedPick:(id)sender;
- (IBAction)pushedPlay:(id)sender;
- (IBAction)pushedPause:(id)sender;
- (IBAction)pushedStop:(id)sender;

@property (nonatomic, strong) MPMusicPlayerController *musicPlayer;




@end

