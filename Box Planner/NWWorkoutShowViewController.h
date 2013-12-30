//
//  NWWorkoutShowViewController.h
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWWorkout.h"

@protocol NWWorkoutShowViewControllerDelegate <NSObject>


@end

@interface NWWorkoutShowViewController : UIViewController

@property (weak, nonatomic) id <NWWorkoutShowViewControllerDelegate> delegate;
@property (strong, nonatomic) NWWorkout *workout;

@property (strong, nonatomic) IBOutlet UILabel *workoutNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *preDefLabel;
@property (strong, nonatomic) IBOutlet UILabel *postDefLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
