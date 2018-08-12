//
//  AppDelegate.m
//  StateMachine
//
//  Created by Наташа on 11.08.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import "AppDelegate.h"

#import "NMStateMachine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NMStateMachine *stateMachine = [[NMStateMachine alloc] initWithInitialState];
    [stateMachine performEvent:Event1 fromState:isConfigurating];
    [stateMachine performEvent:Event0 fromState:isLogOut];
    
    return YES;
}

@end
