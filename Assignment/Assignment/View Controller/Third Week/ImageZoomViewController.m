//
//  ImageZoomViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 15..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ImageZoomViewController.h"

#define MAX_ZOOM_SCALE 3.0
#define MIN_ZOOM_SCALE 0.5

#define DOUBLE_TAP_MAX_ZOOM_SCALE 2.0
#define DEFAULT_ZOOM_SCALE 1.0

@interface ImageZoomViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) UITapGestureRecognizer *doubleTapGestureRecognizer;

@end

@implementation ImageZoomViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *scrolledImage = [UIImage imageNamed:@"scrollImage"];
    [self.imageView setImage:scrolledImage];
    
    [self.scrollView setMaximumZoomScale:MAX_ZOOM_SCALE];
    [self.scrollView setMinimumZoomScale:MIN_ZOOM_SCALE];
    
    [self.scrollView setContentSize:self.imageView.frame.size];
    
    [self.scrollView setDelegate:self];
    
    self.doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [self.doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    
    [self.scrollView addGestureRecognizer:self.doubleTapGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.scrollView setZoomScale:DEFAULT_ZOOM_SCALE animated:YES];
}

- (void)dealloc {
    [self.scrollView removeGestureRecognizer:self.doubleTapGestureRecognizer];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)handleDoubleTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    if (self.scrollView.zoomScale != 1.0) {
        [self.scrollView setZoomScale:DEFAULT_ZOOM_SCALE animated:YES];
    } else {
        [self.scrollView setZoomScale:DOUBLE_TAP_MAX_ZOOM_SCALE animated:YES];
    }
}

#pragma mark - Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

@end
