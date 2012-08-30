//
//  Score.h
//  SameGame
//
//  Created by Eno Compton on 5/3/12.


#import <Foundation/Foundation.h>

@interface Score : NSObject

- (id)initWithScore:(NSInteger)aScore playerName:(NSString *)aPlayerName;

@property (strong, nonatomic) NSString *playerName;
@property NSInteger score;
@property NSDate *scoreDate;

@end
