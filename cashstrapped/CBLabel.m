//
//  CBLabel.m
//  cashstrapped
//
//  Created by Matias Pan on 5/22/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBLabel.h"

@interface CBLabel () {
    CFTimeInterval startTime;
}

@property (strong, nonatomic) NSNumber *from;
@property (strong, nonatomic) NSNumber *to;
@property (strong, nonatomic) NSNumberFormatter *numberFormatter;

@end

@implementation CBLabel

- (void)animateFrom:(NSNumber *)from toNumber:(NSNumber *)to withNumberFormatter:(NSNumberFormatter *)numberFormatter {
    self.from = from;
    self.to = to;
    self.numberFormatter = numberFormatter;
    
    self.text = [self.from stringValue];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateNumber:)];

    startTime = CACurrentMediaTime();
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)animateNumber:(CADisplayLink *)link {
    
    static float DURATION = 1.0;
    float dt = ([link timestamp] - startTime) / DURATION;

    if (dt >= DURATION) {
        self.text = [self.numberFormatter stringFromNumber:self.to];
        [link removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        return;
    }
    
    float current = ([self.to floatValue] - [self.from floatValue]) * dt + [self.from floatValue];
    self.text = [self.numberFormatter stringFromNumber:@(current)];
}

@end
