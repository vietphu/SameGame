//
//  Score.h
//  SameGame
//
//  Created by Eno Compton on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

- (id)initWithScore:(NSNumber *)aScore playerName:(NSString *)aPlayerName;

@property (strong, nonatomic) NSString *playerName;
@property NSNumber *score;
@property NSDate *scoreDate;

@end
