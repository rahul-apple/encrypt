//
//  ViewController.m
//  encrypt
//
//  Created by RAHUL'S MAC MINI on 03/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import "ViewController.h"
#import "FBEncryptorAES.h"
#import "NSData+Base64.h"
@interface ViewController (){
    NSString *IV_String;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)encrypt:(UIButton *)sender {
    NSData *IV_Data = [FBEncryptorAES generateIv];
    IV_String = [IV_Data base64EncodedString];
    self.privatekey.text = [NSString stringWithFormat:@"%@%@",self.privatekey.text,IV_String];
    self.encryptedText.text = [FBEncryptorAES encryptBase64String:self.message.text
                                                    keyString:self.privatekey.text
                                                separateLines:[self.isSwitch isOn]];
    NSLog(@"encrypted: %@", self.encryptedText.text);
    /*NSString *msg =
    [self.message.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSData *IV_Data = [FBEncryptorAES generateIv];
    IV_String = [IV_Data base64EncodedString];
    NSLog(@"IV String : %@",IV_String);
    NSData *messageData = [NSData dataFromBase64String:msg];
    NSData *keyData = [self.privatekey.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptedData = [FBEncryptorAES encryptData:messageData key:keyData iv:IV_Data];
    NSString *encryptedString = [encryptedData base64EncodedStringWithSeparateLines:true];
    self.encryptedText.text = encryptedString;*/
}

- (IBAction)decrypt:(id)sender {
    NSString* msg = [FBEncryptorAES decryptBase64String:self.encryptedText.text
                                              keyString:self.privatekey.text];
    
    if (msg) {
        self.decryptedText.text = msg;
        NSLog(@"decrypted: %@", msg);
    } else {
        self.decryptedText.text = @"(failed to decrypt)";
    }
    /*NSData *encryptedData = [NSData dataFromBase64String:self.encryptedText.text];
    NSData *IV_DATA = [NSData dataFromBase64String:IV_String];
    NSData *keyData = [self.privatekey.text dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decyptedData = [FBEncryptorAES decryptData:encryptedData key:keyData iv:IV_DATA];
    NSString *msg = [decyptedData base64EncodedStringWithSeparateLines:true];
    NSString* message =
    [msg stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (message) {
        self.decryptedText.text = message;
        NSLog(@"decrypted: %@", message);
    } else {
        self.decryptedText.text = @"(failed to decrypt)";
    }*/
    
    
}
@end
