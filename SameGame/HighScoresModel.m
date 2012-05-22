//
//  HighScoresModel.m
//  SameGame
//
//  Created by Eno Compton on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HighScoresModel.h"
#import "Score.h"

@implementation HighScoresModel

@synthesize candidateScore = _candidateScore;
@synthesize topTenScores = _topTenScores;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)sortHighScores
{

}

- (void)saveHighScore:(Score *)newHighScore
{
    // add currentScore to a Score object and store in HighScoresModel
    NSLog(@"Will save user: %@ with score: %d", newHighScore.playerName, [newHighScore.score intValue]);
}


@end
