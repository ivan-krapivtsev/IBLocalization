//
//  UIView+IBL10n.m
//  IBLocalization
//
//  Created by Ivan on 16/01/2019.
//

#import "UIView+IBL10n.h"
#import <objc/runtime.h>

@implementation UIView (IBL10n)
@dynamic shouldUpercaseText;
@dynamic l10nKey;

- (void)setShouldUpercaseText:(BOOL)value \
{ 
    objc_setAssociatedObject(self, @selector(shouldUpercaseText), @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)shouldUpercaseText
{
    return [objc_getAssociatedObject(self, @selector(shouldUpercaseText)) boolValue];
}

- (void)setL10nKey:(NSString*)value
{
    objc_setAssociatedObject(self, @selector(l10nKey), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString*)l10nKey
{
    return objc_getAssociatedObject(self, @selector(l10nKey));
}

- (void)localize
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel*)self;
        if (label.l10nKey) {
            NSString *str = NSLocalizedString(label.l10nKey, "");
            label.text = label.shouldUpercaseText ? [str uppercaseString] : str;
        }
        return;
    } else if ([self isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton*)self;
        if (button.l10nKey) {
            NSString *str = NSLocalizedString(button.l10nKey, "");
            str = button.shouldUpercaseText ? [str uppercaseString] : str;
            [button setTitle:str
                    forState:UIControlStateNormal];

        }
        return;
    }

    for (UIView *subview in self.subviews) {
        [subview localize];
    }
}

@end

