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
//  Created by Alexander Jäger on 29.07.10.
//

#import "OSM_Reachability.h"
#import "Reachability.h"


@implementation OSM_Reachability

#pragma mark -
#pragma mark Checking Internet Connection
static NSString *hostname = @"aycs.de";

/**
 Prüft, ob Verbindung zum Internet besteht
 ussage [OSM_Reachability checkInternet];
 @param keiner
 @return BOOL: true: Internet vorhanden
 @return BOOL: false: kein Internet vorhanden
 */

+(BOOL)checkInternet{
	//Test for Internet Connection
	NSLog(@"Testing Internet Connectivity");
	Reachability *r = [Reachability reachabilityWithHostName:hostname];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
	BOOL internet;
	if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
		internet = NO;
	} else {
		internet = YES;
	}
	return internet;
}

@end
