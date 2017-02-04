//
//  BackButton.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/14/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "BackButton.h"

@implementation BackButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                     cornerRadius:100.0f];
    //CFBridgingRelease(CGPathCreateWithEllipseInRect(rect, NULL));
    //UIBezierPath * path = CFBridgingRelease(CGPathCreateWithEllipseInRect(CGRectMake(160, 160, 220, 320), NULL));
    [[UIColor redColor] setFill];
    [path fill];
    
}

@end
