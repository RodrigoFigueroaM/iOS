//
//  SelectCourse.m
//  ass2_2
//
//  Created by Rodrigo monroy on 11/4/16.
//  Copyright © 2016 RodrigoFigueroa. All rights reserved.
//


#import "SelectCourse.h"
#import "AppDelegate.h"
#import "CoursesViewController.h"

@implementation SelectCourse

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    AppDelegate * appDelegate =(AppDelegate*) [[UIApplication sharedApplication] delegate];
    _managedObjectContext = appDelegate.persistentContainer.viewContext;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Course"];
    
    NSError *error = nil;
    NSArray *results = [_managedObjectContext executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Course objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    self.listOfCourses = results;
}


-(void) _saveContext
{
    NSError *error = nil;
    if ([_managedObjectContext hasChanges]&& ![_managedObjectContext save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.course=[_listOfCourses objectAtIndex:[self.picker selectedRowInComponent:0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
     return [self.listOfCourses count];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.listOfCourses[row] name];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
}




@end
