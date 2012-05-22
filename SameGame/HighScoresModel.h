//
//  HighScoresModel.h
//  SameGame
//
//  Created by Eno Compton on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Score;

@interface HighScoresModel : NSObject

@property (nonatomic, strong) NSMutableArray *topTenScores;
@property (nonatomic, strong) Score *candidateScore;

- (void)sortHighScores;
- (void)saveHighScore:(Score *)newHighScore;

@end
