//
//  MWVCard.h
//  TravelGuide
//
//  Created by Dave Shanley on 3/1/14.
//  Copyright (c) 2014 shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWVCard : NSObject

@property (nonatomic, strong) NSString *listingMap; //
@property (nonatomic, strong) NSString *url; //
@property (nonatomic, strong) NSString *listingName; //
@property (nonatomic, strong) NSString *nickName; //
@property (nonatomic, strong) NSArray *listingAddresses; //
@property (nonatomic, strong) NSString *listingPhone; //
@property (nonatomic, strong) NSString *listingHours; //
@property (nonatomic, strong) NSString *listingContent; //
@property (nonatomic, strong) NSString *listingPrice; //

- (id)initWithHTML:(NSString *)document;

@end

@interface MWVCardListingAddress : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;

@end