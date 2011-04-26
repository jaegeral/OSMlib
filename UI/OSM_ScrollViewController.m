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
//  Created by Alexander Jäger on 07.04.11.
//

#import "OSM_ScrollViewController.h"


@implementation OSM_ScrollViewController

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	if (self = [super init]) {
		scrollView = [[UIScrollView alloc] init];
		xOffset = 10;
		[scrollView setScrollEnabled:TRUE];
		scrollView.backgroundColor = [UIColor whiteColor];
		[scrollView setContentSize:(CGSizeMake(320, 800))];
		[scrollView setFrame:CGRectMake(0, 0, 320, 420)];
	
		
		
		loadingView=[[OSM_LoadingView alloc]init];
		[scrollView addSubview:loadingView];
		
		self.view = scrollView;
		//[scrollView setDelegate:self];
		[scrollView setShowsVerticalScrollIndicator:TRUE];
		
	}
	
	return self;
}

-(void)finishScrollview{
	#pragma mark Abschluss	
	float gesamtHoehe2 = xOffset + 50.0;	
	[self.view addSubview:loadingView];
	[loadingView setHidden:TRUE];
	
		//[UIColor colorWithWhite:0.873 alpha:1.000];
	[scrollView setContentSize:(CGSizeMake(320, gesamtHoehe2))];
	[scrollView setFrame:CGRectMake(0, 0, 320, 420)];
}
-(void)clearScrollView{
	NSLog(@"clearScrollView");
	
	//[[scrollView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
	[scrollView release];
	scrollView = [[UIScrollView alloc] init];
	xOffset = 10;
	[scrollView setScrollEnabled:TRUE];
	scrollView.backgroundColor = [UIColor colorWithWhite:0.873 alpha:1.000];
	[scrollView setContentSize:(CGSizeMake(320, 420))];
	[scrollView setFrame:CGRectMake(0, 0, 320, 420)];
	self.view = scrollView;
	[scrollView addSubview:loadingView];
	[scrollView setShowsVerticalScrollIndicator:TRUE];

	
}





///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
	[scrollView release];
	
	[super dealloc];
}

- (void)loadView {
	[super loadView];
	
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidUnload {
	[super viewDidUnload];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
}





@end
