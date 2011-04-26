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
//  Created by Alexander Jäger on 17.11.09.
//
//	Helper Klasse für MD5 Methoden
//

#import "OSM_utilMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation OSM_utilMD5


/**
 Liefert MD5 Hashwert zu einem übergebenen NSString zurück
 @param $str String der gehashed wird
 @return NSString MD5 Hashwert
 */
+(NSString*)md5fromNSString:(NSString*)str{
    
	const char *cStr = [str UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5( cStr, strlen(cStr), result );
    
   /* NSLog(@"MD5 von: %@ ergibt: %@ ",str,[NSString stringWithFormat:
                                          @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                                         result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                                         result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
                                         ]);
*/
    
	return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
	];
} 

/**
 Liefert MD5 Hashwert zu einem übergebenen NSDats zurück
 @param $input NSData das gehashed wird
 @return NSString MD5 Hashwert
 */
+(NSString*)md5fromNSData:(NSData*)input{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5([input bytes], [input length], result);
	
    return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
			];
}



@end
