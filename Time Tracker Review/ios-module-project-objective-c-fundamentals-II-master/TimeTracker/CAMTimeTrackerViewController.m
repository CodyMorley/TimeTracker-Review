//
//  CAMTimeTrackerViewController.m
//  TimeTracker
//
//  Created by Cody Morley on 8/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CAMTimeTrackerViewController.h"
#import "CAMTimedTaskController.h"
#import "CAMTimedTask.h"

@interface CAMTimeTrackerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *clientField;
@property (weak, nonatomic) IBOutlet UITextField *summaryField;
@property (weak, nonatomic) IBOutlet UITextField *rateField;
@property (weak, nonatomic) IBOutlet UITextField *hoursField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) CAMTimedTaskController *taskController;


@end

@implementation CAMTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskController = [CAMTimedTaskController new];
    self.tableView.dataSource = self;
}


- (IBAction)log:(id)sender {
    NSString *client = self.clientField.text;
    NSString *summary = self.summaryField.text;
    NSString *rateString = self.rateField.text;
    NSString *hoursString = self.hoursField.text;
    double rate = rateString.doubleValue;
    double hours = hoursString.doubleValue;
    
    if (![client isEqualToString:@""] &&
        ![summary isEqualToString:@""] &&
        rate != 0.0 &&
        hours != 0.0) {
        [self.taskController createTaskWithClient:client
                                          summary:summary
                                             rate:rate
                                            hours:hours];
        self.clientField.text = @"";
        self.summaryField.text = @"";
        self.rateField.text = @"";
        self.hoursField.text = @"";
        
        [[self tableView] reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskController.tasks.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    CAMTimedTask *task = self.taskController.tasks[indexPath.row];
    cell.textLabel.text = task.client;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", task.total];
    return cell;
}


@end
