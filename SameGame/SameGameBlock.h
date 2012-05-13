//
//  EC4BoxButton.h
//  Prototype2
//
//  Created by Eno Compton on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SameGameBlock.h"

@interface SameGameBlock : UIControl

- (id)initWithFrame:(CGRect)frame andColor:(UIColor *)color;
- (void)initializeBlock:(UIColor *)color;

@property (nonatomic, strong) UIColor *blockColor;
@property (nonatomic, strong) UIColor *originalColor;
@property int col;
@property int row;
@property BOOL tested;

@end
