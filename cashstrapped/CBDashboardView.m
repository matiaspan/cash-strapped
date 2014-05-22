//
//  CBDashboardView.m
//  cashstrapped
//
//  Created by Matias Pan on 5/22/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBDashboardView.h"

#define cirleBackgroundColor [UIColor colorWithWhite:0 alpha:.2f]

@implementation CBDashboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    [self drawBackgroundCircleInRect:rect inContext:ctx];
    
    CGContextRestoreGState(ctx);
}

- (void)drawBackgroundCircleInRect:(CGRect)frame inContext:(CGContextRef)ctx {
    CGRect circleRect;
    circleRect.origin.x = 0;
    circleRect.origin.y = frame.size.height - frame.size.width;
    circleRect.size.width = frame.size.width;
    circleRect.size.height = frame.size.width;
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    CGContextAddPath(ctx, clipPath.CGPath);
    CGContextClip(ctx);
    
    [cirleBackgroundColor setFill];
    CGContextFillEllipseInRect(ctx, circleRect);
}

@end
