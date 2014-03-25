//
//  ViewController.m
//  DayZ
//
//  Created by Scott Luxenberg on 2/23/14.
//  Copyright (c) 2014 Scott Luxenberg. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSManagedObjectContext *context = [[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError *errorFetch = nil;
    NSArray *array = [context executeFetchRequest:request error:&errorFetch];
    
    entity = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSArray *array2 = [context executeFetchRequest:request error:&errorFetch];
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
                                                            inManagedObjectContext:context];
    [object setValue:@"item3" forKey:@"itemName"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"columnSize"];
    [object setValue:[NSNumber numberWithBool:YES] forKey:@"holdsItems"];
    [object setValue:@"img3.jpg" forKey:@"imageName"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"inventoryColumn"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"inventoryRow"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"itemState"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"rowSize"];
    [object setValue:[NSNumber numberWithInt:1] forKey:@"variantType"];
    [object setValue:@"type3" forKey:@"itemType"];
    [object setValue:@"wear3" forKey:@"itemWear"];
    [object setValue:[NSMutableSet setWithObject:[array objectAtIndex:2]] forKey:@"ownedBy"];
    [object setValue:[NSMutableSet setWithObject:[array2 objectAtIndex:0]] forKey:@"locationsFound"];
    
    NSManagedObject *object2 = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
                                                            inManagedObjectContext:context];
    [object2 setValue:@"item3a" forKey:@"itemName"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"columnSize"];
    [object2 setValue:[NSNumber numberWithBool:NO] forKey:@"holdsItems"];
    [object2 setValue:@"img3a.jpg" forKey:@"imageName"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"inventoryColumn"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"inventoryRow"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"itemState"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"rowSize"];
    [object2 setValue:[NSNumber numberWithInt:1] forKey:@"variantType"];
    [object2 setValue:@"type3a" forKey:@"itemType"];
    [object2 setValue:@"wear3a" forKey:@"itemWear"];
    [object2 setValue:[NSMutableSet setWithObject:[array objectAtIndex:2]] forKey:@"ownedBy"];
    [object2 setValue:[NSMutableSet setWithObject:[array2 objectAtIndex:1]] forKey:@"locationsFound"];
    [object2 setValue:object forKey:@"containedBy"];
    
    NSManagedObject *object3 = [NSEntityDescription insertNewObjectForEntityForName:@"Item"
                                                             inManagedObjectContext:context];
    [object3 setValue:@"item3b" forKey:@"itemName"];
    [object3 setValue:[NSNumber numberWithInt:1] forKey:@"columnSize"];
    [object3 setValue:[NSNumber numberWithBool:NO] forKey:@"holdsItems"];
    [object3 setValue:@"img3b.jpg" forKey:@"imageName"];
    [object3 setValue:[NSNumber numberWithInt:1] forKey:@"inventoryColumn"];
    [object3 setValue:[NSNumber numberWithInt:2] forKey:@"inventoryRow"];
    [object3 setValue:[NSNumber numberWithInt:1] forKey:@"itemState"];
    [object3 setValue:[NSNumber numberWithInt:1] forKey:@"rowSize"];
    [object3 setValue:[NSNumber numberWithInt:1] forKey:@"variantType"];
    [object3 setValue:@"type3b" forKey:@"itemType"];
    [object3 setValue:@"wear3b" forKey:@"itemWear"];
    [object3 setValue:[NSMutableSet setWithObject:[array objectAtIndex:2]] forKey:@"ownedBy"];
    [object3 setValue:[NSMutableSet setWithObject:[array2 objectAtIndex:2]] forKey:@"locationsFound"];
    [object3 setValue:object forKey:@"containedBy"];
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
