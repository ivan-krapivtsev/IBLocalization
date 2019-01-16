//
//  IVKViewController.m
//  IBLocalization
//
//  Created by f.a.l.c.o.n@mail.ru on 01/16/2019.
//  Copyright (c) 2019 f.a.l.c.o.n@mail.ru. All rights reserved.
//

#import "IVKViewController.h"
#import <IBLocalization/UIView+IBL10n.h>

@interface IVKViewController ()

@end

@implementation IVKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view localize];
}

@end
