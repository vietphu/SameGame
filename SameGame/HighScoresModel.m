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

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return self;
}

- (void)sortHighScores
{

}

@end
