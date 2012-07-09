//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   // [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    //NSLog(@"%@", [[UIScreen mainScreen]bounds]);
    //CGRect viewFrame =CGRectMake(16, 24, 100, 150);
    //CGRect viewFrame2 = CGRectMake(20, 30, 50, 50);
    
    //HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:viewFrame2];
    //[anotherView setBackgroundColor:[UIColor blueColor]];
    //[view setBackgroundColor:[UIColor redColor]];
    CGRect screenRect = [[self window]bounds];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [[self window] addSubview:scrollView];
    
    CGRect bigRect = screenRect;
    //bigRect.size.width *= 2.0;
    
    view = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:view];
    [scrollView setContentSize:bigRect.size];
        
    //screenRect.origin.x = screenRect.size.width;
    //HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:screenRect];
    //[scrollView addSubview:anotherView];
    //[scrollView setPagingEnabled:YES];
    BOOL success = [view becomeFirstResponder];   
    
    [scrollView setMinimumZoomScale:1.0];
    [scrollView setMaximumZoomScale:5.0];
    [scrollView setDelegate:self];
    
    //[view addSubview:anotherView];

    self.window.backgroundColor = [UIColor colorWithRed:100.6 green:100.6 blue:100.6 alpha:1];
    BOOL succes = [view becomeFirstResponder];
    if (succes)
    {
        NSLog(@"HypnosisView became the first responder");
    }else{
        NSLog(@"Could not become first responder");
    }
    [self.window makeKeyAndVisible];
    return YES;
}
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
