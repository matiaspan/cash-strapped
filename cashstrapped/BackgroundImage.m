//
//  BackgroundImage.m
//  cashstrapped
//
//  Created by Matias Pan on 6/3/14.
//  Copyright (c) 2014 Cannonball HQ. All rights reserved.
//

#import "BackgroundImage.h"
#import "NSDate+Utils.h"

NSOperationQueue *imageDownloadOperationQueue;

@implementation BackgroundImage

@dynamic imageId;
@dynamic used;
@dynamic imageData;
@dynamic farmId;
@dynamic secret;
@dynamic serverId;
@dynamic dateForUse;

+ (NSInteger)countOfUnusedImages {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"used == NO"];
    NSArray *results = [BackgroundImage MR_findAllWithPredicate:predicate];
    return results.count;
}

+ (BackgroundImage *)imageWithImageId:(NSString *)imageId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"imageId == %@", imageId];
    NSArray *results = [BackgroundImage MR_findAllWithPredicate:predicate];
    
    if (results.count) {
        return [results firstObject];
    } else {
        return nil;
    }
}

+ (BackgroundImage *)imageForToday {
    NSDate *today = [[NSDate date] dateWithFilteredOutComponents];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"dateForUse == %@", today];
    NSArray *results = [BackgroundImage MR_findAllWithPredicate:predicate];
    
    if (results.count) {
        return [results firstObject];
    } else {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"used == NO"];
        NSArray *results = [BackgroundImage MR_findAllWithPredicate:predicate];
        
        if (results.count) {
            BackgroundImage *image = [results firstObject];
            image.dateForUse = today;
            image.used = @YES;
            [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreWithCompletion:nil];
            return [results firstObject];
        }
        
        return nil;
    }
}

- (NSOperationQueue *)operationQueue {
    if (!imageDownloadOperationQueue) {
        imageDownloadOperationQueue = [[NSOperationQueue alloc] init];
    }
    
    return imageDownloadOperationQueue;
}

- (void)downloadAndCacheImageData {
    NSString *imageURL = [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg", self.farmId, self.serverId, self.imageId, self.secret];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
    [NSURLConnection sendAsynchronousRequest:request queue:[self operationQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        UIImage *image = [UIImage imageWithData:data];
        
        if (image) {
            self.imageData = data;
        }

        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
        
    }];
}

@end
