//
//  Sequence.h
//  Sequence
//
//  Created by Viktoryia Barzdyka on 4/23/18.
//  Copyright © 2018 Barzdyka. All rights reserved.
//

@interface Sequence : NSObject

@property (nonatomic, strong) NSArray *array;

- (id) initWithArray:(NSArray*) array;
- (NSNumber*) sum;
- (int) sequenceLength;

@end
