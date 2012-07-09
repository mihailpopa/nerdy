//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

-(void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
    NSLog(@"Device started shaking");
    [self setCircleColor:[UIColor redColor]];
    }
}
-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/2.0;
    
    
    CGContextSetLineWidth(ctx, 10);
    
    
    //CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2, YES);
    
    //CGContextStrokePath(ctx);
    
    [[self circleColor] setStroke];
    static int i;
    //Draw concentric circles
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        
       if (i++%2==0)
        CGContextSetRGBStrokeColor(ctx, 0.1, 0.1, 0.9, 1.0);
       else {
           CGContextSetRGBStrokeColor(ctx, 0.8, 0.5, 0.9, 1.0);

       }
        //add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2, YES);
        
        [[UIColor greenColor] setFill];
        //perform drawing instructions: removes path
        CGContextStrokePath(ctx);
    }
    
    NSString *text = @"You are getting sleepy";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithFont:font];
    
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;
    
    //[[UIColor blackColor] setFill];
    
    //CGSize offset = CGSizeMake(4, 3);
    
    //CGColorRef color = [[UIColor darkGrayColor]CGColor];
    
    //CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    //[text drawInRect:textRect withFont:font];
    
    
}

@end
