//
//  AddCourseViewController.m
//  assignment_2
//
//  Created by Rodrigo monroy on 10/23/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "AddCourseViewController.h"

@implementation AddCourseViewController
@synthesize courseNameTF,
            hwWeightTF,
            midtermWeightTF,
            finalWeightTF;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //set attributes
    self.name = self.courseNameTF.text;
    self.hw = [self.hwWeightTF.text intValue];
    self.midterm = [self.midtermWeightTF.text intValue];
    self.finalExam = [self.finalWeightTF.text intValue];
    
    
}
@end
