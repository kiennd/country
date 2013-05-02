//
//  ViewController.m
//  PureTableView
//
//  Created by techmaster on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#define COUNTRY_KEY @"countries"
#define HEADER_KEY @"header"
@interface ViewController ()
{
 
    NSArray *_data;
    NSMutableArray* _countries0;
    NSMutableArray* _countries1;
}
@end

@implementation ViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        [self loadData];
       
    }
    return self;
}

- (void) loadData{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:dataPath];
    _countries0 = [_data[0] valueForKey:COUNTRY_KEY];
    _countries1 = [_data[1] valueForKey:COUNTRY_KEY];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //_segm addT
	// Do any additional setup after loading the view.
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return [_data count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [_countries0 count];
    }else{
        return [_countries1 count];
    }
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_data[section] valueForKey:HEADER_KEY];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"UniqueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSArray *countries ;
    
    if (indexPath.section == 0) {
        countries = _countries0;
    }else{
        countries = _countries1;
    }
    
    cell.textLabel.text = countries[indexPath.row][@"name"];
    cell.detailTextLabel.text = countries[indexPath.row][@"pop"];
    cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.png",countries[indexPath.row][@"name"] ]];
    return cell;
}
- (IBAction)sortAc:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSLog(@"select 0");
	if ([segmentedControl selectedSegmentIndex] == 0) {
        NSLog(@"select 0");
        NSMutableArray *countries = [_data[0] valueForKey:COUNTRY_KEY];
        _countries0 = [countries sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
            
            return [obj1[@"name"] compare:obj2[@"name"]];
            
        }];
        countries = [_data[1] valueForKey:COUNTRY_KEY];
        _countries1 = [countries sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
            
            return [obj1[@"name"] compare:obj2[@"name"]];
            
        }];
        
        [_tableView reloadData];
    }else{
        NSLog(@"select 1");
        NSMutableArray *countries = [_data[0] valueForKey:COUNTRY_KEY];
        _countries0 = [countries sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
            
            return [obj1[@"pop"] floatValue]  > [obj2[@"pop"] floatValue];
            
        }];
        
        
        countries = [_data[1] valueForKey:COUNTRY_KEY];
        _countries1 = [countries sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
            
            return [obj1[@"pop"] floatValue]  > [obj2[@"pop"] floatValue];
            
        }];
        
        [_tableView reloadData];

    }

}




@end
