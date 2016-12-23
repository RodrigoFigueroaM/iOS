//
//  StudentAddScores.h
//  ass2_2
//
//  Created by Rodrigo monroy on 11/1/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "homework3+CoreDataModel.h"


@interface StudentAddScores : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *hwScoreTextField;

@property (weak, nonatomic) IBOutlet UITextField *midtermScoreTextField;
@property (weak, nonatomic) IBOutlet UITextField *finalTextField;

@property CourseEnrollment * grades;

@end
