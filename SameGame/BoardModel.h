//
//  EIVBoardModel.h
//  SameGame
//
//  Created by Eno Compton on 3/25/12.


#import <Foundation/Foundation.h>
#import "SameGameValues.h"
#import "Score.h"

@class SameGameBlock;

@interface BoardModel : NSObject
{
    SameGameBlock *blockArray[NUMBER_OF_COLUMNS][NUMBER_OF_ROWS]; // columns (x) by rows (y)
}

- (SameGameBlock *)blockAtColumn:(int)col andRow:(int)row;
- (void)setBlock:(SameGameBlock *)block atColumn:(int)col andRow:(int)row;

- (void)selectBlock:(id)sender;
- (void)testBlockAtCol:(int)col andRow:(int)row color:(UIColor *)color direction:(DIRECTION)dir;
- (void)unselectBlock;
- (void)removeBlocks;
- (void)moveBlock;

- (void)resetLifeCount;
- (BOOL)isLevelOver;
- (BOOL)isGameOver;

@property (strong, nonatomic) NSMutableArray *selectedBlocks;
@property int blocksRemaining;
@property int livesRemaining;
@property int blocksRemoved;

@property int levelNum;
@property BOOL levelOver;

@property int currentScore;

@end
