//
//  ViewController.h
//  colorSlider
//
//  Created by Rodrigo monroy on 11/30/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;


@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;


@property (weak, nonatomic) IBOutlet UIView *colorViewer;
@property (weak, nonatomic) IBOutlet UILabel *hecValueLabel;


@property (nonatomic) UIColor * color;
- (IBAction)sliderChanged:(id)sender;

@end

