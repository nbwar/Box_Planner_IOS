//
//  NWWorkout.h
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NWWorkout : NSObject
@property (nonatomic) BOOL active;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *excercises;
@property (strong, nonatomic) NSString *preDef;
@property (strong, nonatomic) NSString *postDef;
@property (strong, nonatomic) NSDictionary *data;

-(id)initWithData:(NSDictionary *)data;
@end
