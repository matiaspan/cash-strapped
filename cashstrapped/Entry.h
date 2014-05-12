//
//  Entry.h
//  cashstrapped
//
//  Created by Maximiliano Gomez Vidal on 5/12/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSDate * createdAt;

@end
