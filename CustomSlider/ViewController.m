//
//  ViewController.m
//  CustomSlider
//
//  Created by cuong minh on 7/2/15.
//  Copyright (c) 2015 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController
{
    NSTimer* volumeTimer;
    AVAudioPlayer* player;
    UILabel* label;
    UIImageView* caption;
    UIView* view1;
    UIButton* on, *off;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    caption = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"caption.png"]];
    caption.frame = CGRectMake(42, self.slider.center.y - 30, 70, 50);
    label =[[UILabel alloc] initWithFrame:CGRectMake(12, 10, 45, 25)];
    [caption addSubview: label];
    [[self.slider superview] addSubview:caption];
    //label.backgroundColor = [UIColor blueColor];
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    caption.hidden = true;
    NSString* string1 = [NSString stringWithFormat:@"%2.0f",self.slider.value];
    [label setText:string1];
    [self.slider setThumbImage:[UIImage imageNamed:@"thumb1.png"] forState:UIControlStateNormal];
    
    [self.slider setMaximumValueImage:[UIImage imageNamed:@"MuteSpeaker1.png"]];
    [self speakerChange:self.slider.value];
    
    //[self.slider setMaximumTrackImage:[UIImage imageNamed: @"maxtrack.png"] forState:UIControlStateNormal];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 1, 10);
    UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack1.png"] resizableImageWithCapInsets:inset];
    
    [self.slider setMaximumTrackImage:maxTrack
                             forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:[UIImage imageNamed: @"mintrack1.png"] forState:UIControlStateNormal];
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    [self.slider addTarget:self action:@selector(adjustLableForSlider:) forControlEvents:UIControlEventValueChanged];
    //[on addTarget:self action:@selector(onSound:) forControlEvents:UIControlEventTouchUpInside];
    [self creatCustomizeSwitch];
}

- (void) adjustLableForSlider:(id)slider{
    //float value = self.slider.value;
    //float min = self.slider.minimumValue;
    //float max = self.slider.maximumValue;
    caption.hidden = false;
    CGRect trackRect = [self.slider trackRectForBounds:self.slider.bounds];
    CGRect thumbRect = [self.slider thumbRectForBounds:self.slider.bounds
                                             trackRect:trackRect
                                                 value:self.slider.value];
    
    caption.center = CGPointMake(thumbRect.origin.x + self.slider.frame.origin.x + 10,
                                 self.slider.frame.origin.y - 26);
    NSString* string = [NSString stringWithFormat:@"%2.0f",self.slider.value];
    [label setText:string];
    [self speakerChange:self.slider.value];
}

- (void) speakerChange:(int) value{
    if (value == 0) {
        [self.slider setMaximumValueImage:[UIImage imageNamed:@"MuteSpeaker1.png"]];
    }else if(value < 3){
        [self.slider setMaximumValueImage:[UIImage imageNamed:@"Speaker1.png"]];
    }else if(value < 8){
        [self.slider setMaximumValueImage:[UIImage imageNamed:@"Speaker2.png"]];
    }else{
        [self.slider setMaximumValueImage:[UIImage imageNamed:@"MaxSpeaker.png"]];
    }
    
}

- (void) creatCustomizeSwitch{
    view1 = [[UIImageView alloc] init];
    view1.frame = CGRectMake(self.view.bounds.size.width / 4, 150, 200, 100);
    view1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:view1];
    
    on = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 74, 60)];
    [on setImage:[UIImage imageNamed:@"OnWhite.png"] forState:UIControlStateNormal];
    [view1 addSubview:on];
    
    off = [[UIButton alloc] initWithFrame:CGRectMake(94, 20, 69, 64)];
    [off setImage:[UIImage imageNamed:@"OffBlack.png"] forState:UIControlStateNormal];
    [view1 addSubview:off];
}

- (void) playSound:(NSURL*) url{
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player.numberOfLoops = -1;
    [player play];
}

- (void) onSound:(id)on{
    NSURL* soundPath = [[NSBundle mainBundle] URLForResource:@"MySong" withExtension:@"mp3"];
    [self playSound:soundPath];
    volumeTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateVolume) userInfo:nil repeats:YES];
}

- (void) updateVolume{
    [player setVolume:self.slider.value];
}
- (IBAction)onButton:(id)sender {
    NSURL* soundPath = [[NSBundle mainBundle] URLForResource:@"MySong" withExtension:@"mp3"];
    [self playSound:soundPath];
    volumeTimer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                   target:self
                                                 selector:@selector(updateVolume)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (IBAction)controlSlider:(id)sender {
    
    //NSString* string = [NSString stringWithFormat:@"%2.0f",self.slider.value];
    //[self.label setText:string];
}
/*
- (void) getThumbPosition{
    CGRect size = [UIScreen mainScreen].bounds.size;
    
}*/


@end
