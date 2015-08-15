//
//  CustomSwitch.m
//  CustomSlider
//
//  Created by admin on 8/7/15.
//  Copyright (c) 2015 Techmaster. All rights reserved.
//

#import "CustomSwitch.h"

@implementation CustomSwitch
{
    UIButton* _buttonON;
    UIButton* _buttonOFF;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 216, 80)];
    _buttonOFF = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 108, 80)];
    _buttonON = [[UIButton alloc] initWithFrame:CGRectMake(108, 0, 108, 80)];
    
    [_buttonOFF addTarget:self action:@selector(pressOFF) forControlEvents:UIControlEventTouchUpInside];
    [_buttonON addTarget:self action:@selector(pressON) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_buttonOFF];
    [self addSubview:_buttonON];
    return self;
}

- (void) pressOFF{
    self.value = false;
}

- (void) pressON{
    
}
@end
