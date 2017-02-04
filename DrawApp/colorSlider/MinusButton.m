//
//  MinusButton.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/14/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "MinusButton.h"

@implementation MinusButton

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CustomRoundedButton * parent = [[CustomRoundedButton alloc]init];
    [parent setButtonColor:self.buttonBackgroundColor];
    [parent setUp:rect];
    
    /* Draw plus sign*/
    UIBezierPath * minusPath =[UIBezierPath bezierPath];
    /*Vertical line*/
    [minusPath moveToPoint: CGPointMake(self.bounds.size.width/2 - self.bounds.size.width * .3, self.bounds.size.height / 2)];
    [minusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + self.bounds.size.width * .3, self.bounds.size.height * 0.5)];
        
    [self.buttonForegroundColor setStroke];
    [minusPath setLineWidth:2.0];
    [minusPath stroke];
    
}

@end
