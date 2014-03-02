//
//  MWVCard.m
//  TravelGuide
//
//  Created by Dave Shanley on 3/1/14.
//  Copyright (c) 2014 shadyproject. All rights reserved.
//

#import <hpple/TFHpple.h>
#import <CTidy/CTidy.h>

#import "MWVCard.h"


@implementation MWVCard

- (id)initWithHTML:(NSString *)document {
    if (self = [super init]) {
        [self parseHTML:document];
    }
    return self;
}

- (void)parseHTML:(NSString *)document {
    TFHpple *doc = [[TFHpple alloc] initWithHTMLData:[document dataUsingEncoding:NSUTF8StringEncoding]];
    NSArray *elements = [doc searchWithXPathQuery:@"//span[@class='vcard']"];
}

@end
