//
//  HighScoresModel.h
//  SameGame
//
//  Created by Eno Compton on 5/3/12.


#import <Foundation/Foundation.h>

@class Score;

@interface HighScoresModel : NSObject <NSCoding>



@property (nonatomic, strong) NSMutableArray *topTenScores;
@property (nonatomic, strong) Score *candidateScore;



- (void)sortHighScores;

@end
