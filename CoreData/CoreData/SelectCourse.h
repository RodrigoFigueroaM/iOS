//
//  SelectCourse.h
//  ass2_2
//
//  Created by Rodrigo monroy on 11/4/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "homework3+CoreDataModel.h"

@interface SelectCourse : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property Course * course;
@property Student * student;
@property NSArray * listOfCourses;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@end
