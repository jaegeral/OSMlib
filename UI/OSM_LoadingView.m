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
//  Created by Alexander Jäger on 13.04.11.
//

#import "OSM_LoadingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation OSM_LoadingView

- (id)init {
		UIView *LoadingView = [[UIView alloc]initWithFrame:CGRectMake(80.0f, 180.0f, 160.0f, 40.0f)];
		[LoadingView setBackgroundColor:[UIColor lightGrayColor]];
		LoadingView.layer.cornerRadius=5;
	
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[spinner setHidesWhenStopped:TRUE];
		[spinner startAnimating];
		[spinner setCenter:CGPointMake(25.0, 20.0)]; // I do this because I'm in landscape mode
		[LoadingView addSubview:spinner];
		
		
		UILabel *LoadingLabel = [[UILabel alloc ] initWithFrame:CGRectMake(50, 0.0, 100.0, 40.0) ];
		LoadingLabel.textAlignment =  UITextAlignmentLeft;
		LoadingLabel.textColor = [UIColor whiteColor];
		LoadingLabel.backgroundColor = [UIColor clearColor];
		LoadingLabel.numberOfLines = 0;
		LoadingLabel.lineBreakMode = UILineBreakModeWordWrap;
		//StreetTitleLabel.font = [UIFont fontWithName:@"Arial" size:(16.0)];
	LoadingLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:(16.0)];

		LoadingLabel.text = [NSString stringWithFormat: @"%@",@"Lade Daten"];
		LoadingLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
		[LoadingView addSubview:LoadingLabel];
		
	return LoadingView;
}


@end
