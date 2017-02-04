//
//  PlusButton.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/14/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "PlusButton.h"

@implementation PlusButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CustomRoundedButton * parent = [[CustomRoundedButton alloc]init];
    [parent setButtonColor:self.buttonBackgroundColor];
    [parent setUp:rect];
    
    
    /* Draw plus sign*/
    UIBezierPath * plusPath =[UIBezierPath bezierPath];
     /*Vertical line*/
    [plusPath moveToPoint: CGPointMake(self.bounds.size.width/2 - self.bounds.size.width * .3, self.bounds.size.height / 2)];
    [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + self.bounds.size.width * .3, self.bounds.size.height * 0.5)];
    /*Horizontal line*/
    [plusPath moveToPoint: CGPointMake(self.bounds.size.width/2 , self.bounds.size.height - self.bounds.size.height * 0.8)];
    [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height - self.bounds.size.height * 0.2)];
    
    [self.buttonForegroundColor setStroke];
    [plusPath setLineWidth:2.0];
    [plusPath stroke];
    
}

@end
