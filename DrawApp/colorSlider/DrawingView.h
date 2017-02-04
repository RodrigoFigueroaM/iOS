//
//  DrawingView.h
//  colorSlider
//
//  Created by Rodrigo monroy on 1/11/17.
//  Copyright © 2017 RodrigoFigueroa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingView : UIView

@property (nonatomic) CGContextRef context;
@property UIColor * brushColor;
@property CGFloat  lineWidth;
@property NSMutableArray * paths;
@end
