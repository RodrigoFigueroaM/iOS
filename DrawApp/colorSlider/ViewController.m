//
//  ViewController.m
//  colorSlider
//
//  Created by Rodrigo monroy on 11/30/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize redSlider, redLabel,
            blueSlider,blueLabel,
            greenSlider,greenLabel,
            colorViewer, hexValueLabel;

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Pick Color";
    self.redSlider.value = 1.0;
    [self updateColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: YES];
    self.redSlider.value = 1.0;
    [self updateColor];
    [self updateLabel];
    [self updateColorViewer];
}


- (IBAction)sliderChanged:(id)sender
{
    [self updateColor];
    [self updateLabel];
    [self updateColorViewer];
}

-(void) updateLabel
{
    self.redLabel.text= [[NSString alloc] initWithFormat:@"%3d", (int) ((self.redSlider.value) * 255)];
    self.blueLabel.text= [[NSString alloc] initWithFormat:@"%3d", (int) ((self.blueSlider.value) * 255)];
    self.greenLabel.text= [[NSString alloc] initWithFormat:@"%3d", (int) ((self.greenSlider.value) * 255)];
}

-(void) updateColorViewer
{
    self.colorViewer.backgroundColor = _color;
    
    self.hexValueLabel.text = [[NSString alloc]initWithFormat:@"#%X%X%X",(int) ((self.redSlider.value) * 255),(int) ((self.blueSlider.value) * 255), (int) ((self.greenSlider.value) * 255)];
    
}

-(void)updateColor
{
    _color =[[UIColor alloc] initWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    _color =[[UIColor alloc] initWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
}

@end
