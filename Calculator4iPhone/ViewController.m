//
//  ViewController.m
//  Calculator4iPhone
//
//  Created by user on 2016. 8. 24..//  Copyright © 2016년 LDCC. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

enum opr{none, plus, minus, divide, multiply};
typedef enum opr Operator;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *CalculLabel;
// 스토리보드와 연결되는 특별한 객체~
// 왜? 스토리보드는 우리가 만드는 코드에서 생성되는 객체가 아니기 때문에 이를 연결하기 위해 IB Outlet이 필요하다
@end

@implementation ViewController

{
    int curruntValue;
    Operator curruntOpr;
    Calculator *Calc;

    // 초기화 해야될 필요가 있겠네
}

- (IBAction)buttonClick:(id)sender {
    UIButton *myButton = sender;
    
    //id는 포괄적이고 해당 UI를 끌어올때 결정해보아라
    int value = (int)myButton.tag;
    //애플이 만들어 놓은 NextStep 정수형
    
    curruntValue = curruntValue * 10 + value;
    
    self.CalculLabel.text = [NSString stringWithFormat: @"%d", curruntValue]; // NSString 형전환
    
    
    NSLog(@"ButtonCliked");
}

- (IBAction)clear:(id)sender {
    curruntValue = 0;
    self.CalculLabel.text = [NSString stringWithFormat: @"%d", curruntValue];
}


- (IBAction)clickOpr:(id)sender {
    UIButton *myButton = sender;
     int value = (int)myButton.tag;
    
    switch (value){
        case 1:
            curruntOpr = plus;
            break;
        case 2:
            curruntOpr = minus;
            break;
        case 3:
            curruntOpr = multiply;
            break;
        case 4:
            curruntOpr = divide;
            break;
        default:
            break;
    }
    
    [Calc setAccumulator:curruntValue];
    curruntValue = 0;
}

- (IBAction)clickResult:(id)sender {
    switch (curruntOpr){
        case plus:
            [Calc add: curruntValue];
            curruntValue = [Calc accumulator];
            break;
        case minus:
            [Calc subtract : curruntValue];
            curruntValue = [Calc accumulator];
            break;
        case multiply:
            [Calc multiply : curruntValue];
            curruntValue = [Calc accumulator];
            break;
        case divide:
            [Calc divide : curruntValue];
            curruntValue = [Calc accumulator];
           break;
        default:
            break;
    }
            self.CalculLabel.text = [NSString stringWithFormat: @"%d", curruntValue];
}

- (IBAction)unwind:(UIStoryboardSegue *)sender{
    //unwind가 구현된 화면으로 돌아가도록 !!!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Calc = [[Calculator alloc] init];
    curruntOpr = none;
    curruntValue = 0;
    self.CalculLabel.text = @"0";

    // Do any additional setup after loading the view, typically from a nib.
    // 뷰가 다 만들어지고 나면 호출되는 메소드
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
