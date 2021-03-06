//
//  Score.m
//  SameGame
//
//  Created by Eno Compton on 5/3/12.


#import "Score.h"

@implementation Score

@synthesize playerName = _playerName;
@synthesize score = _score;
@synthesize scoreDate = _scoreDate;

// this is the designate initializer
- (id)initWithScore:(NSInteger)aScore playerName:(NSString *)aPlayerName
{
    self.playerName = aPlayerName;
    self.score = aScore;
    self.scoreDate = [NSDate date];
    return self;
}

- (id)init
{
    return [self initWithScore:0 playerName:@"No Name"];
}

@end
