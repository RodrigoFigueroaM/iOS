//
//  StudentClassesViewController.h
//  homework3
//
//  Created by Rodrigo monroy on 11/24/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "homework3+CoreDataModel.h"


@interface StudentClassesViewController : UITableViewController

@property Student * student;

@property Course * course;

@property CourseEnrollment * courseEnrollment;

@property NSArray * studentCourses;

- (IBAction)unwindToStudentListOfCourses:(UIStoryboardSegue *)segue;
- (int) score: (CourseEnrollment *) course;
@end
