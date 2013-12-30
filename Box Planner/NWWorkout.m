//
//  NWWorkout.m
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWWorkout.h"

@implementation NWWorkout


-(id)initWithData:(NSDictionary *)data
{
    self = [ super init];
    
    if (self) {
        self.active = [data[@"Active"] boolValue];
        self.name = data[@"Name"];
        self.excercises = [data[@"ExerciseGroups"] objectAtIndex:0][@"Exercises"];
        self.preDef = [data[@"ExerciseGroups"] objectAtIndex:0][@"PreDefinition"];
        self.postDef = [data[@"ExerciseGroups"] objectAtIndex:0][@"PostDefinition"];
        self.data = data;
    }

    
    return self;
    
}

-(id)init
{
    self = [self initWithData:nil];
    return self;
}


@end
