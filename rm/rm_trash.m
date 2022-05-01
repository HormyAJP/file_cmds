//
//  rm_trash.m
//  rm
//
//  Created by Badger on 1/5/2022.
//  Copyright © 2022 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "rm_trash.h"

int removefileToTrash(const char* f) {
	NSError* error = NULL;
	NSURL* url = [[NSURL alloc] initFileURLWithPath: [NSString stringWithUTF8String: f]];
	// There's a bug in trashItemAtURL which means that the trashed
	// item will not have the "Put Back" option. There's a bug report here:
	// http://www.openradar.me/41878624.
	[[[NSFileManager alloc] init] trashItemAtURL: url resultingItemURL:nil error:&error];

	// Underlying calls in trashItemAtURL will set errno. That's
	// good enough for the code calling this function. We thus just discard any
	// extra info in the NSError object.
	return !!error;
}

int rm_tree_trash(char** argv) {
	int ret = 0;
	char* f;
	while ((f = *argv++) != NULL) {
		ret |= removefileToTrash(f);
	}
	return ret;
}
