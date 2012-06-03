//
//  Score.m
//  SameGame
//
//  Created by Eno Compton on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Score.h"

@implementation Score

@synthesize playerName = _playerName;
@synthesize score = _score;
@synthesize scoreDate = _scoreDate;

// this is the designated initializer
- (id)initWithScore:(int)aScore playerName:(NSString *)aPlayerName
{
    self = [super init];
    
    if (self) {
        self.playerName = aPlayerName;
        self.score = aScore;
        self.scoreDate = [NSDate date];
    }
    
    return self;
}

- (id)init
{
    return [self initWithScore:0 playerName:@"No Name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (id)copyWithZone:(NSZone *)zone
{
    
}

@end
