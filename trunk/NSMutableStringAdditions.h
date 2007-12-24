//
//  NSStringAdditions.h
//  DictPlugin
//
//  Created by Kevin Ballard on 11/2/04.
//  Copyright 2004 Kevin Ballard. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMutableString (NSMutableStringAdditions)
- escapeCharactersInSet:(NSCharacterSet *)characterSet;
- escapeCharactersInSet:(NSCharacterSet *)characterSet withString:(NSString *)escape;
@end
