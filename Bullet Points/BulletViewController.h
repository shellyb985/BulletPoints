//
//  BulletViewController.h
//  Bullet Points
//
//  Created by Shelly Pritchard on 14/09/17.
//  Copyright © 2017 Shelly Pritchard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BulletViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgBullet;
@property (weak, nonatomic) IBOutlet UILabel *lblBulletPoints;

@property (nonatomic,assign) NSInteger type;

- (IBAction)onClickBackButton:(UIButton *)sender;
@end
