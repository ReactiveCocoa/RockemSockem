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

@end
