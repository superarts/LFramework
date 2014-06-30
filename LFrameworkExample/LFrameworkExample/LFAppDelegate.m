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
				case 2:
					//	mail
					//	#import <MessageUI/MessageUI.h>
					{
						MFMailComposeViewController* composer = [[MFMailComposeViewController alloc] init];
						composer.mailComposeDelegate = self;
						[composer setSubject:@"Title"];
						[composer setToRecipients:@[@"no@name.com"]];
						[composer setMessageBody:@"test" isHTML:NO];
						[self.navigationController presentViewController:composer animated:YES completion:nil];
					}
					break;
			}
			break;
	}
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[controller dismissViewControllerAnimated:YES completion:nil];
}

@end


@implementation LFControllerTableCategory

- (void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath*)a_path
{
	switch (a_path.section)
	{
		//	foundation
		case 0:
			switch (a_path.row)
			{
				//	user defaults
				case 0:
					[@"default-test-string" default_string:@"value1"];
					[UIAlertView show_title:@"[NSString default_string:value1];" message:[@"default-test-string" default_string]];
					break;
				//	string + expression
				case 1:
					{
						NSString* s = field_string_expression.text;
						[UIAlertView show_title:[NSString stringWithFormat:@"url_to_filename: %@\nto_url: %@\nescape: %@\nis_email: %i\nis_english_name:%i",
							[s url_to_filename],
							[s to_url],
							[s escape],
							[s is_email],
							[s is_english_name]]];
					}
					break;
				//	string + lc_string
				case 2:
					[self action_string_lcstring];
					break;
			}
			break;
		//	uikit
		case 1:
			switch (a_path.row)
			{
				//	alert
				case 0:
					[UIAlertView show_title:@"alert" message:@"[UIAlertView show_title:NSString message:NSString];"];
					break;
				//	view frame
				case 1:
					[UIAlertView show_title:@"label.animation_duration = 1;" message:@"[label animate_x:100]"];
					label_view_frame.animation_duration = 1;
					if (label_view_frame.x < 100)
						[label_view_frame animate_x:100];
					else
						[label_view_frame animate_x:20];
					break;
				//	custom font + interface builder
				case 2:
					[UIAlertView show_title:@"Add font_name as Key Path in Identity Inspector -> User Defined Runtime Attributes, and font name like Ubuntu-Title in Value."];
					break;
				//	scroll + page
				case 3:
					break;
				//	view with mask
				case 4:
					[button_view_mask1 enable_mask_circle];
					[button_view_mask2 enable_mask_circle];
					[button_view_mask3 enable_mask_circle_width:1 color:[UIColor redColor]];
					[label_view_mask enable_border_width:1 color:[UIColor blueColor] radius:5];
					[table deselectRowAtIndexPath:a_path animated:YES];
					break;
			}
			break;
	}
}

- (IBAction)action_string_lcstring
{
	NSString* s = @"check log for better format\n\n";
	s = [s stringByAppendingFormat:@"[NSString string_from_int:42] - '%@'\n", [NSString string_from_int:42]];
	s = [s stringByAppendingFormat:@"['1' is:'1'] - %i\n", [@"1" is:@"1"]];
	s = [s stringByAppendingFormat:@"['1' is:'2'] - %i\n", [@"1" is:@"2"]];
	s = [s stringByAppendingFormat:@"['12' contains:'1'] - %i\n", [@"12" contains:@"1"]];
	s = [s stringByAppendingFormat:@"['12' contains:'3'] - %i\n", [@"12" contains:@"3"]];
	s = [s stringByAppendingFormat:@"['    te st  ' string_without_leading_space] - '%@'\n", [@"    te st  " string_without_leading_space]];
	s = [s stringByAppendingFormat:@"['test' string_without_leading_space] - '%@'\n", [@"test" string_without_leading_space]];
	s = [s stringByAppendingFormat:@"['12345678 l23455678' string_without:'3' to:'67'] - '%@'\n", [@"12345678 l23455678" string_without:@"3" to:@"67"]];
	s = [s stringByAppendingFormat:@"['12345678 l23455678' string_without:'3' to:'67' except:['45']] - '%@'\n", [@"12345678 l23455678" string_without:@"3" to:@"67" except:@[@"34567"]]];
	s = [s stringByAppendingFormat:@"['12345678 l23455678' string_between:'3' and:'67'] - '%@'\n", [@"12345678 l23455678" string_between:@"3" and:@"67"]];
	s = [s stringByAppendingFormat:@"['12345678 l23455678' string_between:'3' and:'67' from:9] - '%@'\n", [@"12345678 l23455678" string_between:@"3" and:@"67" from:9]];
	s = [s stringByAppendingFormat:@"['12345678 l23455678' array_between:'3' and:'67'] - '%@'\n", [@"12345678 l23455678" array_between:@"3" and:@"67"]];
	s = [s stringByAppendingFormat:@"['#hash' is_hashtag] - '%i'\n", [@"#hashtag" is_hashtag]];
	s = [s stringByAppendingFormat:@"['c#' is_hashtag] - '%i'\n", [@"c#" is_hashtag]];
	s = [s stringByAppendingFormat:@"['test #t1 t2 #t3 t4' array_hashtag] - '%@'\n", [@"test #t1 t2 #t3 t4" array_hashtag]];
	s = [s stringByAppendingFormat:@"['line1' append_line:'line2] - '%@'\n", [@"line1" append_line:@"line2"]];
	s = [s stringByAppendingFormat:@"['line1' append_line2:'line2] - '%@'\n", [@"line1" append_line2:@"line2"]];
	s = [s stringByAppendingFormat:@"['word1' append:'word2' divider:'|'] - '%@'\n", [@"line1" append:@"line2" divider:@"|"]];
	[UIAlertView show_title:s];
	NSLog(@"string + lc_string: %@", s);
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


@implementation LFControllerKeyboardAccessory

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.view set_keyboard_accessory:toolbar item:item_dismiss responder:field enable_mask:YES];
}

- (IBAction)action_dismiss
{
	[self.view lf_action_keyboard_accessory_dismiss];
}

@end


@implementation LFControllerTableBlock

- (void)viewDidLoad
{
	[super viewDidLoad];

	__weak UITableView* table = (UITableView*)self.view;
	table.counts = [@[@20] mutableCopy];
	table.block_cell = ^(NSIndexPath* path)
	{
		LFCellBlock* cell = [table dequeueReusableCellWithIdentifier:@"LFCellBlock"];
		cell.label_title.text = [NSString stringWithFormat:@"%i. Please check LFControllerTableBlock for the lc_block category.", path.row + 1];
		cell.label_subtitle.text = [NSString stringWithFormat:@"LFCellBlock %02i", path.row + 1];
		return cell;
	};
	table.block_select = ^(NSIndexPath* path)
	{ 
		[table deselectRowAtIndexPath:path animated:YES];
	};
	[table reload_block];
}

@end


@implementation LFCellBlock
@end
