//
//  CBDashboardView.m
//  cashstrapped
//
//  Created by Matias Pan on 5/22/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "CBDashboardView.h"
#import "CBLabel.h"

#define toRadians(x) ((x) * M_PI / 180.0)

#define cirleBackgroundColor [UIColor colorWithWhite:0 alpha:.2f]
#define progressBackgroundColor [UIColor colorWithWhite:1 alpha:.2f]
#define progressInset 25
#define progressWidth 30

#define progressStartAngle -244.f
#define progressEndAngle -296.f

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
    
    CGRect progressRect = rect;
    progressRect.origin.x += progressInset;
    progressRect.origin.y += progressInset;
    progressRect.size.width -= progressInset*2;
    progressRect.size.height -= progressInset*2;
    
    [self drawProgressArcBackgroundInRect:progressRect inContext:ctx];
    [self drawProgressArcInRect:progressRect inContext:ctx];
    
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

- (void)drawProgressArcBackgroundInRect:(CGRect)frame inContext:(CGContextRef)ctx {
    
    CGPoint centerPoint = CGPointMake(frame.origin.x + frame.size.width/2, frame.origin.y + frame.size.height/2);
    UIBezierPath *outerArc = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:frame.size.width/2 startAngle:toRadians(progressStartAngle) endAngle:toRadians(progressEndAngle) clockwise:YES];
    
    CGContextAddPath(ctx, outerArc.CGPath);
    
    [progressBackgroundColor setStroke];
    CGContextSetLineWidth(ctx, progressWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextStrokePath(ctx);
}

- (void)drawProgressArcInRect:(CGRect)frame inContext:(CGContextRef)ctx {
    
    CGPoint centerPoint = CGPointMake(frame.origin.x + frame.size.width/2, frame.origin.y + frame.size.height/2);
    UIBezierPath *outerArc = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:frame.size.width/2 startAngle:toRadians(progressStartAngle) endAngle:toRadians(progressStartAngle + 95) clockwise:YES];
    
    CGContextAddPath(ctx, outerArc.CGPath);
    
    [self.tintColor setStroke];
    CGContextSetLineWidth(ctx, progressWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextStrokePath(ctx);
}

- (void)setAmountValue:(NSNumber *)number {
    NSNumber *from = @([self.amountLabel.text floatValue]);
    [self.amountLabel animateFrom:from toNumber:number];
}

@end
