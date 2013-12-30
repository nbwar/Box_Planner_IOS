//
//  NWWorkoutsTableView.h
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWWorkout.h"
#import "NWWorkoutShowViewController.h"

@interface NWWorkoutsTableView : UITableViewController < NWWorkoutShowViewControllerDelegate >
@property (strong, nonatomic) NSMutableArray *workouts;
@end
