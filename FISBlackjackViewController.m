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
@property (weak, nonatomic) IBOutlet UIButton *hitButton;
@property (weak, nonatomic) IBOutlet UIButton *stayButton;



@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readyTheLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}
-(void)whenWinner:(NSString *)winner {
    self.houseCard1Label.text =[self.game.house.cardsInHand[0] cardLabel];
    self.houseScoreLabel.hidden = NO;
    self.winner.hidden = NO;
    self.winner.text = [NSString stringWithFormat:@"%@ Wins!", winner];
    self.hitButton.enabled = NO;
    self.stayButton.enabled = NO;
    self.playerScoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
    self.houseScoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];

    if ([winner isEqualToString:@"House"]) {
        if (self.game.player.busted) {
            self.playerBustLabel.hidden = NO;
        }
        [self.game incrementWinsAndLossesForHouseWins:YES];
    }
    else
    {
        if (self.game.house.busted) {
            self.houseBustLabel.hidden = NO;
        }
        [self.game incrementWinsAndLossesForHouseWins:NO];
    }
    self.houseLossesLabel.text = [NSString stringWithFormat:@"Losses: %li",self.game.house.losses];
    self.playerWinsLabel.text = [NSString stringWithFormat:@"Wins: %li",self.game.player.wins];
    self.playerLossesLabel.text = [NSString stringWithFormat:@"Losses: %li",self.game.player.losses];
    self.houseWinsLabel.text = [NSString stringWithFormat:@"Wins: %li",self.game.house.wins];
    
}

-(void)readyTheLabel{
    
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

}
- (IBAction)dealTapped:(UIButton *)sender {
    [self readyTheLabel];
    self.game = [[FISBlackjackGame alloc]init];
    [self.game.deck shuffleRemainingCards];
    [self.game dealNewRound];
    self.playerCard1Label.hidden = NO;
    self.playerCard2Label.hidden = NO;
    self.houseCard1Label.hidden = NO;
    self.houseCard2Label.hidden = NO;
    self.playerCard1Label.text = [self.game.player.cardsInHand[0] cardLabel];
    self.houseCard1Label.text = @"❂";
    self.playerCard2Label.text = [self.game.player.cardsInHand[1] cardLabel];
    self.houseCard2Label.text = [self.game.house.cardsInHand[1] cardLabel];
    
    if (self.game.house.blackjack) {
        self.houseBlackjackLabel.hidden = NO;
        [self whenWinner:@"House"];
    }
    else if (self.game.player.blackjack) {
        self.playerBlackjackLabel.hidden = NO;
        [self whenWinner:@"Player"];
    }
    
    else {
    self.hitButton.enabled = YES;
    self.stayButton.enabled = YES;
    }
    
    self.houseScoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];
    self.playerScoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
    
    
    
    
}
- (IBAction)hitTapped:(id)sender {
    
    [self.game dealCardToPlayer];
    
    NSString *cardLabelNext = [[self.game.player.cardsInHand objectAtIndex:[self.game.player.cardsInHand count]-1] cardLabel];
    self.playerCard3Label.hidden = NO;
    
    
    if (self.game.player.cardsInHand.count == 3) {
        
        NSLog(@"%@ label 3", cardLabelNext);
        self.playerCard3Label.text = cardLabelNext;
        
        
    }
    
    
    else if (self.game.player.cardsInHand.count == 4) {
        self.playerCard4Label.hidden = NO;
        self.playerCard4Label.text = cardLabelNext;
    }
    
    
    else if (self.game.player.cardsInHand.count == 5) {
        self.playerCard5Label.hidden = NO;
        self.playerCard5Label.text = cardLabelNext;
    }
    NSLog(@"%@ game", self.game.player);
    self.playerScoreLabel.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
    
    if (self.game.player.busted) {
        [self whenWinner:@"House"];
    }
}
- (IBAction)stayTapped:(id)sender {
    self.hitButton.enabled = NO;
    self.stayButton.enabled = NO;
    self.houseCard1Label.text = [self.game.house.cardsInHand[0] cardLabel];
    NSUInteger counter = 1;
    self.houseScoreLabel.hidden = NO;
    self.playerStayedLabel.hidden = NO;
    while (self.game.house.shouldHit) {
        counter+=1;
        self.game.dealCardToHouse;
        if (counter == 2) {
            self.houseCard3Label.hidden = NO;
            self.houseCard3Label.text = [[self.game.house.cardsInHand objectAtIndex:counter]cardLabel];
        }
        else if (counter == 3) {
            self.houseCard4Label.hidden = NO;
            self.houseCard4Label.text = [[self.game.house.cardsInHand objectAtIndex:counter]cardLabel];
        }
        else if (counter == 4) {
            self.houseCard5Label.hidden = NO;
            self.houseCard5Label.text = [[self.game.house.cardsInHand objectAtIndex:counter]cardLabel];
            
        }
        
    }
    if (self.game.house.stayed) {
        self.houseStayedLabel.hidden = NO;
        if (self.game.houseWins) {
            [self whenWinner:@"House"];
        }
        else
        {
            [self whenWinner:@"Player"];
        }
    }
}


@end
