//
//  HighScoresModel.m
//  SameGame
//
//  Created by Eno Compton on 5/3/12.


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
