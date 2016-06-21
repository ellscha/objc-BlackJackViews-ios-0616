//
//  FISBlackjackViewController.m
//  
//
//  Created by Elli Scharlin on 6/21/16.
//
//

#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()
@property (weak, nonatomic) IBOutlet UILabel *houseLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4Label;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5Label;
@property (weak, nonatomic) IBOutlet UILabel *houseBustLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjackLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseLossesLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerCard1Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4Label;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5Label;
@property (weak, nonatomic) IBOutlet UILabel *playerBustLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjackLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerWinsLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLossesLabel;
@property (weak, nonatomic) IBOutlet UILabel *winner;


@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.winner.hidden = YES;
    
    self.houseBustLabel.hidden = YES;
    self.houseBlackjackLabel.hidden = YES;
    self.houseStayedLabel.hidden = YES;
    self.houseScoreLabel.hidden = YES;
    
    self.houseCard1Label.hidden = YES;
    self.houseCard2Label.hidden = YES;
    self.houseCard3Label.hidden = YES;
    self.houseCard4Label.hidden = YES;
    self.houseCard5Label.hidden = YES;

    self.playerStayedLabel.hidden = YES;
    self.playerBustLabel.hidden = YES;
    self.playerBlackjackLabel.hidden = YES;
    
    self.playerCard1Label.hidden = YES;
    self.playerCard2Label.hidden = YES;
    self.playerCard3Label.hidden = YES;
    self.playerCard4Label.hidden = YES;
    self.playerCard5Label.hidden = YES;
    
        //[FISBlackjackGame.self resetForNewGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dealTapped:(UIButton *)sender {
    
}
- (IBAction)hitTapped:(id)sender {
    

}
- (IBAction)stayTapped:(id)sender {
}

@end
