//
//  ViewControllerForDrawing.m
//  colorSlider
//
//  Created by Rodrigo monroy on 1/11/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import "ViewControllerForDrawing.h"
#import "AppDelegate.h"
#import "DrawingView.h"
#import "ViewController.h"
#import "PlusButton.h"
#import "MinusButton.h"
#import "UndoButton.h"

@interface ViewControllerForDrawing ()
@property (strong, nonatomic) IBOutlet DrawingView * drawView;
//@property (strong, nonatomic) PlusButton * increaseBrushSize;
@property PlusButton * increaseBrushSize;
@property  MinusButton * decreaseBrushSize;
@property  UndoButton * undo;
@end

@implementation ViewControllerForDrawing

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.drawView = [[DrawingView alloc] init];
    // Do any additional setup after loading the view.
    [self setTitle:@"Draw!!!!!"];
    self.drawView.brushColor = [UIColor redColor];
    
    [self setUpButtonsAndActions];
    
    
    self.drawView.lineWidth=1;
   

}
-(void) setUpButtonsAndActions
{
    CGFloat offsetY = 75.0f;
    AppDelegate * delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    //plus button
       self.increaseBrushSize = [[PlusButton alloc]initWithFrame: CGRectMake(delegate.window.frame.size.width - 55.0f, offsetY, 50.0f, 50.00f)];
    [self.increaseBrushSize setBackgroundColor :[UIColor whiteColor]];
    [self.increaseBrushSize setButtonBackgroundColor:[UIColor colorWithRed:0.0f green:0.7f blue:0.4f alpha:1.0f]];
    [self.increaseBrushSize setButtonForegroundColor:[UIColor whiteColor]];
    [self.view addSubview: self.increaseBrushSize];
    //action
    [self.increaseBrushSize addTarget:self
                          action:@selector(increaseSize)
                forControlEvents:UIControlEventTouchUpInside];
    
    //minus button
    offsetY += 75.0f;
   
    self.decreaseBrushSize = [[MinusButton alloc]initWithFrame: CGRectMake(delegate.window.frame.size.width - 55.0f, offsetY, 50.0f, 50.00f)];
    [self.decreaseBrushSize setBackgroundColor:[UIColor whiteColor]];
    [self.decreaseBrushSize setButtonBackgroundColor:[UIColor colorWithRed:0.8f green:0.0f blue:0.4f alpha:1.0f]];
    [self.decreaseBrushSize setButtonForegroundColor:[UIColor whiteColor]];
    [self.view addSubview: self.decreaseBrushSize];
    //action
    [self.decreaseBrushSize addTarget:self
                          action:@selector(decreaseSize)
                forControlEvents:UIControlEventTouchUpInside];
    
    //undo button
    offsetY += 75.0f;
    self.undo = [[UndoButton alloc]initWithFrame: CGRectMake(delegate.window.frame.size.width - 55.0f, offsetY, 50.0f, 50.00f)];
    [self.undo setBackgroundColor:[UIColor whiteColor]];
    [self.undo setButtonBackgroundColor:[UIColor colorWithRed:0.4f green:0.4f blue:0.8f alpha:1.0f]];
    [self.undo setButtonForegroundColor:[UIColor whiteColor]];
    [self.view addSubview: self.undo];
    //action
    [self.undo addTarget: self
             action: @selector(undoPath)
   forControlEvents: UIControlEventTouchUpInside];

}


- (IBAction)unwindToDrawing:(UIStoryboardSegue *)segue
{
    ViewController * vcSlider =[segue sourceViewController];
    self.drawView.brushColor = vcSlider.color;    
}

-(void) increaseSize
{
    self.drawView.lineWidth+=.3;
    [self.increaseBrushSize pressed];
    
}

-(void) decreaseSize
{
    self.drawView.lineWidth-=.3;
    [self.decreaseBrushSize pressed];
}
-(void) undoPath
{
    if ( [self.drawView.paths count] > 0)
    {
       // MyBezierPath * path = [self.paths objectAtIndex:[self.paths count]];
        [self.drawView.paths removeObjectAtIndex:[self.drawView.paths count] -1];
        [self.drawView setNeedsDisplay];
        [self.undo pressed];
    }
}


@end
