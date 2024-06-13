//
//  ViewController.m
//  example-app

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *helloWorldLabel;
@property (strong, nonatomic) NSString* devname;
@property (strong, nonatomic) rdbeHelperIOS *rdbeHelper;

@property (weak, nonatomic) IBOutlet UIButton *conbt;

@property (weak, nonatomic) IBOutlet UIButton *getfrimbt;

@property (weak, nonatomic) IBOutlet UIButton *invenbt;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.devname = @"rodinbelldev";
    self.rdbeHelper = [rdbeHelperIOS new];
    self.helloWorldLabel.text = self.devname ;

    [self.rdbeHelper createReader:self.devname];

    [self.conbt addTarget:self action:@selector(conBtnClick:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.getfrimbt addTarget:self action:@selector(getFirmBtnClick:)
                forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.invenbt addTarget:self action:@selector(inventoryBtnClick:)
                forControlEvents:UIControlEventTouchUpInside];

}

- (void)conBtnClick:(UIButton *)btn
{
    NSLog(@"conBtnClick clicked.");

    NSDictionary*json2 = @{@"method":@"connectDevice"};
    NSString* str = [self.rdbeHelper DataTOjsonString:json2];
    NSString* connetstr =[self.rdbeHelper callReaderUhf:self.devname andParam:str];
    
    NSLog(@"connetstr===: %@", connetstr);
    self.helloWorldLabel.text = connetstr ;

}

- (void)getFirmBtnClick:(UIButton *)btn
{
    NSLog(@"getFirmBtnClick clicked.");
    NSDictionary*jsonfirm = @{@"method":@"getFirmwareVersion"};
    NSString* jsonfirmstr = [self.rdbeHelper DataTOjsonString:jsonfirm];
    NSString* firmstr =[self.rdbeHelper callReaderUhf:self.devname andParam:jsonfirmstr];
    NSLog(@"firmstr===: %@", firmstr);
    self.helloWorldLabel.text = firmstr ;

}

- (void)inventoryBtnClick:(UIButton *)btn
{
    NSLog(@"inventoryBtnClick clicked.");
    NSDictionary*jsoninv = @{@"method":@"customInventory"};
    NSString* jsoninvstr = [self.rdbeHelper DataTOjsonString:jsoninv];
    NSString* invstr =[self.rdbeHelper callReaderUhf:self.devname andParam:jsoninvstr];
    NSLog(@"invstr===: %@", invstr);
    self.helloWorldLabel.text = invstr ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
