//
//  SameGameValues.h
//  SameGame
//
//  Created by Eno Compton on 3/25/12.


#ifndef SameGame_SameGameValues_h
#define SameGame_SameGameValues_h

/* To change the number of columns and rows, change the values here */
#define NUMBER_OF_COLUMNS       15 // normal = 20, test = 10
#define NUMBER_OF_ROWS          15 // normal = 24, test = 10

#define FADE_DURATION           0.15 // controls the downward and leftward movement
#define MOVE_DURATION           0.1

#define ACCEPTABLE_REMAINDER    10   // number of boxes left on board for level up

#define SCORE_MULTIPLIER        13 // number of blocks removed is multiplied by this to make score

#define LOGICAL_COLUMNS         (NUMBER_OF_COLUMNS - 1)
#define LOGICAL_ROWS            (NUMBER_OF_ROWS - 1)

#define MAX_PLAYER_NAME_LENGTH  25


typedef enum {
    FROM_ABOVE,
    FROM_BELOW,
    FROM_LEFT,
    FROM_RIGHT,
} DIRECTION;

enum {
    EXIT_GAME,
    RESET_GAME,
    HIGH_SCORE,
    GAME_OVER,
    NEXT_LEVEL
};

#endif
