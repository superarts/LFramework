#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

//	TODO: split into different files


@interface LFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end


@interface LFControllerTableSnippet: UITableViewController <MFMailComposeViewControllerDelegate>
{
	IBOutlet UILabel* label_animation_block;
}
@end


@interface LFControllerTableCategory: UITableViewController
{
	IBOutlet UILabel*		label_view_frame;
	IBOutlet UITextField*	field_string_expression;

	IBOutlet UILabel*		label_view_mask;
	IBOutlet UIButton*		button_view_mask1;
	IBOutlet UIButton*		button_view_mask2;
	IBOutlet UIButton*		button_view_mask3;
}
@end


@interface LFControllerScroll: UIViewController <UIScrollViewDelegate>
{
	IBOutlet UIScrollView* scroll;
	IBOutlet UIPageControl* page;
}
@end


@interface LFControllerKeyboardAccessory: UIViewController
{
	IBOutlet UIToolbar*			toolbar;
	IBOutlet UIBarButtonItem*	item_dismiss;
	IBOutlet UITextField*		field;
}
@end


@interface LFControllerTableBlock: UITableViewController
@end


@interface LFCellBlock: UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel*	label_title;
@property (strong, nonatomic) IBOutlet UILabel*	label_subtitle;
@end


/*

#pragma mark UITextField delegates

- (BOOL)textFieldShouldReturn:(UITextField*)field

#pragma mark UISearchBar delegates

- (void)searchBar:(UISearchBar*)search textDidChange:(NSString*)text

#pragma mark UITableViewController delegates

- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section
- (void)tableView:(UITableView*)table didSelectRowAtIndexPath:(NSIndexPath*)path
- (UITableViewCell*)tableView:(UITableView*)table cellForRowAtIndexPath:(NSIndexPath*)path

*/
