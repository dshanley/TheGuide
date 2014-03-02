//
//  MWVCard.h
//  TravelGuide
//
//  Created by Dave Shanley on 3/1/14.
//  Copyright (c) 2014 shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWVCard : NSObject

@property (nonatomic, readonly) NSString *listingMap; //
@property (nonatomic, readonly) NSString *url; //
@property (nonatomic, readonly) NSString *listingName; //
@property (nonatomic, readonly) NSString *nickName; //
@property (nonatomic, readonly) NSString *listingAddress; //
@property (nonatomic, readonly) NSString *listingPhone; //
@property (nonatomic, readonly) NSString *listingHours; //
@property (nonatomic, readonly) NSString *listingContent; //
@property (nonatomic, readonly) NSString *listingPrice; //

- (id)initWithHTML:(NSString *)document;

@end
