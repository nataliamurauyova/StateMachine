//
//  NMStateMachine.m
//  StateMachine
//
//  Created by Наташа on 11.08.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import "NMStateMachine.h"
@interface NMStateMachine ()

@end

@implementation NMStateMachine
-(instancetype)initWithInitialState{
    self = [super init];
    if(self){
        _currentState = isLogOut;
        _finalState = NULL;
    }
    return self;
}
-(void)performEvent:(Event)event fromState:(State)state{
    [self checkIfStateIsFinal:state];
    switch (state) {
        case isLogOut:
            [self isLogOutCheckWithEvent:event];
            break;
        case isConfigurating:
            [self isConfiguratingCheckWithEvent:event];
            break;
        case isLogIn:
            [self isLogInCheckWithEvent:event];
            break;
        case isChoosingDestination:
            [self isChoosingDestinationCheckWithEvent:event];
            break;
        case isWaitingForDriver:
            [self isWaitingForDriverCheckWithEvent:event];
            break;
            case isApprovingDriver:
            [self isApprovingDriverCheckWithEvent:event];
            break;
        case isChoosingTheWayToPay:
            [self isChoosingWayToPayCheckWithEvent:event];
            break;
        case isOutOfDrivers:
            [self isOutOfDriversCheckWithEvent:event];
            break;
        case isDrivenSuccessfully:
            [self isDrivenSuccessfullyCheckWithEvent:event];
            break;
        default:
            break;
    }
}
-(void)checkIfStateIsFinal:(State)state{
    if(state == isLeavingTheApp){
        NSLog(@"The state is final!");
    
    }
}
-(void)isLogOutCheckWithEvent:(Event)event{
    if(event == Event0){
        self.currentState = isConfigurating;
        NSLog(@"%d",self.currentState);
    } else if(event == Event1){
        self.currentState = isLogIn;
    }
}
-(void)isConfiguratingCheckWithEvent:(Event)event{
    if (event == Event0) {
        self.currentState = isLogIn;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isLogInCheckWithEvent:(Event)event{
    if (event == Event1) {
        self.currentState = isChoosingDestination;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isChoosingDestinationCheckWithEvent:(Event)event{
    if (event == Event1) {
        self.currentState = isWaitingForDriver;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isWaitingForDriverCheckWithEvent:(Event)event{
    if(event == Event1){
        self.currentState = isApprovingDriver;
    } else if (event == Event0){
        self.currentState = isOutOfDrivers;
    }
}
-(void)isApprovingDriverCheckWithEvent:(Event)event{
    if(event == Event1){
        self.currentState = isChoosingTheWayToPay;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isChoosingWayToPayCheckWithEvent:(Event)event{
    if(event == Event1){
        self.currentState = isDrivenSuccessfully;
        self.finalState = isDrivenSuccessfully;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isOutOfDriversCheckWithEvent:(Event)event{
    if (event == Event0) {
        self.currentState= isLeavingTheApp;
        self.finalState = isLeavingTheApp;
    } else {
        NSLog(@"Can't perform that event");
    }
}
-(void)isDrivenSuccessfullyCheckWithEvent:(Event)event{
    if(event == Event1){
        self.currentState = isLeavingTheApp;
        self.finalState = isLeavingTheApp;
    } else {
        NSLog(@"Can't perform that event");
    }
}
@end
