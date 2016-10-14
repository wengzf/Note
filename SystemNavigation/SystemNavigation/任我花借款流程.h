//
//  任我花借款流程.h
//  SystemNavigation
//
//  Created by 翁志方 on 16/8/2.
//  Copyright © 2016年 翁志方. All rights reserved.
//


大额借款
1. 申请借款         LMSApplyForWithdrawController
    借多少钱
    分期
    服务费
    借款用途


2. 实名认证         LMSAuthenticationViewController
    上传身份证正面
    上传身份证反面
    芝麻信用分
    绑定银行卡
            上传身份证图片接口
            SharedLoanModel.applyLoan.idcard_key = objectKey;
            SharedLoanModel.smallApplyLoan.idcard_key = objectKey;

            SharedLoanModel.applyLoan.idcard_back_key = objectKey;
            SharedLoanModel.smallApplyLoan.idcard_back_key = objectKey;


3. 添加通讯录页面          LMSPettyContactsController
    老师，舍友，父母，地址

4. 活体识别

5. 图片认证                 LMSPhotoCertificationViewController

            上传图片接口      获得上传图片的key
            加载宣誓词 接口
                            宣誓词
                            视频url
                            视频图片
                            最大时间

6. 视频认证             LMSVideoCertificationViewController
            视频上传接口 promise_key


7. 借款确认页面
                    LMSLoanEnsureViewController



小额借款
1. 申请借款

2. 实名认证

3. 添加通讯录页面

4. 活体识别

5. 图片认证
        上传图片接口      获得上传图片的key
        加载宣誓词 接口
        宣誓词
        视频url
        视频图片
        最大时间

6. 视频认证
        视频上传接口 promise_key


7. 借款确认页面





商品分期

1. 商品信息

2. 实名认证

3. 活体识别


5. 图片认证

6. 视频认证

7. 借款确认页面






借款进入对应流程中时， 设置对应页面步骤

并且保存 SharedLoanModel

借款成功后，清除保存在硬盘的SharedLoanModel



小额 大额 分期不同商品， 每次点击都清理SharedLoanModel









