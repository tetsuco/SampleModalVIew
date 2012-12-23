//
//  ModalViewController.m
//  SampleModalVIewController
//
//  Created by  on 11/11/04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // 背景色
    self.view.backgroundColor = [UIColor greenColor];
    
    // ボタン設置
    UIButton *modalBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    modalBtn.frame = CGRectMake(0, 0, 100, 50);
    modalBtn.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);  // 画面中央表示
    [modalBtn setTitle:@"閉じる" forState:UIControlStateNormal];
    [modalBtn addTarget:self action:@selector(modalBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modalBtn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


// ボタンアクション
- (void)modalBtnAction:(UIButton*)sender
{
    // モーダルを非表示
    [self dismissModalViewControllerAnimated:YES];
}


@end
