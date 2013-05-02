//
//  RSMServer+Private.h
//  RockemSockem
//
//  Created by Josh Abernathy on 4/20/13.
//  Copyright (c) 2013 Josh Abernathy. All rights reserved.
//

#import "RSMServer.h"

@interface RSMServer () {
@package
	RACSubject *_webSockets;
}

// Should the server use SSL?
@property (nonatomic, assign) BOOL useSSL;

// The SSL identity to use. If `useSSL` is YES, this will not be NULL, otherwise
// its value is undefined.
@property (nonatomic, assign) SecIdentityRef SSLIdentity;

// An array of SecIdentityRefs. May be nil.
@property (nonatomic, copy) NSArray *SSLCertificates;

@end
