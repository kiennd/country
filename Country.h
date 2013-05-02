//
//  Country.h
//  PureTableView
//
//  Created by iOS12 on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (strong) NSString* name;
@property (assign) int population;
@property (strong) NSString* flagName;

- (id) init: (NSString*) name
 population: (float)population
   FlagName: (NSString*) flagname;

@end
