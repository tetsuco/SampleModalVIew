//
//  ViewController.m
//  SampleModalVIewController
//
//  Created by  on 11/11/04.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // ボタンを設置
    for (int i = 0; i < 16; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(284, 30 + (60 * i), 200, 30);
        btn.tag = i;
        [btn setTitle:[NSString stringWithFormat:@"ModalView%d", i] forState:UIControlStateNormal]; // ボタン通常時のタイトル
        [btn setTitle:@"エラーが出るため無効化" forState:UIControlStateDisabled];    // ボタン無効化時のタイトル
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        // エラー回避のため特定のボタンだけ無効にする
        switch (i) {
            case 7:
            case 11:
            case 15:
                btn.enabled = NO;    // ボタンを無効にする
                break;
            default:
                break;
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


// ボタンアクション
- (void)btnAction:(UIButton*)sender
{
    // ModalViewController生成
    ModalViewController *modalViewController;
    modalViewController = [[ModalViewController alloc]
                           initWithNibName:@"ModalViewController"
                           bundle:nil];
    
    // ビューの動作
    switch (sender.tag) {
        case 0:
        case 1:
        case 2:
        case 3:
            modalViewController.modalPresentationStyle = UIModalPresentationFullScreen;  // 画面を覆う
            break;
        case 4:
        case 5:
        case 6:
        case 7:
            modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;  // ビューの高さ＝画面高さ,幅=デバイスの向き(縦向き)による画面幅
            break;
        case 8:
        case 9:
        case 10:
        case 11:
            modalViewController.modalPresentationStyle = UIModalPresentationFormSheet;  // 画面中央に配置
            break;
        case 12:
        case 13:
        case 14:
        case 15:
            modalViewController.modalPresentationStyle = UIModalPresentationCurrentContext;  // 親と同じビューを維持する
            break;
        default:
            break;
    }
    
    
    // スタイル
    if (sender.tag == 0 || sender.tag == 4 || sender.tag == 8 || sender.tag == 12)
    {
        modalViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // 下から上へ出るスタイル
    }
    else if (sender.tag == 1 || sender.tag == 5 || sender.tag == 9 || sender.tag == 13)
    {
        modalViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal; // 回転して出るスタイル 
    }
    else if (sender.tag == 2 || sender.tag == 6 || sender.tag == 10 || sender.tag == 14)
    {
        modalViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // 浮かびあがってくるスタイル
        
        modalViewController.view.superview.frame = CGRectMake(0, 0, 500, 700);  // サイズ指定
    }
    else if (sender.tag == 3)
    {
        modalViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl; // 下からめくり上げるスタイル
    }
    
    
    // モーダルを表示
    [self presentModalViewController:modalViewController animated:YES];
}


@end
