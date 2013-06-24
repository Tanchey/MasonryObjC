//
//  MasonryWrap.cpp
//  MasonryWrapper
//

#import <Foundation/Foundation.h>
#import "MasonryWrap.h"
#include "MasonryCore.h"
#include <vector>
#include "DiscreteRect.h"

NSArray *vectorDiscreteRectsToNSArray(std::vector<DiscreteRect> rects)
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    
    NSValue * (^convert)(DiscreteRect) = ^(DiscreteRect dr) {
        CGRect r = CGRectMake(
            dr.x, dr.y, dr.width, dr.height
        );
        return [NSValue valueWithRect:r];
    };
    
    for(auto r: rects) {
        [results addObject:convert(r)];
    }

    return results;
}

std::vector<DiscreteRect>nsarrayToDiscreteRectsVector(NSArray *rects)
{
    std::vector<DiscreteRect> results = std::vector<DiscreteRect>();

    DiscreteRect (^convert)(NSValue *) = ^(NSValue *rectValue) {
        CGRect rect = [rectValue rectValue];
        return DiscreteRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    };

    for (NSValue *rect in rects) {
        results.push_back(convert(rect));
    }

    return results;
}

NSArray *masonry(NSUInteger gridWidth, NSArray *photos) {
    return vectorDiscreteRectsToNSArray(masonry((unsigned)gridWidth, nsarrayToDiscreteRectsVector(photos)));
}
