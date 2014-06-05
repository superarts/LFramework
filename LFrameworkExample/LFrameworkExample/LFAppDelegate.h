#import <UIKit/UIKit.h>

//	TODO: split into different files


@interface LFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end


@interface LFControllerTableSnippet: UITableViewController
{
	IBOutlet UILabel* label_animation_block;
}
@end


@interface LFControllerTableCategory: UITableViewController
{
	IBOutlet UILabel* label_view_frame;
}
@end


@interface LFControllerScroll: UIViewController <UIScrollViewDelegate>
{
	IBOutlet UIScrollView* scroll;
	IBOutlet UIPageControl* page;
}
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
