//
//  StudentViewController.m
//  assignment_2
//
//  Created by Rodrigo monroy on 10/23/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "AddStudentViewController.h"



@implementation AddStudentViewController

@synthesize name,
            lastName,
            CWID;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    self.sFirstName = self.name.text;
    self.sLastName = self.lastName.text;
    self.sCwid = self.CWID.text;

}



@end
