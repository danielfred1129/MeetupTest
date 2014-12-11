//
//  MainViewVC.m
//  Meetup_Test
//
//  Created by Daniel on 12/11/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "MainViewVC.h"
#import "ArticleDetailVC.h"
#import "ArticleTableViewCell.h"

@interface MainViewVC ()

@end

@implementation MainViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

// http://showbizdaily.redux.s3.amazonaws.com/wp-content/uploads/2014/07/Irina-shayk-Maxim-topless.jpg

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArticleTableViewCell";
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ArticleTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell.lblTitle setText:@"Title"];
    [cell.lblTitle setFrame:CGRectMake(19, 10, 200, 50)];
    [cell.lblDescription setText:@"Description"];
    NSURL *imageURL = [NSURL URLWithString:@"http://showbizdaily.redux.s3.amazonaws.com/wp-content/uploads/2014/07/Irina-shayk-Maxim-topless.jpg"];
    [cell setImageURL:imageURL];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleDetailVC *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleDetailVC"];
    [self.navigationController pushViewController:viewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
