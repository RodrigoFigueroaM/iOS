//
//  CustomRoundedButton.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/14/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "CustomRoundedButton.h"

@implementation CustomRoundedButton



- (void)drawRect:(CGRect)rect
{
    // Drawing code
    self.buttonColor = [UIColor redColor];
    [self setUp: rect];
    
    
}

-(void)setUp:(CGRect)rect
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                     cornerRadius:100.0f];
    [self.buttonColor setFill];
    [path fill];
    [self setNeedsDisplay];
}

-(void) pressed
{
    [self pulse];
}

-(void) decrese
{
    self.transform=CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
}

-(void) backToNormal
{
   self.transform=CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
}

-(void) pulse
{
    [UIView animateWithDuration:0.25 animations:^{ [self decrese];}
                     completion:^(BOOL finished){ [UIView animateWithDuration:0.25
                                                                   animations:^{[self backToNormal];}];
                     }];
}

@end
