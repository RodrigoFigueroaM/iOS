//
//  DrawingView.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/11/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "DrawingView.h"
#import "MyBezierPath.h"

@interface DrawingView ()

@property CGPoint currentPosition;
@property  UITouch * touch;


@end

@implementation DrawingView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    //path config
    self.paths = [[NSMutableArray alloc]init];
    self.context = nil;
    return self;
   
}

- (void)drawRect:(CGRect)rect
{
    
   // CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), true);
    //_context = UIGraphicsGetCurrentContext();
    
    // Drawing code
    for ( MyBezierPath * p in self.paths)
    {
       // [p setPathColor: self.brushColor];
        [p.pathColor setStroke];
        [p setLineWidth:p.width];
        [p stroke];

    }
    
}

-(void) drawPaths
{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _touch = [touches anyObject];
    _currentPosition = [_touch locationInView:self];
    MyBezierPath * path = [MyBezierPath bezierPath];
    [path setPathColor:self.brushColor];
    [path setWidth:self.lineWidth];
    [path moveToPoint:_currentPosition];
    [path addLineToPoint:_currentPosition];
    [self.paths addObject:path];
    [self setNeedsDisplay];
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _touch = [touches anyObject];
    _currentPosition = [_touch locationInView:self];
    MyBezierPath * path = [self.paths objectAtIndex:[self.paths count] - 1];
    [path addLineToPoint:_currentPosition];
    [self setNeedsDisplay];
    
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}

@end
