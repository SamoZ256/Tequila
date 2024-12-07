//
//  Color.m
//  Tequila
//
//  Created by Samuliak on 25/11/2024.
//

#import "Common.h"

#define DEFINE_COLOR_GETTER(color, colorCapitalized) \
void tqlColorCreate##colorCapitalized(TqlObject* _Nonnull obj) { \
    obj->impl = [UIColor color##Color]; \
} \

DEFINE_COLOR_GETTER(black, Black)
DEFINE_COLOR_GETTER(darkGray, DarkGray)
DEFINE_COLOR_GETTER(lightGray, LightGray)
DEFINE_COLOR_GETTER(white, White)
DEFINE_COLOR_GETTER(gray, Gray)
DEFINE_COLOR_GETTER(red, Red)
DEFINE_COLOR_GETTER(green, Green)
DEFINE_COLOR_GETTER(blue, Blue)
DEFINE_COLOR_GETTER(cyan, Cyan)
DEFINE_COLOR_GETTER(yellow, Yellow)
DEFINE_COLOR_GETTER(magenta, Magenta)
DEFINE_COLOR_GETTER(orange, Orange)
DEFINE_COLOR_GETTER(purple, Purple)
DEFINE_COLOR_GETTER(brown, Brown)
DEFINE_COLOR_GETTER(clear, Clear)

CGColorRef _Nonnull tqlColorCGColor(TqlObject* _Nonnull obj) {
    return [obj->impl CGColor];
}
