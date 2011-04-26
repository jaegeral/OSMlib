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
//  Created by Alexander Jäger on 10.09.09.
//  Copyright 2009 alexanderjaeger.de. All rights reserved.
//

#import "OSM_utilURL.h"
#import <UIKit/UIKit.h>


@implementation OSM_utilURL

/**
 Öffnet eine URL die per String übergeben wird, beispielsweise www.google.de
 @param $URL String der geöffnet wird
 @return void
 */
+(void)openURL:(NSString*)URL{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
}

/**
 Öffnet eine Telefonnummer die per String übergeben wird, beispielsweise 012355-123344
 @param $PhoneNumber String der geöffnet wird
 @return void
 */

+ (void) callPhoneNumber:(NSString*)PhoneNumber{
	DLog(@"Call Number: %@",PhoneNumber);

	NSString *callPhoneNumber = [[NSString alloc] initWithFormat:@"tel://%@",PhoneNumber];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhoneNumber]];
	[callPhoneNumber release];
}


/**
 Öffnet eine URL die per String übergeben wird, beispielsweise www.google.de
 ussage [OSM_utilURL sendEmail:@"http://www.google.de"];
 @param $webPage String der geöffnet wird
 @return void
 */

+ (void)openWebPage:(NSString*)webPage{
	DLog(@"open Webpage: %@",webPage);
	NSString *openWebPage = [[NSString alloc] initWithFormat:@"%@",webPage];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:openWebPage]];
	[openWebPage release];
}

/**
 Schickt eine E-Mail die per String übergeben wird
 ussage [OSM_utilURL sendEmail:@"alex@fuemmbf.de"];
 @param $receiver String der geöffnet wird
 @return void
 */

+ (void) sendEmail:(NSString*)receiver {
	if(receiver!=nil){
		DLog(@"Send email an %@",receiver);
		NSString *mailToString = [[NSString alloc] initWithFormat:@"mailto://%@",receiver];
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailToString]];
		[mailToString release];
	}else
		ALog(@"nil in sendEmail");
}

@end
