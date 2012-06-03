//
//  AppDelegate.h
//  SameGame
//
//  Created by Eno Compton on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighScoresProtocol.h"

@class RootViewController;
@class HighScoresModel;

@interface AppDelegate : UIResponder <UIApplicationDelegate, HighScoresProtocol>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootView;

@property (strong, nonatomic) HighScoresModel *highScores;

@end
