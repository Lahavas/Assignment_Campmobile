//
//  ImageZoomViewController.m
//  Assignment
//
//  Created by USER on 2017. 11. 15..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "ImageZoomViewController.h"

#define MAX_ZOOM_SCALE 2.0
#define MIN_ZOOM_SCALE 1.0

@interface ImageZoomViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (assign, nonatomic, getter=isZoomFromDoubleTap) BOOL zoomFromDoubleTap;

@end

@implementation ImageZoomViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *scrolledImage = [UIImage imageNamed:@"scrollImage"];
    [self.imageView setImage:scrolledImage];
    
    [self.scrollView setMaximumZoomScale:MAX_ZOOM_SCALE];
    [self.scrollView setMinimumZoomScale:MIN_ZOOM_SCALE];
    
    [self.scrollView setDelegate:self];
    
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    [doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    
    [self.scrollView addGestureRecognizer:doubleTapGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self initZoomScale];
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)handleDoubleTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    if ([self isZoomFromDoubleTap]) {
        [self initZoomScale];
    } else {
        [self setZoomFromDoubleTap:YES];
        [self.scrollView setZoomScale:MAX_ZOOM_SCALE animated:YES];
    }
}

#pragma mark - Private Methods

- (void)initZoomScale {
    [self setZoomFromDoubleTap:NO];
    [self.scrollView setZoomScale:MIN_ZOOM_SCALE animated:YES];
}

#pragma mark - Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [self setZoomFromDoubleTap:NO];
}

@end
