//
//  NWWorkoutShowViewController.m
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWWorkoutShowViewController.h"

@interface NWWorkoutShowViewController ()

@end

@implementation NWWorkoutShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.workoutNameLabel.text = self.workout.name;
    self.preDefLabel.text = self.workout.preDef;
//    self.postDefLabel.text = [NSString stringWithFormat:@"%@", self.workout.postDef];
    [self addLabelsForexercises];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addLabelsForexercises
{
    for (NSInteger i = 0, y = 50; i < [self.workout.excercises count]; i++, y += 30) {

        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, y, 300, 25)];
        nameLabel.text = [self.workout.excercises objectAtIndex:i][@"DisplayName"];
        
        [self.scrollView addSubview:nameLabel];
        
//        UILabel *repLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, y, 100, 25)];
//        id repCount = [self.workout.excercises objectAtIndex:i][@"Reps"];
//        repLabel.text = [NSString stringWithFormat:@"Reps: %@", repCount];
//        [self.scrollView addSubview:repLabel];
    }
}

@end
