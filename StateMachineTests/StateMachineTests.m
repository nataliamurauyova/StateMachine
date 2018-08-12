//
//  StateMachineTests.m
//  StateMachineTests
//
//  Created by Наташа on 11.08.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NMStateMachine.h"

@interface StateMachineTests : XCTestCase
@property(strong,nonatomic) NMStateMachine *stateMachine;
@end

@implementation StateMachineTests

- (void)setUp {
    [super setUp];
    self.stateMachine = [[NMStateMachine alloc] initWithInitialState];
}

- (void)tearDown {
    self.stateMachine = nil;
    [super tearDown];
}

-(void)testExampleChain1_Success{
    [self.stateMachine performEvent:Event1 fromState:isLogOut];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event0 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event0 fromState:isOutOfDrivers];
    XCTAssertEqual(self.stateMachine.finalState, isLeavingTheApp);
}
-(void)testExampleChain1_Failure{
    [self.stateMachine performEvent:Event1 fromState:isLogOut];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event0 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event0 fromState:isOutOfDrivers];
    XCTAssertEqual(self.stateMachine.currentState, isWaitingForDriver);
}
-(void)testExampleChain2_Success{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event0 fromState:isConfigurating];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event1 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event1 fromState:isApprovingDriver];
    [self.stateMachine performEvent:Event1 fromState:isChoosingTheWayToPay];
    XCTAssertEqual(self.stateMachine.finalState, isDrivenSuccessfully);
}
-(void)testExampleChain2_Failure{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event0 fromState:isConfigurating];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event1 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event1 fromState:isApprovingDriver];
    [self.stateMachine performEvent:Event1 fromState:isChoosingTheWayToPay];
    XCTAssertEqual(self.stateMachine.finalState, isLeavingTheApp);
}

-(void)testExampleChain3_Success{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event0 fromState:isConfigurating];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event1 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event1 fromState:isApprovingDriver];
    [self.stateMachine performEvent:Event1 fromState:isChoosingTheWayToPay];
    [self.stateMachine performEvent:Event1 fromState:isDrivenSuccessfully];
    XCTAssertEqual(self.stateMachine.finalState, isLeavingTheApp);
}
-(void)testExampleChain3_Failure{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event0 fromState:isConfigurating];
    [self.stateMachine performEvent:Event1 fromState:isLogIn];
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event1 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event1 fromState:isApprovingDriver];
    [self.stateMachine performEvent:Event1 fromState:isChoosingTheWayToPay];
    [self.stateMachine performEvent:Event1 fromState:isDrivenSuccessfully];
    XCTAssertEqual(self.stateMachine.finalState, isDrivenSuccessfully);
}
-(void)testExampleChain4_Success{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event0 fromState:isConfigurating];
    XCTAssertEqual(self.stateMachine.currentState, isLogIn);
}
-(void)testExampleChain4_Failure{
    [self.stateMachine performEvent:Event0 fromState:isLogOut];
    [self.stateMachine performEvent:Event1 fromState:isConfigurating];
    XCTAssertEqual(self.stateMachine.currentState, isLogIn);
}

-(void)test_Initial_State{
    [self.stateMachine performEvent:Event1 fromState:self.stateMachine.currentState];
    XCTAssertEqual(self.stateMachine.currentState, isLogIn);
}
-(void)testExampleChain5_Success{
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event0 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event0 fromState:isOutOfDrivers];
    XCTAssertNotEqual(self.stateMachine.currentState, isDrivenSuccessfully);
}

-(void)testExampleChain5_Failure{
    [self.stateMachine performEvent:Event1 fromState:isChoosingDestination];
    [self.stateMachine performEvent:Event0 fromState:isWaitingForDriver];
    [self.stateMachine performEvent:Event0 fromState:isOutOfDrivers];
    XCTAssertNotEqual(self.stateMachine.currentState, isLeavingTheApp);
}
@end
