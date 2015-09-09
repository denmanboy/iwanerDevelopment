//
//  IWUserInfo.h
//  iwanerPro
//
//  Created by liyuanbo on 8/28/15.
//  Copyright (c) 2015 iwaner. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, IPHONE_SIZE_TYPE) {
    
    IPHONE_SIZE_TYPE_4s,
    IPHONE_SIZE_TYPE_5s,
    IPHONE_SIZE_TYPE_6,
    IPHONE_SIZE_TYPE_plus,
};




@interface IWUserInfo : NSObject
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *address;               //地址
@property (nonatomic,copy) NSString *addtime;               //注册时间
@property (nonatomic,copy) NSString *age;                   //年龄
@property (nonatomic,copy) NSString *birthdate;             //生日
@property (nonatomic,copy) NSString *city;                  //城市
@property (nonatomic,copy) NSString *country;               //国家
@property (nonatomic,copy) NSString *dis;                   //pc第2版个人描述（个性签名）
@property (nonatomic,copy) NSString *email;                 //邮箱
@property (nonatomic,copy) NSString *fullname;              //全名
@property (nonatomic,copy) NSString *head_photo;            //头像
@property (nonatomic,copy) NSString *is_daren;               //达人
@property (nonatomic,copy) NSString *is_xingbiao;            //星标
@property (nonatomic,copy) NSString *job;                    //职业
@property (nonatomic,copy) NSString *looknum;                //访问量
@property (nonatomic,copy) NSString *nickname;               //****昵称
@property (nonatomic,copy) NSString *password;               //****密码
@property (nonatomic,copy) NSString *phone;                  //手机号
@property (nonatomic,copy) NSString *province;               //省份
@property (nonatomic,copy) NSString *qq;                     //qq号
@property (nonatomic,copy) NSString *resume;                 //pc第2版个人描述（个性签名）
@property (nonatomic,copy) NSString *role;                   //角色
@property (nonatomic,copy) NSString *school;                 //学校
@property (nonatomic,copy) NSString *sex;                    //性别
@property (nonatomic,copy) NSString *signature;              //个性标签
@property (nonatomic,copy) NSString *uid;                    //用户id
@property (nonatomic,copy) NSString *username;               //用户手机号
@property (nonatomic,copy) NSString *weiadress;              //微信地址
@property (nonatomic,copy) NSString *weixinnum;              //微信号




@property (nonatomic) IPHONE_SIZE_TYPE iphoneSizeType;



+ (IWUserInfo *)sharedIWUserInfo;

@end
