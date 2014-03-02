//
//  MWVCard.m
//  TravelGuide
//
//  Created by Dave Shanley on 3/1/14.
//  Copyright (c) 2014 shadyproject. All rights reserved.
//

#import <hpple/TFHpple.h>
#import <CTidy/CTidy.h>

#define kLabelListingAddress @"label listing-address"

#import "MWVCard.h"

//////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MVCardListingAddress

@implementation MWVCardListingAddress

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@", self.name, self.address];
}

@end

//////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MWVCard


@interface MWVCard ()

@property (nonatomic, strong) NSMutableArray *names;
@property (nonatomic, strong) NSMutableArray *addresses;

@end

@implementation MWVCard


- (id)initWithHTML:(NSString *)document {
    if (self = [super init]) {
        self.listingAddresses = [NSArray new];
        self.addresses = [NSMutableArray new];
        self.names = [NSMutableArray new];
        [self parseHTML:document];
    }
    return self;
}

- (void)parseHTML:(NSString *)document {
    // tidy it up
    NSError *error;
    NSString* xhtml = [[CTidy tidy] tidyHTMLString:document
                                          encoding:@"UTF8"
                                             error:&error];
    NSLog(@"%@", xhtml);
    TFHpple *doc = [[TFHpple alloc] initWithHTMLData:[xhtml dataUsingEncoding:NSUTF8StringEncoding]];
    NSArray *elements = [doc searchWithXPathQuery:@"//*[@class='vcard']"];
    for (TFHppleElement *element in elements) {
        // FIXME: each element here isn't just a vcard -- somehow we're overstepping and parsing into the next vcard
        [self parseElement:element];
    }
    
    // build name-address pairs
    // this currently doesn't build correct pairs
    for (int i=0; i < fmax(self.names.count, self.addresses.count); ++i) {
        MWVCardListingAddress *address = [MWVCardListingAddress new];
        address.name = (i < self.names.count) ? self.names[i] : nil;
        address.address = (i < self.addresses.count) ? self.addresses[i] : nil;
        self.listingAddresses = [self.listingAddresses arrayByAddingObject:address];
    }
    
    NSLog(@"%@", self.listingAddresses);
}

- (void)parseElement:(TFHppleElement *)element {
    if ([element hasChildren]) {
        for (TFHppleElement *child in element.children) {
            if (child) [self parseElement:child];
        }
    }
    
    NSLog(@"Element tag: %@ text: %@ attr: %@ parent-tag: %@", [element tagName], [element text], [element attributes], element.parent.tagName);
    
    if ([((NSString *)[element attributes][@"class"]) isEqualToString:@"fn org listing-name"]) {
        NSLog(@"Element tag: %@ text: %@ attr: %@", [element tagName], [element text], [element attributes]);
        [self.names addObject:element.text];
    }
    
    else if ([((NSString *)[element attributes][@"class"]) isEqualToString:@"label listing-address"]) {
        NSLog(@"Element tag: %@ text: %@ attr: %@", [element tagName], [element text], [element attributes]);
        [self.addresses addObject:element.text];
    }
    
    
}

@end
