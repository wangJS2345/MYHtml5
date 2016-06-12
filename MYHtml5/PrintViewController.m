//
//  PrintViewController.m
//  MYHtml5
//
//  Created by E2-WANGJS-M on 16/6/12.
//  Copyright © 2016年 MY. All rights reserved.
//

#import "PrintViewController.h"

@interface PrintViewController ()<UIPrintInteractionControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *printBtn;

@property (weak, nonatomic) IBOutlet UIView *printView;
@end

@implementation PrintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)printClick:(UIButton *)sender {
    UIPrintInteractionController * controller = [UIPrintInteractionController sharedPrintController];
    if(controller)
    {
        
        controller.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.jobName = @"Preview";
        
        printInfo.orientation = UIPrintInfoOrientationPortrait;
        
        printInfo.outputType = UIPrintInfoOutputGrayscale;
        
        controller.showsPageRange = YES;
        controller.printInfo = printInfo;
        controller.printingItem = [self imageWithView:self.printView];
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
            if (!completed && error)
            {
                NSLog(@"PRINT FAILED: %@", [error description]);
            }
        };
        
        CGRect rect = [(UIView *)sender frame];
        rect = CGRectMake(rect.origin.x, rect.origin.y-5, rect.size.width, rect.size.height);
        [controller presentFromRect:rect inView:[(UIView *)sender superview] animated:YES completionHandler:completionHandler];
    }
}
#pragma mark - UIPrintInteractionControllerDelegate
- (void)printInteractionControllerDidFinishJob:(UIPrintInteractionController *)printInteractionController {
    NSLog(@"finish.....");
}
- (void)printInteractionControllerWillStartJob:(UIPrintInteractionController *)printInteractionController {
    NSLog(@"strat.....");
}
- (void)printInteractionControllerDidPresentPrinterOptions:(UIPrintInteractionController *)printInteractionController {
    NSLog(@"presenr....");
}
- (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
