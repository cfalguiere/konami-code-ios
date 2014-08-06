#import "ICRubrique1Controller.h"
#import "UIViewController+Navigation.h"

// KC demo

@implementation ICRubrique1Controller

@synthesize kcsuite;

- (id)initWithModel:(ICModel*)theModel{
    self = [super init];
    return self;
}

- (NSArray *) generateKC
{
    kcsuite = [NSArray arrayWithObjects:
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionUp],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionUp],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionDown],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionDown],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionLeft],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionRight],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionLeft],
               [NSNumber numberWithInt:UISwipeGestureRecognizerDirectionRight],
               @"A",
               @"B",
               nil];
    return kcsuite;
}


- (id)init 
{
    self = [super init];
    if (self) {
        self.title = @"Rubrique1";
        kcsuite = [[self generateKC] retain];
        kcindex = 0;
    }

    return self;
}

- (void)dealloc
{
    [kcsuite release];
//    [popoverController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - KC


- (void)setupGestureRecognizers:(UIViewController *)viewController {
    UISwipeGestureRecognizer *swipe = nil;
    
    swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(handleKC:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [viewController.view addGestureRecognizer:swipe];
    [swipe release];
    
    swipe = [[UISwipeGestureRecognizer alloc]
             initWithTarget:self action:@selector(handleKC:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [viewController.view addGestureRecognizer:swipe];
    [swipe release];
    
    swipe = [[UISwipeGestureRecognizer alloc]
             initWithTarget:self action:@selector(handleKC:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [viewController.view addGestureRecognizer:swipe];
    [swipe release];
    
    swipe = [[UISwipeGestureRecognizer alloc]
             initWithTarget:self action:@selector(handleKC:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [viewController.view addGestureRecognizer:swipe];
    [swipe release];
}


- (void)handleKC:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swipe %d %d", sender.direction, kcindex);
    int kcitem = [[self.kcsuite objectAtIndex:kcindex] intValue];
    if (sender.direction == kcitem) {
        kcindex++;
    } else {
        [self resignFirstResponder];
        kcindex = 0;
    }
    
    if (kcindex == [kcsuite count]-2) {
        NSLog(@"YAAAOOUUHHH !");
        CGRect frame = CGRectMake(self.view.center.x, self.view.center.y, 200, 200);
        UITextField *field = [[UITextField alloc] initWithFrame:frame];
        field.delegate = self;
        field.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        field.textAlignment = UITextAlignmentCenter;
        [self.view addSubview:field];
        [field becomeFirstResponder];
        [field release];
    } 
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	NSString *text = textField.text;
    NSLog(@"entered %@", text);
	[textField resignFirstResponder];
	
    if ([@"AB" isEqualToString:text]) {
        NSLog(@"YYYYEEEEESSSSSSSSS !");
        UIAlertView *alert = [[UIAlertView alloc] 
                              initWithTitle:@"YYYYEEEEESSSSSSSSS !"
														message:nil
													   delegate:nil
                                              cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
		[alert autorelease];
		[alert show];    
    } 
    return YES;
}


#pragma mark - View components

- (void)createPanelWithTitle:(NSString*)title 
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
	[titleLabel setTextAlignment:UITextAlignmentLeft];
	[titleLabel setTextColor:[UIColor whiteColor]];
	[titleLabel setBackgroundColor:[UIColor blackColor]];
	[titleLabel setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)]];
    titleLabel.text = title; 
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.autoresizesSubviews = YES;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
	
	[self.view addSubview:titleLabel];
    
	[titleLabel release];    
}



#pragma mark - View lifecycle

- (void)loadView
{
    [super loadView];
    
    self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self createPanelWithTitle:self.title];
    [self setupNavigationBar]; 
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self setupGestureRecognizers:self];
}

- (void)viewDidUnload
{
//    popoverController = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - View Actions



@end
