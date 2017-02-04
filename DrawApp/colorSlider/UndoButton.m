//
//  UndoButton.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/14/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "UndoButton.h"

@implementation UndoButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // Drawing code
    CustomRoundedButton * parent = [[CustomRoundedButton alloc]init];
    [parent setButtonColor:self.buttonBackgroundColor];
    [parent setUp:rect];
    
    UIBezierPath * undoPath = [UIBezierPath bezierPath];
    /*Vertical Line*/
    [undoPath moveToPoint: CGPointMake(self.bounds.size.width/2 - self.bounds.size.width * .3, self.bounds.size.height/2)];
    [undoPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + self.bounds.size.width * .3, self.bounds.size.height * 0.5)];
    /* Top arrow */
    [undoPath moveToPoint: CGPointMake(self.bounds.size.width/2 - self.bounds.size.width * .3, self.bounds.size.height/2)];
    [undoPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + self.bounds.size.width * .1, self.bounds.size.height/2 - self.bounds.size.height * .15)];
    
    /* Bottom arrow */
    [undoPath moveToPoint: CGPointMake(self.bounds.size.width/2 - self.bounds.size.width * .3, self.bounds.size.height/2)];
    
    [undoPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + self.bounds.size.width * .1, self.bounds.size.height/2 + self.bounds.size.height * .15 )];
    
    
    [self.buttonForegroundColor setStroke];
    [undoPath setLineWidth:2.0];
    [undoPath stroke];

}


@end
