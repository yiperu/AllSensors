//
//  ViewController.m
//  003Recorder_ios_ObjC
//
//  Created by Henry AT on 9/1/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

#import <CoreAudio/CoreAudioTypes.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize recording;
@synthesize recorder;
@synthesize tmpFile;
@synthesize startStopButton;
@synthesize playButton;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  recording = NO;
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)startStopButtonPressed:(id)sender {
  AVAudioSession * audioSession = [AVAudioSession sharedInstance];
  
  if (!recording) {
    
    recording = YES;
    
    [audioSession setCategory:AVAudioSessionCategoryRecord error:nil];
    [audioSession setActive:YES error:nil];
    
    
    [startStopButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
    
    NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    tmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent: [NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"caf"]]];
    
    recorder = [[AVAudioRecorder alloc] initWithURL:tmpFile settings:recordSetting error:nil];
    [recorder setDelegate:self];
    [recorder prepareToRecord];
    [recorder record];
    
  } else {
    
    recording = NO;
    [audioSession setActive:NO error:nil];
    [startStopButton setTitle:@"Start Recording" forState:UIControlStateNormal];
    [recorder stop];
    
  }
  
  
}



- (IBAction)playButtonPressed:(id)sender {
  
  
}
@end
