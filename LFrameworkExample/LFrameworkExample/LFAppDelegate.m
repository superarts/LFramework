#import "LFAppDelegate.h"
#import "LCategory.h"

//	TODO: split into different files


@implementation LFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

@end


@implementation LFControllerTableSnippet

enum {
	LFTest1 = 1,
	LFTest2
};

- (void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath*)a_path
{
	switch (a_path.section)
	{
		case 0:
			switch (a_path.row)
			{
				case 0:
					//	animation
					{
						[UIView animateWithDuration:0.3 animations:^() {
							if (label_animation_block.alpha > 0.9)
								label_animation_block.alpha = 0.5;
							else
								label_animation_block.alpha = 1;
						}];
					}
					break;
				case 1:
					//	literal
					{
						[UIAlertView show_title:@"Please check console and source code for details."];
#if __has_feature(objc_bool)
						NSLog(@"number char: %@",	@'Z');
						NSLog(@"number int: %@",	@-42);
						NSLog(@"number uint: %@",	@42U);
						NSLog(@"number lint: %@",	@1234567890L);
						NSLog(@"number llint: %@",	@1234567890LL);
						NSLog(@"number float: %@",	@3.14159);
						NSLog(@"number bool: %@",	@YES);
						NSLog(@"number exp: %@",	@(7.0f / 2.0f));
#endif

#if __has_feature(objc_boxed_expressions)
						NSLog(@"number enum: %@",	@(LFTest2));
#endif

#if __has_feature(objc_array_literals)
						NSArray* array = @[@0, @"value1", @2.0F];
						NSLog(@"array: %@",			array);
#endif

#if __has_feature(objc_dictionary_literals)
						NSDictionary* dict = @{@"key1": @"value1", @"key2": @"value2"};
						NSLog(@"dictionary: %@",	dict);
#endif

#if __has_feature(objc_subscripting)
						NSLog(@"array index: %@",	array[1]);
						NSLog(@"dict index: %@",	dict[@"key2"]);
#endif
					}
					break;
			}
			break;
	}
}

@end


@implementation LFControllerTableCategory

- (void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath*)a_path
{
	switch (a_path.section)
	{
		case 0:
			switch (a_path.row)
			{
				case 0:
					[UIAlertView show_title:@"alert" message:@"[UIAlertView show_title:NSString message:NSString];"];
					break;
				case 1:
					[@"default-test-string" default_string:@"value1"];
					[UIAlertView show_title:@"[NSString default_string:value1];" message:[@"default-test-string" default_string]];
					break;
				case 2:
					[UIAlertView show_title:@"label.animation_duration = 1;" message:@"[label animate_x:100]"];
					label_view_frame.animation_duration = 1;
					if (label_view_frame.x < 100)
						[label_view_frame animate_x:100];
					else
						[label_view_frame animate_x:20];
					break;
				case 3:
					[UIAlertView show_title:@"Add font_name as Key Path in Identity Inspector -> User Defined Runtime Attributes, and font name like Ubuntu-Title in Value."];
					break;
				case 4:
					//	scroll + page
					break;
			}
			break;
	}
}

@end


@implementation LFControllerScroll

- (void)viewDidLoad
{
	UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 960, 150)];
	view.backgroundColor = [UIColor blueColor];
	[scroll addSubview:view];

	scroll.contentSize = CGSizeMake(960, 150);
	[scroll page_associate:page];
	scroll.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView*)a_scroll
{
	[a_scroll page_reload];
	NSLog(@"offset %@", NSStringFromCGPoint(a_scroll.contentOffset));
}

@end
