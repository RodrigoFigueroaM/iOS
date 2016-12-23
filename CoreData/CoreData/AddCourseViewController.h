//
//  AddCourseViewController.h
//  assignment_2
//
//  Created by Rodrigo monroy on 10/23/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCourseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *courseNameTF;
@property (weak, nonatomic) IBOutlet UITextField *hwWeightTF;
@property (weak, nonatomic) IBOutlet UITextField *midtermWeightTF;
@property (weak, nonatomic) IBOutlet UITextField *finalWeightTF;

@property NSString * name;
@property int hw;
@property int midterm;
@property int finalExam;


- (IBAction)addCourseBtn:(id)sender;

@end
