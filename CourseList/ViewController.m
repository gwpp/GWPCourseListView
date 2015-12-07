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

@interface ViewController ()<GWPCourseListViewDataSource, GWPCourseListViewDelegate>
@property (weak, nonatomic) IBOutlet GWPCourseListView *courseListView;
@property (nonatomic, strong) NSArray<CourseModel*> *courseArr;

@end

@implementation ViewController

- (NSArray<CourseModel *> *)courseArr{
    if (!_courseArr) {
        CourseModel *a = [CourseModel courseWithName:@"PHP" dayIndex:1 startCourseIndex:1 endCourseIndex:2];
        CourseModel *b = [CourseModel courseWithName:@"Java" dayIndex:1 startCourseIndex:3 endCourseIndex:3];
        CourseModel *c = [CourseModel courseWithName:@"C++" dayIndex:1 startCourseIndex:4 endCourseIndex:6];
        CourseModel *d = [CourseModel courseWithName:@"C#" dayIndex:2 startCourseIndex:4 endCourseIndex:4];
        CourseModel *e = [CourseModel courseWithName:@"javascript" dayIndex:5 startCourseIndex:5 endCourseIndex:6];
        _courseArr = @[a,b,c,d,e];
    }
    return _courseArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GWPCourseListViewDataSource
- (NSArray<id<Course>> *)courseForCourseListView:(GWPCourseListView *)courseListView{
    return self.courseArr;
}

#pragma mark - GWPCourseListViewDelegate
- (void)courseListView:(GWPCourseListView *)courseListView didSelectedCourse:(id<Course>)course{
    
}
@end
