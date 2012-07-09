//
//  AppDelegate.h
//  Hypnosister
//
//  Created by Mihai Popa on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>
{
    HypnosisView *view;
}
@property (strong, nonatomic) UIWindow *window;

@end
