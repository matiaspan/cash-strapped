//
//  BackgroundImage.h
//  cashstrapped
//
//  Created by Matias Pan on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BackgroundImage : NSManagedObject

@property (nonatomic, retain) NSString * imageId;
@property (nonatomic, retain) NSString * farmId;
@property (nonatomic, retain) NSString * serverId;
@property (nonatomic, retain) NSString * secret;
@property (nonatomic, retain) NSNumber * used;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic, retain) NSDate *dateForUse;

+ (NSInteger)countOfUnusedImages;
+ (BackgroundImage *)imageWithImageId:(NSString *)imageId;
+ (BackgroundImage *)imageForToday;

- (void)downloadAndCacheImageData;

@end