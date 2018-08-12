//
//  NMStateMachine.h
//  StateMachine
//
//  Created by Наташа on 11.08.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import <Foundation/Foundation.h>
//states of user
typedef enum{
    isLogOut,
    isConfigurating,
    isLogIn,
    isChoosingDestination,
    isWaitingForDriver, 
    isApprovingDriver,
    isChoosingTheWayToPay,
    isDrivenSuccessfully, //finite state
    isOutOfDrivers,
    isLeavingTheApp, //finite state
} State;

typedef enum{
    Event1,
    Event0, 
} Event;
@interface NMStateMachine : NSObject
@property(assign,nonatomic) State currentState;
@property(assign,nonatomic) State finalState;


-(instancetype)initWithInitialState;
-(void)performEvent:(Event)event fromState:(State)state;
@end
