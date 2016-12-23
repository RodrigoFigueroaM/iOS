//
//  StudentAddScores.m
//  ass2_2
//
//  Created by Rodrigo monroy on 11/1/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "StudentAddScores.h"
#import "AppDelegate.h"


@implementation StudentAddScores
@synthesize hwScoreTextField,
            midtermScoreTextField,
            finalTextField;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear : animated];
    self.title =self.grades.course.name;
    }


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    self.grades.avgHwScore = [self.hwScoreTextField.text intValue];
    self.grades.midTermScore = [self.midtermScoreTextField.text intValue];
    self.grades.finalScore = [self.finalTextField.text intValue];
    
}


@end
