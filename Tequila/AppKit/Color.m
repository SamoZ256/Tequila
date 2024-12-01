//
//  Color.m
//  Tequila
//
//  Created by Samuliak on 25/11/2024.
//

#import "Common.h"

void tqlColorYellowCreate(TqlObject* _Nonnull obj) {
    obj->impl = [UIColor yellowColor];
}

CGColorRef _Nonnull tqlColorCGColor(TqlObject* _Nonnull obj) {
    return [obj->impl CGColor];
}
