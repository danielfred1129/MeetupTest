//
//  ArticleDetailVC.m
//  Meetup_Test
//
//  Created by Daniel on 12/11/14.
//  Copyright (c) 2014 Daniel. All rights reserved.
//

#import "ArticleDetailVC.h"
#import "AFNetworking.h"

@interface ArticleDetailVC ()

@end

@implementation ArticleDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *imageURL = [NSURL URLWithString:@"http://showbizdaily.redux.s3.amazonaws.com/wp-content/uploads/2014/07/Irina-shayk-Maxim-topless.jpg"];
    [self.imageView setImageWithURL:imageURL placeholderImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setImageURL:(NSURL*)imageURL
{
    [self.imageView cancelImageRequestOperation];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:imageURL];
    [self.imageView setImageWithURLRequest:urlRequest
                              placeholderImage:nil
                                       success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                           self.imageView.image = image;
                                           if(request != nil && response != nil)
                                           {
                                               self.imageView.alpha = 0.0;
                                               [UIView animateWithDuration:0.5 animations:^{
                                                   self.imageView.alpha = 1.0;
                                               }];
                                           }
                                       } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                           NSLog(@"OKO");
                                       }];
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
