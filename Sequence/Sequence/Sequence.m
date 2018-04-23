//
//  Sequence.m
//  Sequence
//
//  Created by Viktoryia Barzdyka on 4/23/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sequence.h"

@implementation Sequence

- (id) initWithArray:(NSArray* ) array {
    self = [super init];
    if (self) {
        [array retain];
        _array = array;
    }
    return self;
}

- (void) dealloc {
    [_array release];
    [super dealloc];
}

- (NSNumber*) sum {
    NSNumber *sum = [self.array valueForKeyPath: @"@sum.self"];
    NSLog(@"Sum of the elements in the array is %@", sum);
    return sum;
};

- (NSArray*) sortArray {
    NSSortDescriptor *asc = [[[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES] autorelease];
    NSArray *sortedArray = [_array sortedArrayUsingDescriptors:@[asc]];
    return sortedArray;
}

- (int) sequenceLength {
    int counter = 1;
    int currentCouter = counter;
    NSArray *sortedArray = [self sortArray];
    for (NSInteger i = 0; i < sortedArray.count - 1; i++) {
        NSInteger currentItem = [[sortedArray objectAtIndex:i] intValue] + 1;
        NSInteger nextItem = [[sortedArray objectAtIndex:i + 1] intValue];
        if (currentItem == nextItem) {
            counter++;
        } else {
            counter = 1;
        }
        if (counter > currentCouter) {
            currentCouter = counter;
        }
    }
    NSLog(@"The longest elements sequence is: %d", currentCouter);
    return currentCouter;
    
}

@end


