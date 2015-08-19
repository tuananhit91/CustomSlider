//
//  CustomSwitch.m
//  CustomSlider
//
//  Created by admin on 8/7/15.
//  Copyright (c) 2015 Techmaster. All rights reserved.
//

#import "CustomSwitch.h"
#import <AVFoundation/AVFoundation.h>

@implementation CustomSwitch
{
    UIButton* _buttonON;
    UIButton* _buttonOFF;
    AVAudioPlayer* player;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 148, 64)];
    _buttonOFF = [[UIButton alloc] initWithFrame:CGRectMake(74, 0, 74, 64)];
    _buttonON = [[UIButton alloc] initWithFrame:CGRectMake(3, 0, 74, 64)];
    
    [_buttonOFF addTarget:self action:@selector(pressOFF) forControlEvents:UIControlEventTouchUpInside];
    [_buttonON addTarget:self action:@selector(pressON) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_buttonOFF];
    [self addSubview:_buttonON];
    self.value = false;
    return self;
}

- (void) pressOFF{
    self.value = false;
}

- (void) pressON{
    self.value = true;
}
//getter function of property value
-(BOOL) getValue{
    return _value; //_value instant variable tu dong anh xa vao property value
}

- (void) playSound:(NSURL*) url{
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player.numberOfLoops = -1;
    [player play];
}
//setter function
-(void) setValue:(BOOL)value{
    _value = value;
    if (_value) {
        [_buttonOFF setImage:[UIImage imageNamed:@"OffBlack.png"] forState:UIControlStateNormal];
        [_buttonON setImage:[UIImage imageNamed:@"OnWhite.png"] forState:UIControlStateNormal];
    }else{
        [_buttonOFF setImage:[UIImage imageNamed:@"OffWhite.png"] forState:UIControlStateNormal];
        [_buttonON setImage:[UIImage imageNamed:@"OnBlack.png"] forState:UIControlStateNormal];
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
@end
