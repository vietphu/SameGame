//
//  UIColor+EC4RandomColor.m
//  Prototype2
//
//  Created by Eno Compton on 2/27/12.


#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor {
    // returns one random out of four colors
    int color;
    static BOOL seeded = NO;
    
    if (!seeded) {
        seeded = YES;
        srandom(time(NULL));
    }
    
    color = random() % 4;
    
    switch (color) {
        case 0:
            return [UIColor redColor];
        case 1:
            return [UIColor blueColor];
        case 2:
            return [UIColor yellowColor];
        default:
            return [UIColor greenColor];
    }
}

@end
