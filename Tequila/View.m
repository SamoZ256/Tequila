//
//  View.m
//  Tequila
//
//  Created by Samuliak on 25/11/2024.
//

#include "View.h"

@interface __TqlView ()

@end

@implementation __TqlView {
    TqlObject* obj;
}

- (instancetype)initWithObject:(TqlObject*)obj frame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self->obj = obj;
    obj->impl = self;
    
    return self;
}

- (Class)layerClass {
    return g_context.viewGetLayerClassCallback(self->obj);
}

@end

void tqlViewCreate(TqlObject* _Nonnull obj, CGRect frame) {
    (void)[[__TqlView alloc] initWithObject:obj frame:frame];
}

CALayer* _Nonnull tqlViewGetLayer(TqlObject* _Nonnull obj) {
    return [obj->impl layer];
}

void tqlViewSetLayer(TqlObject* _Nonnull obj, CALayer* _Nonnull layer) {
    if ([[obj->impl layer] class] != [layer class]) {
        // TODO: recreate the whole view
        NSLog(@"error: cannot change view's layer");
    }
    
    // TODO: copy layer properties
}
