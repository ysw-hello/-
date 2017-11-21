//
//  MIT License
//
//  Copyright (c) 2014 Bob McCune http://bobmccune.com/
//  Copyright (c) 2014 TapHarmonic, LLC http://tapharmonic.com/
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "THPreviewView.h"

@interface THPreviewView ()

// Listing 7.18

@end

@implementation THPreviewView

+ (Class)layerClass {

    // Listing 7.18

    return nil;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {

    // Listing 7.18

}

- (AVCaptureSession*)session {

    // Listing 7.18

    return nil;
}

- (void)setSession:(AVCaptureSession *)session {

    // Listing 7.18

}

- (AVCaptureVideoPreviewLayer *)previewLayer {

    // Listing 7.18

    return nil;
}

- (void)didDetectCodes:(NSArray *)codes {

    // Listing 7.19

    // Listing 7.20

    // Listing 7.21
}

- (NSArray *)transformedCodesFromCodes:(NSArray *)codes {

    // Listing 7.19

    return nil;
}

- (UIBezierPath *)bezierPathForBounds:(CGRect)bounds {

    // Listing 7.20

    return nil;
}

- (CAShapeLayer *)makeBoundsLayer {

    // Listing 7.20

    return nil;
}

- (CAShapeLayer *)makeCornersLayer {

    // Listing 7.20

    return nil;
}

- (UIBezierPath *)bezierPathForCorners:(NSArray *)corners {

    // Listing 7.21

    return nil;
}

- (CGPoint)pointForCorner:(NSDictionary *)corner {

    // Listing 7.21

    return CGPointZero;
}

@end
