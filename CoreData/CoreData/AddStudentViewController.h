//
//  StudentViewController.h
//  assignment_2
//
//  Created by Rodrigo monroy on 10/23/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "homework3+CoreDataModel.h"



@interface AddStudentViewController:UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *CWID;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *done;

@property NSString * sFirstName;
@property NSString * sLastName;
@property NSString * sCwid;



@end

