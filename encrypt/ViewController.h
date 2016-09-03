//
//  ViewController.h
//  encrypt
//
//  Created by RAHUL'S MAC MINI on 03/09/16.
//  Copyright © 2016 iDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *message;
@property (strong, nonatomic) IBOutlet UITextField *privatekey;
@property (strong, nonatomic) IBOutlet UISwitch *isSwitch;
@property (strong, nonatomic) IBOutlet UITextView *encryptedText;
@property (strong, nonatomic) IBOutlet UITextView *decryptedText;


- (IBAction)encrypt:(UIButton *)sender;
- (IBAction)decrypt:(id)sender;
@end

