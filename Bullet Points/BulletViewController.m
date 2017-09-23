//
//  BulletViewController.m
//  Bullet Points
//
//  Created by Shelly Pritchard on 14/09/17.
//  Copyright © 2017 Shelly Pritchard. All rights reserved.
//

#import "BulletViewController.h"

@interface BulletViewController ()

@end

@implementation BulletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *arrPoints = [NSArray arrayWithObjects:
                          @"Augmented reality. With Augmented reality, apps can deliver immersive, engaging experiences that seamlessly blend realistic virtual objects with the real world.",
                         
                         @"Bolder navigation. To improve clarity and context when browsing and searching, apps can implement navigation bars that include large, bold titles.",
                         
                         @"Clearer icons. Filled-in shapes and thicker stroke weights keep icons minimal, while improving contrast. See Custom Icons and System Icons.",
                         
                         @"Drag and drop. Drag and drop allows people to use a single finger to move selected photos, text, and other content from one location to another—and even between apps on iPad.",
                         
                         @"Face ID and Touch ID. Your app can integrate with the system's biometric security features to offer secure, familiar authentication that people trust.",
                         
                         @"Near field communication. Apps running on supported devices can wirelessly read data from electronic tags attached to real-world objects.",
                         
                         @"Safe area layout guides. Adhering to the system's safe area ensures appropriate insetting of content within layouts and prevents content from underlapping the status bar, navigation bar, toolbar, and tab bar.",
                         
                         @"Typographic changes. Increased text sizes and weights help with readability throughout the system. The system also offers a range of larger type sizes—in addition to standard dynamic type sizes—for users with accessibility needs.", nil];
    
    
    [self.lblBulletPoints setAttributedText:[self getBulletPointString:arrPoints]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableAttributedString*)getBulletPointString:(NSArray *)arrPoints {
    
    
    NSString *strPoints = @"Bullet Points";
    NSString *tempStr = @"";

    
    if (self.type == 0) {
        tempStr = [NSString stringWithFormat:@"\n•\t"];
    }
    else if (self.type == 1) {
        tempStr = [NSString stringWithFormat:@"\n>\t"];
    }
    else if (self.type == 2) {
        tempStr = [NSString stringWithFormat:@"\n-\t"];
    }
    else if (self.type == 3) {
        tempStr = [NSString stringWithFormat:@"\n*\t"];
    }
    else if (self.type == 4) {
        tempStr = [NSString stringWithFormat:@"\n+\t"];
    }
    else if (self.type == 5) {
        tempStr = [NSString stringWithFormat:@"\no\t"];
    }
    else if (self.type == 6) {
        tempStr = [NSString stringWithFormat:@"\nx\t"];
    }
    else {
        tempStr = [NSString stringWithFormat:@"\n•\t"];
    }
    
    
    for (int i=0; i<arrPoints.count; i++) {
        
        if (self.type == 7) {
            tempStr = [NSString stringWithFormat:@"\n%i.\t",i];
        }
        else if (self.type == 8) {
            tempStr = [NSString stringWithFormat:@"\n%i)\t",i];
        }
        else if (self.type == 9) {
            tempStr = [NSString stringWithFormat:@"\n%@\t",[self getRomanNumberForNumber:i+1]];

        }
        
        
        NSString *str =  [arrPoints objectAtIndex:i];
        strPoints = [strPoints stringByAppendingString:tempStr];
        strPoints = [strPoints stringByAppendingString:str];
    }
    
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:strPoints];
    
    NSMutableParagraphStyle *paragraphStyle;
    paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setTabStops:@[[[NSTextTab alloc] initWithTextAlignment:NSTextAlignmentLeft location:15 options:nil]]];
    [paragraphStyle setDefaultTabInterval:15];
    [paragraphStyle setFirstLineHeadIndent:0];
    [paragraphStyle setHeadIndent:15];
    
    [string addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:NSMakeRange(0,[string length])];
    
    
    
    return string;
}


- (NSString*)getRomanNumberForNumber:(int)num {

    if (num < 0 || num > 9999) { return @""; } // out of range
        
        NSArray *r_ones = [NSArray arrayWithObjects:@"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX", nil];
        NSArray *r_tens = [NSArray arrayWithObjects:@"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX",@"LXXX", @"XC", nil];
        NSArray *r_hund = [NSArray arrayWithObjects:@"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC",@"DCCC", @"CM", nil];
        NSArray *r_thou = [NSArray arrayWithObjects:@"M", @"MM", @"MMM", @"MMMM", @"MMMMM", @"MMMMMM", @"MMMMMMM", @"MMMMMMMM", @"MMMMMMMMM", nil];
        // real romans should have an horizontal   __           ___           _____
        // bar over number to make x 1000: 4000 is IV, 16000 is XVI, 32767 is XXXMMDCCLXVII...
        
        int thou = num / 1000;
        int hundreds = (num -= thou*1000) / 100;
        int tens = (num -= hundreds*100) / 10;
        int ones = num % 10; // cheap %, 'cause num is < 100!
        
        return [NSString stringWithFormat:@"%@%@%@%@",
                thou ? [r_thou objectAtIndex:thou-1] : @"",
                hundreds ? [r_hund objectAtIndex:hundreds-1] : @"",
                tens ? [r_tens objectAtIndex:tens-1] : @"",
                ones ? [r_ones objectAtIndex:ones-1] : @""];
    
    return @"";
}

- (IBAction)onClickBackButton:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:NO];
}
@end
