//
//  CoursesViewController.h
//  homework3
//
//  Created by Rodrigo monroy on 11/22/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "homework3+CoreDataModel.h"

@interface CoursesViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController<Course *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property Course * course;


- (IBAction)unwindToCourseToList:(UIStoryboardSegue *)segue;




@end

