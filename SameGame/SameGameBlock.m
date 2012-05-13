//
//  EC4BoxButton.m
//  Prototype2
//
//  Created by Eno Compton on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SameGameBlock.h"

@implementation SameGameBlock

@synthesize blockColor = _blockColor;
@synthesize originalColor = _originalColor;
@synthesize col = _col;
@synthesize row = _row;
@synthesize tested = _tested;

-(id)initWithFrame:(CGRect)frame andColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initializeBlock:color];
    }
    
    return self;
}

- (void)initializeBlock:(UIColor *)color
{
    self.blockColor = color;
    self.originalColor = color;
    self.tested = NO;
    self.highlighted = NO;
    self.hidden = NO;
    self.alpha = 1;
    self.exclusiveTouch = YES;
}

- (id)init
{
    CGRect aRect = CGRectMake(0, 0, 0, 0);
    return [self initWithFrame:aRect andColor:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andColor:nil];
}

- (void)dealloc
{
    self.blockColor = nil;
    self.originalColor = nil;
}

-(void)drawRect:(CGRect)rect
{  
    float viewWidth, viewHeight;
	viewWidth = self.bounds.size.width;
	viewHeight = self.bounds.size.height;
    
    // Define a rect in the shape of the block
    CGRect blockRect = CGRectMake(0, 0, viewWidth, viewHeight);
    CGRect insideRect = CGRectMake(1, 1, (viewWidth - 2), (viewHeight -2) );
    
    // Define a path using the rect
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:blockRect];
    UIBezierPath *insidePath = [UIBezierPath bezierPathWithRect:insideRect];
    
    // Set the line width of the path
    path.lineWidth = 2.0;
    insidePath.lineWidth = 2.0;
    
    UIColor *strokeColor = [UIColor blackColor];
    [strokeColor setStroke];
    
    // Stroke the path
	[path stroke];
    
    // Set the fill color to yellow
    UIColor* fillColor = self.blockColor;
    [fillColor setFill];
    
    [insidePath fill];
}

@end
