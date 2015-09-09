//
//  PrefectInfoViewController.m
//  iwanerPro
//
//  Created by MobbyDeveloper on 15/8/2.
//  Copyright (c) 2015年 iwaner. All rights reserved.
//

#import "PrefectInfoViewController.h"
#import "PersonalityViewController.h"
#import "LeisureSportsViewController.h"

@interface PrefectInfoViewController ()

@end

@implementation PrefectInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.manOrWoman = @"1";

    self.headImage = [UIImage imageNamed:@"man.jpg"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews
{
    _userHeaderImgBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _userHeaderImgBtn.layer.borderWidth = 3;
    _userHeaderImgBtn.layer.masksToBounds = YES;
    _userHeaderImgBtn.layer.shadowRadius = 1;
    _userHeaderImgBtn.layer.shadowColor = [UIColor whiteColor].CGColor;
    _userHeaderImgBtn.layer.cornerRadius = _userHeaderImgBtn.frame.size.width/2;
}



- (IBAction)gotoSelectPersonalTitle
{
    
    PersonalityViewController *personalityVC = [[PersonalityViewController alloc]init];
    [self.navigationController pushViewController:personalityVC animated:YES];
    
}


- (IBAction)gotoSelectPersonHobby
{
    
    
    LeisureSportsViewController *leisureSportVC = [[LeisureSportsViewController alloc]init];
    [self.navigationController pushViewController:leisureSportVC animated:YES];
}



- (IBAction)clickFinish:(id)sender
{
   
    
    _userNameTextfield.text = @"leevaboo";
    _personalityLable.text = @"互联网/计算机";
    NSString *labels = @"设计,产品狗";
    NSString *industry = @"互联网/计算机";
    NSString *hobby = @"游泳,寒冰,台球";
    NSString *address = @"北京市朝阳区";
    NSString *dis = @"爱睡觉";

    [[HttpEngine sharedHttpEngine] complementUserInfoUsername:_userNameTextfield.text
                                                          dis:dis
                                                          sex:self.manOrWoman
                                                     industry:industry
                                                        hobby:hobby
                                                          img:_headImage
                                                        label:labels
                                                      address:address
                                        onCompletionHandler:^(MKNetworkOperation *completedOperation){
                                              
                                              NSDictionary *dic = [completedOperation responseJSON];
                                            
                                              NSLog(@"cdc=====1===%@",dic);
                                              
                                          } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                                              
                                              
                                            NSDictionary *dic = [completedOperation responseJSON];
                                              NSLog(@"dddd====3====%@",dic);
                                              
                                              
                                          }];
    
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark 上传头像
- (IBAction)clickUserHeaderImg:(id)sender

{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照",@"相册选择", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    
    [actionSheet showInView:self.view];
}


#pragma mark 选择性别

- (IBAction)clickSexBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.selected) {
        self.manOrWoman = @"1";
        [btn setImage:[UIImage getPathImageWithName:@"登录注册_滑块-男"] forState:UIControlStateNormal];
    }else {
        self.manOrWoman = @"0";
        [btn setImage:[UIImage getPathImageWithName:@"登录注册_滑块-女"] forState:UIControlStateNormal];

    }
    
    btn.selected = !btn.selected;
}




//- (IBAction)clickPersonalityLable:(id)sender
//{
////    PersonalityViewController *personalityVC = [[PersonalityViewController alloc]init];
////    [self.navigationController pushViewController:personalityVC animated:YES];
//    
//}
//
//
//- (IBAction)clickHobbyBtn:(id)sender
//{
////    LeisureSportsViewController *leisureSportVC = [[LeisureSportsViewController alloc]init];
////    [self.navigationController pushViewController:leisureSportVC animated:YES];
//    
//}



- (IBAction)clickMapBtn:(id)sender
{
    
    
}



#pragma mark -UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            //            NSLog(@"打开系统照相机");
            
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                //设置UIImagePickerController的代理，同时要遵循UIImagePickerControllerDelegate，UINavigationControllerDelegate协议
                picker.allowsEditing = YES;
                //设置拍照之后图片是否可编辑，如果设置成可编辑的话会在代理方法返回的字典里面多一些键值。PS：如果在调用相机的时候允许照片可编辑，那么用户能编辑的照片的位置并不包括边角。
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;//UIImagePicker选择器的类型，UIImagePickerControllerSourceTypeCamera调用系统相机
                [self presentViewController:picker animated:YES completion:nil];
                
            }
            else{
                //如果当前设备没有摄像头
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"哎呀，当前设备没有摄像头。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            break;
        }
        case 1:
        {
            //            NSLog(@"打开系统图片库");
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            {
                UIImagePickerController* picker = [[UIImagePickerController alloc]init];
                picker.delegate = self;
                picker.allowsEditing = YES;//是否可以对原图进行编辑
                
                //打开相册选择照片
                picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentViewController:picker animated:YES completion:nil];
            }
            else
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"图片库不可用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            break;
        }
            
        case 2:
        {
            NSLog(@"取消");
            break;
        }
        default:
            break;
    }
}



#pragma mark - UIImagePickerControllerDelegate
#pragma mark - 拍照/选择图片结束
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"如果允许编辑%@",info);//picker.allowsEditing= YES允许编辑的时候 字典会多一些键值。
    //获取图片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];//原始图片
    //    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];//编辑后的图片
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);//把图片存到图片库
        
    }else{
        
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    

    
    [self.userHeaderImgBtn setImage:image forState:UIControlStateNormal];
    self.headImage = image;
    
    //    [self uploadHeadimgWithImg:image];
}





@end
