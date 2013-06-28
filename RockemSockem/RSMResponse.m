//
//  RSMResponse.m
//  RockemSockem
//
//  Created by Josh Abernathy on 6/28/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMResponse.h"

@interface RSMResponse ()

@property (nonatomic, readonly, copy) NSDictionary *headers;

@end

@implementation RSMResponse

+ (instancetype)responseWithData:(NSData *)data headers:(NSDictionary *)headers {
	RSMResponse *response = [[self alloc] initWithData:data];
	response->_headers = [headers copy];
	return response;
}

#pragma mark HTTPResponse

- (NSDictionary *)httpHeaders {
	return self.headers;
}

@end
