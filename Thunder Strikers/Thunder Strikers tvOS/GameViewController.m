//
//  GameViewController.m
//  Thunder Strikers tvOS
//
//  Created by Zen Vora on 4/20/25.
//

#import "GameViewController.h"
#import <SceneKit/SceneKit.h>
#import "GameController.h"

@interface GameViewController ()

@property (readonly) SCNView *gameView;
@property (strong, nonatomic) GameController *gameController;

@end

@implementation GameViewController

- (SCNView *)gameView {
    return (SCNView *)self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameController = [[GameController alloc] initWithSceneRenderer:self.gameView];
    
    // Allow the user to manipulate the camera
    self.gameView.allowsCameraControl = YES;
    
    // Show statistics such as fps and timing information
    self.gameView.showsStatistics = YES;
    
    // Configure the view
    self.gameView.backgroundColor = [UIColor blackColor];
    
    // Add a tap gesture recognizer
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:tapGesture];
    [gestureRecognizers addObjectsFromArray:self.gameView.gestureRecognizers];
    self.gameView.gestureRecognizers = gestureRecognizers;
}

- (void) handleTap:(UIGestureRecognizer*)gestureRecognize {
    // Highlight the tapped nodes
    CGPoint p = [gestureRecognize locationInView:self.gameView];
    [self.gameController highlightNodesAtPoint:p];
}

@end
