//
//  BulletPointListVC.h
//  Bullet Points
//
//  Created by Shelly Pritchard on 14/09/17.
//  Copyright © 2017 Shelly Pritchard. All rights reserved.
//

#import "BulletPointListVC.h"
#import "BulletViewController.h"
#import "BulletListCell.h"

@interface BulletPointListVC ()<UITableViewDelegate,UITableViewDataSource> {
    NSArray *arrBulletType;
}

@end

@implementation BulletPointListVC


- (void)viewDidLoad {
    [super viewDidLoad];
    arrBulletType = [NSArray arrayWithObjects:
                     @"•",
                     @">",
                     @"-",
                     @"*",
                     @"+",
                     @"o",
                     @"x",
                     @"1. 2. 3. ...",
                     @"1) 2) 3)...",
                     @"Roman Numbers",
                     nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return arrBulletType.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"BulletListCell";
    BulletListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[BulletListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell.lblBulletTitle setText:[arrBulletType objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self navigateToBulletPointViewController:indexPath.row];
}

- (void)navigateToBulletPointViewController:(NSInteger)type {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];

    BulletViewController *bulletViewController = [storyboard instantiateViewControllerWithIdentifier:@"BulletViewController"];
    bulletViewController.type = type;
    [self.navigationController pushViewController:bulletViewController animated:YES];
    
}


@end
