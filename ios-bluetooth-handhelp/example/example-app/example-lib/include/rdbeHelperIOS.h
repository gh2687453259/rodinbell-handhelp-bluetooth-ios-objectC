#import <Foundation/Foundation.h>

@interface rdbeHelperIOS : NSObject

// - (NSString*)getHelloWorld;
- (BOOL)createReader:(NSString*)nameid;
- (NSString*)callReaderUhf:(NSString*)nameid andParam:(NSString*)param;
- (BOOL)destroyReader:(NSString*)nameid;
- (NSString*)DataTOjsonString:(id)object;
@end
