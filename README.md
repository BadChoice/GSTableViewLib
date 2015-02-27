# GSTableViewLib
An easy and fast way to create UITableViewControllers with live models update


##Insallation  

####Using pods  
```
pod 'GSTableViewLib', :git => 'https://github.com/BadChoice/GSTableViewLib.git'  
```

####Manual  
Download the source and copy the GSTableViewLib folder into your project  

   
     

##Usage  

Just extend ```GSTableViewController``` and only add the ```setup``` method

```
-(void)setup{
	[super setup];

	GSTableViewSection* firstSection  = [[GSTableViewSection alloc] init];
	firstSection.header = @"First section";

	[firstSection.cells addObject:[GSSwitchCell	cellWithText:@"Enabled"
									andObject:self.sampleModel
									andKey:@"enabled"]];


	GSTableViewSection* secondSection = [[GSTableViewSection alloc] init];
	secondSection.header = @"Second section";

	[secondSection.cells addObject:[GSSelectCell cellWithText:@"Select string"
													andObject:self.sampleModel
														andKey:@"select"
													andSelect:@[@"Amazing",@"Great",@"Good",@"Normal",@"Poor",@"Shit"]
	]];

	[self.sections addObjects:firstSection,secondSection,nil];
}
```
   
Check the sample project for a more detailed example   
   
#####Available cell types:   

```GSDateCell```   
```GSLabelCell```   
```GSNumberCell```   
```GSFloatCell```   
```GSTextFieldCell```   
```GSSwitchCell```   
```GSStepperCell```   
```GSSegmentedCell```   
```GSDateCell```   
```GSDetailCell```   
```GSSelectCell```    
```GSButtonCell```      