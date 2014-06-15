//
//  Mission1CameraView.m
//  EnRoute
//
//  Created by Thomas Verleye on 8/06/14.
//  Copyright (c) 2014 Quinten Delahaye. All rights reserved.
//

#import "Mission1CameraView.h"

@implementation Mission1CameraView

- (id)initWithFrame:(CGRect)frame andPart:(int)part
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSString *imgName = @"";
        if (part < 3) {
            imgName = [NSString stringWithFormat:@"mission1_cameraOverlay%i",part];
        }else{
            imgName = @"mission1_cameraOverlay3";
        }
        UIImage *overlayImg = [UIImage imageNamed:imgName];
        UIImageView *overlay = [[UIImageView alloc]initWithImage:overlayImg];
        [self addSubview:overlay];
        
        CGRect partFrame = CGRectMake(0, 0, 320, 426);
        self.part1 = [[UIImageView alloc]initWithFrame:partFrame];
        [self addSubview:self.part1];
        self.part2 = [[UIImageView alloc]initWithFrame:partFrame];
        [self addSubview:self.part2];
        
        NSString *text = [NSString alloc];
        
        if (part == 1) {
            //tekst
            text = @"Deze foto wordt de inhoud van het kader.";
                        //wees creatief
            NSString *redText = @"Kies iets modern!";
            UILabel *extra = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:redText andFrame:CGRectMake(95, 515, 115, 0) andColor:[UIColor niceRedColor] andTextalignment:NSTextAlignmentLeft];
            [self addSubview:extra];
        } else if (part == 2){
            //tekst
            text = @"Deze foto wordt het kader van de collage.";
            //wees creatief
            NSString *redText = @"Kies een tof patroon!";
            UILabel *extra = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:redText andFrame:CGRectMake(102, 515, 137, 0) andColor:[UIColor niceRedColor] andTextalignment:NSTextAlignmentLeft];
            [self addSubview:extra];
        } else if (part == 3){
            //tekst
            text = @"Deze foto wordt de plaats waar het kader zal hangen.";
            //wees creatief
            NSString *redText = @"Kies iets oud.";
            UILabel *extra = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:redText andFrame:CGRectMake(160, 515, 88, 0) andColor:[UIColor niceRedColor] andTextalignment:NSTextAlignmentLeft];
            [self addSubview:extra];
        } else if (part == 4){
            text = @"Zoek het dichtsbijzijnde standbeeld, beeld deze uit samen met je groep.";
            NSString *title = @"Beeld";
            UILabel *lblTitle = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:title andFrame:CGRectMake(145, 465, 40, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
            
            [self addSubview:lblTitle];
        } else if (part == 5){
            text = @"Neem een foto van een persoon met oude kledij of accessoire.";
            NSString *title = @"Vintage";
            UILabel *lblTitle = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:title andFrame:CGRectMake(135, 465, 50, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
            
            [self addSubview:lblTitle];
        } else if (part == 6){
            text = @"Fotografeer 1 element dat binnenkort foetsie zal zijn.";
            NSString *title = @"Foetsie";
            UILabel *lblTitle = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:title andFrame:CGRectMake(135, 465, 50, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
            
            [self addSubview:lblTitle];
        }
        
        //neem een foto van een persoon met oude kledij of accessoire.
        UILabel *explanation = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:text andFrame:CGRectMake(50, 491, 222, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentLeft];
        [self addSubview:explanation];
        
        if (part < 4) {
            NSString *title = [NSString stringWithFormat:@"foto %i",part];
            UILabel *lblTitle = [UIElementFactory createLabelWithFont:CORKI andSize:20 andText:title andFrame:CGRectMake(145, 465, 40, 0) andColor:[UIColor blackColor] andTextalignment:NSTextAlignmentCenter];
            
            [self addSubview:lblTitle];
            self.back = [UIElementFactory createButtonWithImageName:@"btn_back" andPoint:CGPointMake(20, 20)];
            [self addSubview:self.back];
        } else {
            UIImageView *timerBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timerbg"]];
            timerBg.center = CGPointMake(self.frame.size.width/2, 33);
            [self addSubview:timerBg];
            self.lblTime = [UIElementFactory createLabelWithFont:CORKI andSize:22 andText:@"05:00" andFrame:CGRectMake(0, 0, 60, 0) andColor:[UIColor lightYellowColor] andTextalignment:NSTextAlignmentCenter];
            self.lblTime.frame = CGRectMake(0, 0, 60, 33);
            self.lblTime.center = CGPointMake(self.frame.size.width/2, 33);
            [self addSubview:self.lblTime];
        }
        
        
        self.picture = [UIElementFactory createButtonWithImageName:@"btn_picture" andPoint:CGPointMake(129, 396)];
        [self addSubview:self.picture];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
