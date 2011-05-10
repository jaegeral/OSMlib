// Copyright 2011 Alexander Jaeger for AYCS UG(haftungsbeschränkt) aycs.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Created by Alexander Jäger on 09.12.10.
//
#import <UIKit/UIKit.h>
#import "Global.h"
#import "OSM_utilMD5.h"

@implementation Global



+(BOOL)isIPAD{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return TRUE;
	} else {
		return FALSE;
	}
	return FALSE;
}

+ (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    return [emailTest evaluateWithObject:candidate];
}


/*
 Switches between Multiple Value and Single Value strings.
 Example:
 [Global getMultiText:@"LNG_RATING" forNumber:1]; returns: Bewertung if LNG_RATING is set up in localized strings
 [Global getMultiText:@"LNG_RATING" forNumber:2]; returns: Bewertungen if LNG_RATING_MULTI is set up in localized strings
So you can set up every localized string as single value and multi value and use them
 
 
 */

+ (NSString*)getMultiText:(NSString*)singeValuedString forNumber:(NSNumber*)Number{
	if ([Number intValue]==1) {
			return NSLocalizedString(singeValuedString, @"");
	}else {
			NSString *returnString = [[[NSString alloc]initWithFormat:@"%@_MULTI",singeValuedString]autorelease];
			return NSLocalizedString(returnString, @"");
	}


}

/*
 Appends general App / User Details to an given String, for Example for an E-Mail
 Example:
 [Global appendGeneralUserInfosForMail:&yourText]; 
 */


+(void)appendGeneralUserInfosForMail:(NSMutableString**)Source{
	[*Source appendString:@"App Details"];
	[*Source appendString:@"\nIdentifier: "];
	[*Source appendString:[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleIdentifier"]];
	[*Source appendString:@"\nVersion: "];
	[*Source appendString:[[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]];
	[*Source appendString:@"\nLanguage: "];
	[*Source appendString:[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0]];
	[*Source appendString:@"\nLocale: "];
	[*Source appendString:[[NSLocale currentLocale] localeIdentifier]];
	[*Source appendString:@"\niOS Version: "];
	[*Source appendString:[[NSProcessInfo processInfo] operatingSystemVersionString]];
}





@end
