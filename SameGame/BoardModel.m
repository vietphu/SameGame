//
//  BoardModel.m
//  SameGame
//
//  Created by Eno Compton on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoardModel.h"
#import "SameGameBlock.h"
#import "UIColor+RandomColor.h"
#import "SameGameValues.h"
#import "BoardViewController.h"

@implementation BoardModel

@synthesize selectedBlocks = _selectedBlocks;
@synthesize blocksRemaining = _blocksRemaining;
@synthesize currentScore = _score;
@synthesize livesRemaining = _livesRemaining;
@synthesize levelOver = _levelOver;
@synthesize blocksRemoved = _blocksRemoved;
@synthesize levelNum = _levelNum;

#pragma mark - Initialization and Dealloc
- (id)init
{    
    self = [super init];
    
    if (self) {
        float screenWidth  = [[UIScreen mainScreen] bounds].size.width;
        
        float blockWidth = screenWidth / NUMBER_OF_COLUMNS;
        float blockHeight = blockWidth;
        
        for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
            for (int row = 0; row < NUMBER_OF_ROWS; row++) {
                CGRect aRect = CGRectMake(col * blockWidth, row * blockHeight, blockWidth, blockHeight);
                UIColor *color = [UIColor randomColor];
                blockArray[col][row] = [[SameGameBlock alloc] initWithFrame:aRect andColor:color];
                [blockArray[col][row] setCol:col];
                [blockArray[col][row] setRow:row];
                [blockArray[col][row] addTarget:self action:@selector(selectBlock:) 
                               forControlEvents:UIControlEventTouchDown];
                [blockArray[col][row] addTarget:self action:@selector(removeBlocks) 
                               forControlEvents:UIControlEventTouchUpInside];
                [blockArray[col][row] addTarget:self action:@selector(unselectBlock) 
                               forControlEvents:UIControlEventTouchUpOutside];
            }
        }
        
        self.selectedBlocks = [[NSMutableArray alloc] init];
        self.blocksRemaining = NUMBER_OF_ROWS * NUMBER_OF_COLUMNS;
        self.levelOver = NO;
        self.levelNum = 1;
        self.livesRemaining = 10;
        self.blocksRemoved = 0;
        self.currentScore = 0;
    }

    return self;
}

- (void)dealloc
{
    NSLog(@"BoardModel dealloc called.");
    for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
        for (int row = 0; row < NUMBER_OF_ROWS; row++) {
            [blockArray[col][row] removeFromSuperview]; 
            blockArray[col][row] = nil;
        }
    }
    
    self.selectedBlocks = nil;
}

#pragma mark - Custom Accessors
- (SameGameBlock *)blockAtColumn:(int)col andRow:(int)row
{
    return blockArray[col][row];
}

- (void)setBlock:(SameGameBlock *)block atColumn:(int)col andRow:(int)row
{
    blockArray[col][row] = block;
}

#pragma mark - Block Touches
- (void)selectBlock:(id)sender // UIControlEventTouchDown
{
    SameGameBlock *block = (SameGameBlock *)sender;
 
    NSLog(@"selected block col, row = (%d, %d)", block.col, block.row);
    
    block.blockColor = [UIColor grayColor];
    [block setNeedsDisplay];
    
    [self.selectedBlocks addObject:block];
    block.tested = YES;
    
    // test below
    int rowBelow = block.row + 1;
    
    if (rowBelow >= 0 && rowBelow < NUMBER_OF_ROWS) {
        [self testBlockAtCol:block.col andRow:rowBelow 
                       color:block.originalColor direction:FROM_ABOVE];
    }
    
    // test above
    int rowAbove = block.row - 1;
    
    if (rowAbove >= 0 && rowAbove < NUMBER_OF_ROWS) {
        [self testBlockAtCol:block.col andRow:rowAbove 
                       color:block.originalColor direction:FROM_BELOW];
    }
    
    // test left
    int colLeft = block.col - 1;
    
    if (colLeft >= 0 && colLeft < NUMBER_OF_COLUMNS) {
        [self testBlockAtCol:colLeft andRow:block.row 
                       color:block.originalColor direction:FROM_RIGHT];
    }
    
    // test right
    int colRight = block.col + 1;
    
    if (colRight >= 0 && colRight < NUMBER_OF_COLUMNS) {
        [self testBlockAtCol:colRight andRow:block.row 
                       color:block.originalColor direction:FROM_LEFT];
    }
}

- (void)testBlockAtCol:(int)col andRow:(int)row color:(UIColor *)color direction:(DIRECTION)dir
{
    SameGameBlock *block = blockArray[col][row];
    
    if (block.originalColor != color || block.tested == YES) {
        return;
    }
    
    block.blockColor = [UIColor grayColor];
    [block setNeedsDisplay];
    block.tested = YES;
    
    [self.selectedBlocks addObject:block];
    
    // test below
    int rowBelow = block.row + 1;
    
    if (rowBelow >= 0 && rowBelow < NUMBER_OF_ROWS) {
        [self testBlockAtCol:block.col andRow:rowBelow 
                       color:color direction:FROM_ABOVE];
    }
    
    // test above
    int rowAbove = block.row - 1;
    
    if (rowAbove >= 0 && rowAbove < NUMBER_OF_ROWS) {
        [self testBlockAtCol:block.col andRow:rowAbove 
                       color:color direction:FROM_BELOW];
    }
    
    // test left
    int colLeft = block.col - 1;
    
    if (colLeft >= 0 && colLeft < NUMBER_OF_COLUMNS) {
        [self testBlockAtCol:colLeft andRow:block.row 
                       color:color direction:FROM_RIGHT];
    }
    
    // test right
    int colRight = block.col + 1;
    
    if (colRight >= 0 && colRight < NUMBER_OF_COLUMNS) {
        [self testBlockAtCol:colRight andRow:block.row 
                       color:color direction:FROM_LEFT];
    }
}


- (void)unselectBlock // UIControlEventTouchUpOutside
{
    for (SameGameBlock *block in self.selectedBlocks) {
        block.blockColor = block.originalColor;
        [block setNeedsDisplay];
        block.tested = NO;
    }
    
    [self.selectedBlocks removeAllObjects];
}

#pragma mark - Remove and Move Blocks
- (void)removeBlocks // UIControlEventTouchUpInside
{
    if ([self.selectedBlocks count] != 1) {
        [UIView animateWithDuration:FADE_DURATION
                         
                         animations:^(void) {
                             for (SameGameBlock *block in self.selectedBlocks) {
                                 block.alpha = 0;
                             }
                             // calculate score and block counts
                             NSUInteger selectedBlockCount = [self.selectedBlocks count];
                             self.currentScore += (selectedBlockCount * SCORE_MULTIPLIER);
                             self.blocksRemaining -= selectedBlockCount;
                             self.blocksRemoved   += selectedBlockCount;
                         }
         
                         completion:^(BOOL finished) {
                            
                             for (SameGameBlock *block in self.selectedBlocks) {
                                 block.hidden = YES;
                             }
                             
                             [self moveBlock];
                             // update levelOver BOOL
                             self.levelOver = [self isLevelOver];
                             [self.selectedBlocks removeAllObjects];
                         }
         ];  
    }
    else {
        SameGameBlock *oneBlock = [self.selectedBlocks objectAtIndex:0];
        oneBlock.blockColor = oneBlock.originalColor;
        [oneBlock setNeedsDisplay];
        oneBlock.tested = NO;
        [self.selectedBlocks removeAllObjects];
    }
}

- (void)moveBlock
{
    // check all colomns from left to right, moving blocks down
    for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
        
        int nextEmptyRow = LOGICAL_ROWS;
        int nextOccupiedRow = nextEmptyRow;
        

        while (nextEmptyRow > 0) {
            // find next hidden block
            while (nextEmptyRow > 0 && blockArray[col][nextEmptyRow].hidden == NO) {
                nextEmptyRow--;
            }
            
            nextOccupiedRow = nextEmptyRow;
            
            // if next empty row it not at top, find next occupied row 
            if (nextEmptyRow != 0) {
                while (nextOccupiedRow > 0 && blockArray[col][nextOccupiedRow].hidden == YES) {
                    nextOccupiedRow--;
                }
                
                SameGameBlock *emptyBlock = blockArray[col][nextEmptyRow];
                SameGameBlock *occupiedBlock = blockArray[col][nextOccupiedRow];
                
                CGPoint emptyBlockCenter = emptyBlock.center;
                CGPoint occupiedBlockCenter = occupiedBlock.center;
                int emptyBlockRow = emptyBlock.row;
                int occupiedBlockRow = occupiedBlock.row;
                
                // animate swap of empty block with new block
                [UIView animateWithDuration:MOVE_DURATION animations:^(void) {
                    occupiedBlock.center = emptyBlockCenter;
                }];
                
                emptyBlock.center = occupiedBlockCenter;
                
                // swap empty row block with occupied row block
                occupiedBlock.row = emptyBlockRow;
                emptyBlock.row = occupiedBlockRow;
                
                
                blockArray[col][nextOccupiedRow] = emptyBlock;
                blockArray[col][nextEmptyRow] = occupiedBlock;
                
                nextEmptyRow--;
            }
        }
    }
    
    // check all columns left to right, moving columns left
    int nextEmptyColumn = 0;
    int nextOccupiedColumn = 0;
    
    while (nextEmptyColumn < LOGICAL_COLUMNS) {
        // find empty column
        while (nextEmptyColumn < LOGICAL_COLUMNS && blockArray[nextEmptyColumn][LOGICAL_ROWS].hidden == NO) {
            nextEmptyColumn++;
        }
        
        nextOccupiedColumn = nextEmptyColumn;
        
        // find next occupied column
        while (nextOccupiedColumn < LOGICAL_COLUMNS && blockArray[nextOccupiedColumn][LOGICAL_ROWS].hidden == YES) {
            nextOccupiedColumn++;
        }
        
        // if there is an empty column to the left of an occupied column
        // swap the occupied column with the empty column
        if (nextEmptyColumn != nextOccupiedColumn) {
            for (int row = 0; row < NUMBER_OF_ROWS; row++) {
                // store block data in local variables
                SameGameBlock *emptyBlock = blockArray[nextEmptyColumn][row];
                SameGameBlock *occupiedBlock = blockArray[nextOccupiedColumn][row];
                
                CGPoint emptyBlockCenter = emptyBlock.center;
                CGPoint occupiedBlockCenter = occupiedBlock.center;
                
                int emptyBlockColumn = emptyBlock.col;
                int occupiedBlockColumn = occupiedBlock.col;
                
                // animate column shift to the left
                [UIView animateWithDuration:MOVE_DURATION animations:^(void) {
                    occupiedBlock.center = emptyBlockCenter;
                }];
                
                emptyBlock.center = occupiedBlockCenter; 
                
                // swap empty column block with occupied column block
                occupiedBlock.col = emptyBlockColumn;
                emptyBlock.col = occupiedBlockColumn;
                
                blockArray[nextOccupiedColumn][row] = emptyBlock;
                blockArray[nextEmptyColumn][row] = occupiedBlock;
            }
        
            nextEmptyColumn++;
        }
    }
}

#pragma mark - Level and Game Over
- (void)resetLifeCount
{
    self.livesRemaining = 10;
}

- (BOOL)isLevelOver
{
    /* checks board for adjacent blocks of same color
       returns NO if a pair is found
       returns YES if no pairs remain on board */
    
    // There is a false positive in the algorithm below. FIND IT.
    
    SameGameBlock *testerBlock;
    SameGameBlock *aboveBlock;
    SameGameBlock *belowBlock;
    SameGameBlock *leftBlock;
    SameGameBlock *rightBlock;
    
    int above, below;
    int left, right;
    
    for (int col = 0; col < NUMBER_OF_COLUMNS; col++) {
        for (int row = 0; row < NUMBER_OF_ROWS; row++) {
            testerBlock = blockArray[col][row];
            
            above = row - 1;
            below = row + 1;
            
            left  = col - 1;
            right = col + 1;
            
            if (above >= 0) {
                aboveBlock = blockArray[col][above];
                if ((aboveBlock.hidden == NO) && (aboveBlock.blockColor == testerBlock.blockColor) ) {
                    // NSLog(@"found above block at %d, %d", col, above);
                    return NO;
                }
            }
            
            if (below < NUMBER_OF_ROWS) {
                belowBlock = blockArray[col][below];
                if ((belowBlock.hidden == NO) && (belowBlock.blockColor == testerBlock.blockColor) ) {
                    // NSLog(@"found below block at %d, %d", col, below);
                    return NO;
                }
            }
            
            if (left >= 0) {
                leftBlock = blockArray[left][row];
                if ((leftBlock.hidden == NO) && (leftBlock.blockColor == testerBlock.blockColor) ) {
                    // NSLog(@"found left block at %d, %d", left, row);
                    return NO;
                }
            }
            
            if (right < NUMBER_OF_COLUMNS) {
                rightBlock = blockArray[right][row];
                if ((rightBlock.hidden == NO) && (rightBlock.blockColor == testerBlock.blockColor) ) {
                    // NSLog(@"found right block at %d, %d", right, row);
                    return NO;
                }
            }
        }
    }
    
    return YES;
}

- (BOOL)isGameOver
{
    // Calculate lives gained or lives lost
    if (self.blocksRemaining <= ACCEPTABLE_REMAINDER) {
        self.livesRemaining += 1;
    }
    else {
        self.livesRemaining -= self.blocksRemaining;
    }
    
    if (self.livesRemaining >= 0) {
        // Next level!
        self.levelNum += 1;
        return NO;
    }
    
    self.livesRemaining = 0;
    // Game Over!
    return YES;
}

@end