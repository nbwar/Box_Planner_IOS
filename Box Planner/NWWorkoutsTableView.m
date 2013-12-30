//
//  NWWorkoutsTableView.m
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWWorkoutsTableView.h"


@interface NWWorkoutsTableView ()

@end

@implementation NWWorkoutsTableView

-(NSMutableArray *)workouts
{
    if (!_workouts) _workouts = [[NSMutableArray alloc] init];
    return _workouts;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.hidesBackButton = YES;
    [self loadWorkoutsFromServer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.workouts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NWWorkout *workout = self.workouts[indexPath.row];
    cell.textLabel.text = workout.name;
    

    
    return cell;
}


// Tap on Cell

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetailWorkoutViewController" sender:indexPath];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[NWWorkoutShowViewController class]]) {
        NWWorkoutShowViewController *showVC = segue.destinationViewController;

        NSIndexPath *path = sender;
        NWWorkout *workout = self.workouts[path.row];
        showVC.delegate = self;
        showVC.workout = workout;
    }
}


-(void)loadWorkoutsFromServer
{
    NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://kboxtest.azurewebsites.net/api/Wod?date=null&page=0&exerciseOrExerciseGroupId=null&exerciseOrExerciseGroupType=0&myOrAllType=1&dummy="]];
    
    loginRequest.HTTPMethod = @"GET";
    
    
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    
    NSData *response1 = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:&urlResponse error:&requestError];
    
    NSError *error;
    id response = [NSJSONSerialization JSONObjectWithData:response1 options:0 error:&error];
    
    

    
    for (NSDictionary *dictionary in response) {
        NWWorkout *workoutObject = [self workoutObjectForDictionary:dictionary];
        [self.workouts addObject:workoutObject];
    }
    
}




#pragma mark - Helpers

-(NWWorkout *)workoutObjectForDictionary:(NSDictionary *)dictionary
{
    NWWorkout *workoutObject = [[NWWorkout alloc] initWithData:dictionary];
    return workoutObject;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
