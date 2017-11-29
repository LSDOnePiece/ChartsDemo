//
//  LSDMacroDefinition.h
//  神州锐达
//
//  Created by caomaolufei on 17/3/7.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#ifndef LSDMacroDefinition_h
#define LSDMacroDefinition_h

// iPhone X
#define  LSD_iPhoneX (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)

#define LSD_TabbarHeight     ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) // 适配iPhoneX 底栏高度
// Status bar & navigation bar height. 适配iPhoneX 导航栏高度
#define  LSD_StatusBarAndNavigationBarHeight  (LSD_iPhoneX ? 88.f : 64.f)

// Tabbar safe bottom margin. 设配iphoneX底部视图间隔
#define  LSD_TabbarSafeBottomMargin  (LSD_iPhoneX ? 34.f : 0.f)

#define LSD_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})


#define KMainKeyWindow  [UIApplication sharedApplication].keyWindow

#pragma mark -- 常用宏定义
///对象为空判断
#define isNotEqualNull(obj) ![obj isKindOfClass:[NSNull class]]

///字符串判空
#define VALUE_STRING(valueString) valueString && ![valueString isKindOfClass:[NSNull class]] ?  [valueString description]:@""

///屏幕宽和高
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenBounds [UIScreen mainScreen].bounds

///针对iphone7适配
#define  Scale_Width_i7(obj)  ([UIScreen mainScreen].bounds.size.width/375.0f)*obj
#define  Scale_Height_i7(obj) ([UIScreen mainScreen].bounds.size.height/667.0f)*obj

///iphone5s
#define isIphone5s ScreenWidth <= 320.0

///block弱引用
#define WeakSelf(wself) __weak typeof(self) wself=self

///RGB颜色
#define  RGBColor(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

///偏好设置
#define KUserDefaults  [NSUserDefaults standardUserDefaults]

///bundle
#define KMainBundle [NSBundle mainBundle]

///通知中心
#define KNotificationCenter [NSNotificationCenter defaultCenter]

///加载xib
#define KLoadXibView(obj)  [[[NSBundle mainBundle] loadNibNamed:obj owner:nil options:nil] lastObject]

///打印日志
#ifdef DEBUG
# define LSDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define LSDLog(...)
#endif

///图片资源
#define KImagePre(obj)  [NSString stringWithFormat:@"%@/%@",BaseUrl,obj]
///课件资源
#define KCoursePre(obj)  [NSString stringWithFormat:@"%@/%@",BaseUrl,obj]

///分享地址
#define KSharePre(obj)  [NSString stringWithFormat:@"%@/%@",BaseUrl,obj]
#endif /* LSDMacroDefinition_h */
