//
//  FXSquareModel.h
//  FXHomeWorks
//
//  Created by Basil Nikityuk on 9/9/15.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { // move clockwise
	kFXSquarePositionTopLeft,
	kFXSquarePositionTopRight,
	kFXSquarePositionBottomRight,
	kFXSquarePositionBottomLeft,
	kFXSquarePositionCount
} FXSquarePosition;

@interface FXSquareModel : NSObject
@property (nonatomic, assign)	FXSquarePosition	squarePosition;

- (FXSquarePosition)nextPosition;
- (FXSquarePosition)randomPosition;

@end
