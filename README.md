# rodinbell-handhelp-bluetooth-ios-objectC
rodinbell Bluetooth handhelp ios



## 1. init a Reader : 
        self.devname = @"rodinbelldev";
        self.rdbeHelper = [rdbeHelperIOS new];
        [self.rdbeHelper createReader:self.devname];


## 2. connect Reader : 
        NSDictionary*json2 = @{@"method":@"connectDevice"};
        NSString* str = [self.rdbeHelper DataTOjsonString:json2];
        NSString* connetstr =[self.rdbeHelper callReaderUhf:self.devname andParam:str];
        

## 3. get firmware info :
        NSDictionary*jsonfirm = @{@"method":@"getFirmwareVersion"};
        NSString* jsonfirmstr = [self.rdbeHelper DataTOjsonString:jsonfirm];
        NSString* firmstr =[self.rdbeHelper callReaderUhf:self.devname andParam:jsonfirmstr];

## 4. inventory : 
        NSDictionary*jsoninv = @{@"method":@"customInventory"};
        NSString* jsoninvstr = [self.rdbeHelper DataTOjsonString:jsoninv];
        NSString* invstr =[self.rdbeHelper callReaderUhf:self.devname andParam:jsoninvstr];

## 5. close : 
        [self.rdbeHelper destroyReader:self.devname];

 


![image](test.png)    ![image](test2.png)  