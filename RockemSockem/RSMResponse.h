//
//  RSMResponse.h
//  RockemSockem
//
//  Created by Josh Abernathy on 6/28/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "HTTPDataResponse.h"

// An HTTP request response.
@interface RSMResponse : HTTPDataResponse

// Creates a new response with the given data and headers.
//
// data    - The response body. May be nil.
// headers - The headers to include in the response. May be nil.
//
// Returns the response object.
+ (instancetype)responseWithData:(NSData *)data headers:(NSDictionary *)headers;

@end
