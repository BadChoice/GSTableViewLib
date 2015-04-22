//
//  MainExampleViewController.h
//  GSTableViewLib
//
//  Created by MACJordi on 27/2/15.
//  Copyright (c) 2015 Gloobus Studio. All rights reserved.
//

#import "GSTableViewController.h"
#import "SampleModelWithDetailInfo.h"

@interface MainExampleViewController : GSTableViewController{

}

@property (strong,nonatomic) SampleModel* sampleModel;
@property (strong,nonatomic) SampleModel* selectModel;
@property (strong,nonatomic) SampleModelWithDetailInfo *sampleModelWithInfo;
@end


