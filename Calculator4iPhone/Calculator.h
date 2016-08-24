//
//  Calculator.h
//  Sample
//
//  Created by user on 2016. 8. 23..
//  Copyright © 2016년 LDCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic, assign) double accumulator;

//-(void) setAccumulator : (double) value;
//-(double) accumulator;

-(void) clear;
-(void) add : (double) value;
-(void) subtract : (double) value;
-(void) multiply : (double) value;
-(void) divide : (double) value;


@end
