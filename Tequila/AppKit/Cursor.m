//
//  Cursor.m
//  Tequila
//
//  Created by Samuliak on 01/12/2024.
//

#include "Common.h"
#include "ViewController.h"

void tqlCursorHide(void) {
    __tqlPrefersPointerLocked = true;
}

void tqlCursorUnhide(void) {
    __tqlPrefersPointerLocked = false;
}
