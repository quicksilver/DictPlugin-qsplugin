//
//  QSDictionaryPlugIn.m
//  DictPlugin
//
//  Created by Nicholas Jitkoff on 11/24/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import "QSDictionaryPlugIn.h"
//#import <QSFoundation/NSTask_BLTRExtensions.h>
#import "DCSPrivate.h"

#define THESAURUS_NAME @"Oxford American Writer's Thesaurus"
#define DICTIONARY_NAME	@"New Oxford American Dictionary"

@implementation QSDictionaryPlugIn
- (void)lookupWord:(NSString *)word inDictionary:(NSString *)dictName{
	NSURL *dictURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Dictionaries/%@.dictionary",dictName]];
	DCSDictionaryRef dict = NULL;
	if (dictURL) {
		dict = DCSDictionaryCreate((CFURLRef)dictURL);
	}
	CGEventRef event = CGEventCreate(NULL);
	CGPoint point = CGEventGetLocation(event);
	CFRelease(event);
	HIDictionaryWindowShow(dict, word, CFRangeMake(0,[word length]), NULL, point, NO, NULL);
}

- (QSObject *)lookupWordInDictionary:(QSObject *)dObject{
	[self lookupWord:[dObject stringValue] inDictionary:DICTIONARY_NAME];
	return nil;
}

- (QSObject *)lookupWordInThesaurus:(QSObject *)dObject{
	[self lookupWord:[dObject stringValue] inDictionary:THESAURUS_NAME];
	return nil;
}

@end
