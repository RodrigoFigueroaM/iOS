//
//  StudentClassesViewController.m
//  homework3
//
//  Created by Rodrigo monroy on 11/24/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//

#import "StudentClassesViewController.h"
#import "SelectCourse.h"
#import "StudentAddScores.h"
#import "AppDelegate.h"

@interface StudentClassesViewController ()

@end

@implementation StudentClassesViewController




-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = self.student.firstName;
    
}
- (NSArray * ) studentCourses
{
    if(_studentCourses == nil)
    {
        _studentCourses = self.student.courseEnrollment.allObjects;
    }
    return _studentCourses;
}
-(void) _saveContext
{
    AppDelegate * appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext * managedObjectContext = appDelegate.persistentContainer.viewContext;
    
    NSError *error = nil;
    
    if ([managedObjectContext hasChanges]&& ![managedObjectContext save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
}

- (IBAction)unwindToStudentListOfCourses:(UIStoryboardSegue *)segue
{
    if([segue.identifier isEqualToString:@"CourseToStudentTable"])
    {
        if(self.course == nil)
        {
            AppDelegate * appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
            NSManagedObjectContext * managedObjectContext = appDelegate.persistentContainer.viewContext;
            
            CourseEnrollment * course1 =[NSEntityDescription insertNewObjectForEntityForName:@"CourseEnrollment" inManagedObjectContext:managedObjectContext];

            SelectCourse * source = [segue sourceViewController];
            
            course1.course= source.course;
            course1.student = self.student;
            
            [self _saveContext];
            /*force refresh on array to make live update effect*/
            self.studentCourses=nil;
            [self.tableView reloadData];
        }
        
    }
    if([segue.identifier isEqualToString:@"StudentGrade"])
    {
        [self _saveContext];
         /*force refresh on array to make live update effect*/
        self.studentCourses=nil;
        [self.tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"AddScores"])
    {
        UINavigationController *navController = [segue destinationViewController];
        StudentAddScores * source = (StudentAddScores *) navController.topViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CourseEnrollment * object = self.studentCourses[indexPath.row];
        
        [source setGrades:object];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.studentCourses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentClasses" forIndexPath:indexPath];
    
    CourseEnrollment * courseForRow = self.studentCourses[indexPath.row];
    
    cell.textLabel.text= courseForRow.course.name;
    cell.detailTextLabel.text= [NSString stringWithFormat:@"%d%%",  [self score: courseForRow]];
    return cell;
}

- (int) score: (CourseEnrollment *) course
{
    return (course.avgHwScore * course.course.avgHwWeight + course.midTermScore * course.course.midTermWeight + course.finalScore * course.course.finalWeight)/100;
}

                                                                            

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        AppDelegate * appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext * managedObjectContext = appDelegate.persistentContainer.viewContext;
        
        CourseEnrollment * courseforRow =self.studentCourses[indexPath.row];
        [managedObjectContext deleteObject:courseforRow];
        [self _saveContext];
        self.studentCourses = nil;
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
