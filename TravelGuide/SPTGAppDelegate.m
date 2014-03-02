//
//  SPTGAppDelegate.m
//  TravelGuide
//
//  Created by Christopher Martin on 2/28/14.
//  Copyright (c) 2014 shadyproject. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>
#import "SPTGAppDelegate.h"
#import "SPTGRequest.h"
#import "MWVCard.h"

@implementation SPTGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // just for testing
    SPTGQueryRequest *queryRequest = [[SPTGQueryRequest alloc] init];
    queryRequest.pageId = @"31068";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [[manager HTTPRequestOperationWithRequest:[queryRequest request] success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
        MWVCard *vcard = [[MWVCard alloc] initWithHTML:responseObject[@"parse"][@"text"][@"*"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }] start];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
