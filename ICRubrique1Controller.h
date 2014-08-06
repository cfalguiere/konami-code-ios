#import "ICModel.h"

@interface ICRubrique1Controller : UIViewController <UITextFieldDelegate> {
@private
    NSArray *kcsuite;
    int kcindex;
}
@property (nonatomic, retain, readonly) NSArray *kcsuite;

- (id)initWithModel:(ICModel*)theModel;

@end
