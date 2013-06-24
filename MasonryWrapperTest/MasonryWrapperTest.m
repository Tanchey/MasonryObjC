//
//  MasonryWrapperTest.m
//  MasonryWrapperTest
//

#import "MasonryWrapperTest.h"
#import "MasonryWrap.h"

@implementation MasonryWrapperTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSArray *photos = @[[NSValue valueWithCGRect:(CGRect){0, 0, 1, 1}]
    , [NSValue valueWithCGRect:(CGRect){0, 0, 2, 1}]
    , [NSValue valueWithCGRect:(CGRect){0, 0, 1, 5}]
    , [NSValue valueWithCGRect:(CGRect){0, 0, 2, 6}]
    , [NSValue valueWithCGRect:(CGRect){0, 0, 1, 3}]
    , [NSValue valueWithCGRect:(CGRect){0, 0, 1, 2}]
    ];
    NSArray *rects =  @[[NSValue valueWithCGRect:(CGRect){0, 0, 2, 1}]
    , [NSValue valueWithCGRect:(CGRect){0, 1, 2, 1}]
    , [NSValue valueWithCGRect:(CGRect){0, 2, 2, 5}]
    , [NSValue valueWithCGRect:(CGRect){0, 7, 2, 6}]
    , [NSValue valueWithCGRect:(CGRect){0, 13, 1, 3}]
    , [NSValue valueWithCGRect:(CGRect){1, 13, 1, 2}]
    ];
    NSArray *layouted = masonry(2, photos);
    if (![rects isEqualToArray:layouted]) {
        STFail(@"Is not layouted correctly\nexpected:\n%@\ncurrent:\n%@\n", rects, layouted);
    }
}

@end
