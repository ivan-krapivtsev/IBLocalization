//
//  UIView+IBL10n.h
//  IBLocalization
//
//  Created by Ivan on 16/01/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (IBL10n)
@property IBInspectable BOOL shouldUpercaseText;
@property IBInspectable NSString* l10nKey;
- (void)localize;
@end

NS_ASSUME_NONNULL_END
