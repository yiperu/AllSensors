//
//  ViewController.h
//  003Recorder_ios_ObjC
//
//  Created by Henry AT on 9/1/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;


- (IBAction)startStopButtonPressed:(id)sender;
- (IBAction)playButtonPressed:(id)sender;

@property (nonatomic, strong) NSURL *tmpFile;
@property (nonatomic, strong) AVAudioRecorder *recorder;
@property BOOL recording;







@end

