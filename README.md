# GWPCourseListView
一个简单实用的课程表控件

install：
git clone本项目后，里面有一个GWPCourseListView文件夹，直接将该文件夹拖入项目即可。

use:
设置dataSource，依次实现以下方法
/** 设置课程数据，必须实现 */
- (NSArray<id<Course>> *)courseForCourseListView:(GWPCourseListView *)courseListView;

@optional
/** 设置选项卡的title，默认依次为中文：周一、周二、...、周日 */
- (NSString *)courseListView:(GWPCourseListView *)courseListView titleInTopbarAtIndex:(NSInteger)index;

项目中的CourseModel并非必需，您可以自定义模型，只要遵守Course协议即可。

其他见DEMO
