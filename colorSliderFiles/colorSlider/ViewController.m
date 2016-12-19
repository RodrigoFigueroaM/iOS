//
//  ViewController.m
//  colorSlider
//
//  Created by Rodrigo monroy on 11/30/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize redSlider, redLabel,
            blueSlider,blueLabel,
            greenSlider,greenLabel,
            colorViewer, hecValueLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Color Slider";
    self.redSlider.value= 1;
    self.blueSlider.value= .60;
    self.greenSlider.value= .40;
    [self updateLabel];
    [self updateColorViewer];
   
}


- (IBAction)sliderChanged:(id)sender
{
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
    self.colorViewer.backgroundColor =[[UIColor alloc] initWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
    
    self.hecValueLabel.text = [[NSString alloc]initWithFormat:@"#%X%X%X",(int) ((self.redSlider.value) * 255),(int) ((self.blueSlider.value) * 255), (int) ((self.greenSlider.value) * 255)];
    
}
@end
