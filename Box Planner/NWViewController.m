//
//  NWViewController.m
//  Box Planner
//
//  Created by Nicholas Wargnier on 12/16/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWViewController.h"

@interface NWViewController ()

@end

@implementation NWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(UIButton *)sender
{
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if ([email isEqualToString:@""] || [password isEqualToString:@""]) {
        
        [self alertStatus:@"Email/Password Can't be Blank" : @"Error"];
        
    } else {
        
        NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://kboxtest.azurewebsites.net/Account/Login?"]];
        
        loginRequest.HTTPMethod = @"POST";
        
        NSString *data = [NSString stringWithFormat:@"headeremail=%@&headerpassword=%@", email, password];
        
        
        loginRequest.HTTPBody = [data dataUsingEncoding:NSUTF8StringEncoding];


        NSError *requestError;
        NSURLResponse *urlResponse = nil;
        
        
        NSData *response1 = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:&urlResponse error:&requestError];
        
        NSString *response  = [[NSString alloc] initWithData: response1 encoding:NSASCIIStringEncoding];



        
        
        if ([response isEqualToString:@"\"error\""]) {
            [self alertStatus:@"Email/Password Combination Incorrect" :@"Failed login"];
        } else {
            
            [self performSegueWithIdentifier:@"workoutsSegue" sender:self];
        }
        
    }
    
}



- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}


- (void)requestNews
{
    
    NSMutableURLRequest *newsRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://kboxtest.azurewebsites.net/api/News?date=2013-12-12T11:55:21.319Z&page=0"]];
//    NSString *data = [NSString stringWithFormat:@"date=%@&page=%i",@"2013-12-12T11:55:21.319Z", 0];
    
    newsRequest.HTTPMethod = @"GET";
//    newsRequest.HTTPBody = [data dataUsingEncoding:NSUTF8StringEncoding];
    [newsRequest setHTTPShouldHandleCookies:YES];

    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    

    
    NSData *response1 = [NSURLConnection sendSynchronousRequest:newsRequest returningResponse:&urlResponse error:&requestError];


    id response  = [[NSString alloc] initWithData: response1 encoding:NSASCIIStringEncoding];

    NSLog(@"%@", response);
}
@end
