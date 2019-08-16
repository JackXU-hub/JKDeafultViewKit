//
//  JKViewController.m
//  JKDeafultView
//
//  Created by daquan on 08/15/2019.
//  Copyright (c) 2019 daquan. All rights reserved.
//

#import "JKViewController.h"
#import <JKDefaultView.h>
@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    JKDefaultView *defV = [JKDefaultView defaultView:@"wwww" withTitle:@"eeeeee"];
    [defV showOnView:self.view type:DefeatViewNoData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
