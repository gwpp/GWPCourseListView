# GWPKit
这是一个常用的组件库，里面包含了：
* GWPSliderViewController       : 侧滑控制器

* GWPBaseCellModel              : 可用作UITableView、UICollectionView的Cell的数据模型

* GWPDeviceModel                : 可按设备屏幕大小判别设备，iPhone4(s)？iPhone5(s)？iPhone6(s)？iPhone6(s)plus？、iPad？

* GWPGIFView                    : 可用于加载GIF图片

* GWPLog                        : 包含几个自定义的打印函数，有NSLog的替代函数、打印CGRect的函数、打印CGSize的函数、打印CGPoint的函数等，这些函数有一个共同的特点，那就是在正常的打印时可以同时打印出打印语句在哪个类？哪个函数？哪一行？且只会在Debug模式打印，在Release模式下无任何打印

* GWPMacro                      : 通过RGBA创建颜色的宏，产生随机色的宏

* GWPNoHighlightButton          : 无高亮状态的按钮

* GWPRightImageButton           : 图标显示在右侧的按钮

* GWPSingleton                  : 可用于声明单例的宏，适用于任何情况

* GWPUnderlineSegmentedControl  : 常见的带下划线的SegmentControl

* MBProgressHUD+GWPExtension    : 对MBProgressHUD的一个简单封装

* UIBarButtonItem+GWPBadge      : UIBarButtonItem的小红点

* UITabBarItem+GWPBadge         : UITabBarItem的小红点

* UIView+GWPBadge               : UIView的小红点

* UIView+GWPKit                 : UIView的一个分类，可以直接用view.x、view.y等形式直接获取、设置控件的位置、大小

* UIImage+GWPKit                : UIImage的一个分类，里面包含了几个常用的函数，如：通过UIColor产生纯色图片、等比缩小图片、裁剪图片、加水印等


这里只是对每个类的做了一个简单解释，具体用法请参考DEMO，DEMO里有很详细的介绍

## 使用(Install)
引入方式有两种：
* 安装有CocoaPods的朋友可以直接  pod 'GWPKit'
* 没有安装过CocoaPods的朋友可以download下整个zip文件，解压后里面有一个GWPKit文件夹，整个导入即可。但是GWPKit有对MBProgressHUD的封装，所以对他有封装，如果项目中没有引入MBProgressHUD可能会报错。
