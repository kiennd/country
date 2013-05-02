//
//  Country.m
//  PureTableView
//
//  Created by iOS12 on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "Country.h"

@implementation Country

- (id) init: (NSString*) name
 population: (float)population
   FlagName: (NSString*) flagname
{
    if(self =  [super init]){
        self.name =  name;
        self.population = population;
        self.flagName = flagname;
    }
    return self;
}

@end
