//
//  ViewController.m
//  CourseList
//
//  Created by GanWenPeng on 15/12/3.
//  Copyright © 2015年 GanWenPeng. All rights reserved.
//

#import "ViewController.h"
#import "GWPCourseListView.h"
#import "CourseModel.h"
#import <GWPKit/GWPKit.h>

@interface ViewController ()<GWPCourseListViewDataSource, GWPCourseListViewDelegate>
@property (weak, nonatomic) IBOutlet GWPCourseListView *courseListView;
@property (weak, nonatomic) IBOutlet UILabel *addBtn;
@property (nonatomic, strong) NSMutableArray<CourseModel*> *courseArr;

@end

@implementation ViewController

- (NSMutableArray<CourseModel *> *)courseArr{
    if (!_courseArr) {
        CourseModel *a = [CourseModel courseWithName:@"PHP" nameAttribute:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:40], NSForegroundColorAttributeName : [UIColor redColor]} dayIndex:1 startCourseIndex:1 endCourseIndex:2];
        CourseModel *b = [CourseModel courseWithName:@"Java" dayIndex:1 startCourseIndex:3 endCourseIndex:3];
        CourseModel *c = [CourseModel courseWithName:@"C++" dayIndex:1 startCourseIndex:4 endCourseIndex:6];
        CourseModel *d = [CourseModel courseWithName:@"C#" dayIndex:2 startCourseIndex:4 endCourseIndex:4];
        CourseModel *e = [CourseModel courseWithName:@"javascript" dayIndex:5 startCourseIndex:5 endCourseIndex:6];
        _courseArr = [NSMutableArray arrayWithArray:@[a,b,c,d,e]];
    }
    return _courseArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addBtn.userInteractionEnabled = YES;
    self.addBtn.layer.cornerRadius = 50;
    self.addBtn.clipsToBounds = YES;
    self.addBtn.backgroundColor = GWPRGBColor(255, 0, 0, 0.2);
    [self.addBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addCourse)]];
}

- (void)addCourse{
    CourseModel *a = [CourseModel courseWithName:@"Golang" dayIndex:3 startCourseIndex:1 endCourseIndex:2];
    [self.courseArr addObject:a];
    [self.courseListView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GWPCourseListViewDataSource
- (NSArray<id<Course>> *)courseForCourseListView:(GWPCourseListView *)courseListView{
    return self.courseArr;
}

/** 课程单元背景色自定义 */
- (UIColor *)courseListView:(GWPCourseListView *)courseListView courseTitleBackgroundColorForCourse:(id<Course>)course{
    if ([course isEqual:[self.courseArr firstObject]]) {    // 第一个，返回自定义颜色
        return [UIColor blueColor];
    }
    
    // 其他返回默认的随机色
    return nil;
}

/** 设置选项卡的title的文字属性，如果实现该方法，该方法返回的attribute将会是attributeString的属性 */
- (NSDictionary*)courseListView:(GWPCourseListView *)courseListView titleAttributesInTopbarAtIndex:(NSInteger)index{
    if (index==0) {
        return @{NSForegroundColorAttributeName:[UIColor greenColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }
    
    return nil;
}
/** 设置选项卡的title的背景颜色，默认白色 */
- (UIColor*)courseListView:(GWPCourseListView *)courseListView titleBackgroundColorInTopbarAtIndex:(NSInteger)index{
    if (index==1) {
        return [UIColor purpleColor];
    }
    
    return nil;
}

#pragma mark - GWPCourseListViewDelegate
/** 选中(点击)某一个课程单元之后的回调 */
- (void)courseListView:(GWPCourseListView *)courseListView didSelectedCourse:(id<Course>)course{
    
}
@end
