//
//  clout.mm
//  clout
//
//  Created by Tommy Bojanin on 1/29/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"

static NSHashTable<NSString*> *friends = [[NSHashTable alloc] init];

@interface TFNTwitterAccount: NSObject
@property (nonatomic, readonly) NSString *fullName;
-(BOOL)verified;
-(BOOL)isVitVerifiedFollowersViewEnabled;
-(BOOL)isVerificationV2ElectionsBadgeEnabled;
-(BOOL)isVerificationV2AffiliateBadgingM2Enabled;
-(BOOL)isVerificationV2AffiliateBadgingEnabled;
@end

// MARK - TFNTwitterAccount
CHDeclareClass(TFNTwitterAccount);
CHOptimizedMethod0(self, BOOL, TFNTwitterAccount, verified) {
    NSLog(@"ENHANCER - verifiedCalled");
    if ([friends containsObject:[[self fullName] lowercaseString]]) {
        return YES;
    } else {
        return CHSuper0(TFNTwitterAccount, verified);
    }
}

CHOptimizedMethod0(self, BOOL, TFNTwitterAccount, isVitVerifiedFollowersViewEnabled) {
    NSLog(@"ENHANCER - isVitVerifiedFollowersViewEnabled Called");
    
    if ([friends containsObject:[[self fullName] lowercaseString]]) {
        return YES;
    } else {
        return CHSuper0(TFNTwitterAccount, isVitVerifiedFollowersViewEnabled);
    }
}

CHOptimizedMethod0(self, BOOL, TFNTwitterAccount, isVerificationV2ElectionsBadgeEnabled) {
    NSLog(@"ENHANCER - isVerificationV2ElectionsBadgeEnabled Called");
    if ([friends containsObject:[[self fullName] lowercaseString]]) {
        return YES;
    } else {
        return CHSuper0(TFNTwitterAccount, isVerificationV2ElectionsBadgeEnabled);
    }
}

CHOptimizedMethod0(self, BOOL, TFNTwitterAccount, isVerificationV2AffiliateBadgingM2Enabled) {
    NSLog(@"ENHANCER - isVerificationV2AffiliateBadgingM2Enabled Called");
    if ([friends containsObject:[[self fullName] lowercaseString]]) {
        return YES;
    } else {
        return CHSuper0(TFNTwitterAccount, isVerificationV2AffiliateBadgingM2Enabled);
    }
}

CHOptimizedMethod0(self, BOOL, TFNTwitterAccount, isVerificationV2AffiliateBadgingEnabled) {
    NSLog(@"ENHANCER - isVerificationV2AffiliateBadgingEnabled Called");
    if ([friends containsObject:[[self fullName] lowercaseString]]) {
        return YES;
    } else {
        return CHSuper0(TFNTwitterAccount, isVerificationV2AffiliateBadgingEnabled);
    }
}

CHConstructor // code block that runs immediately upon load
{
    @autoreleasepool
    {
        [friends addObject:@"tbojanin"];
        NSLog(@"TWITTER_ENHANCER");
        CHLoadLateClass(TFNTwitterAccount);
        CHHook0(TFNTwitterAccount, verified);
        CHHook0(TFNTwitterAccount, isVitVerifiedFollowersViewEnabled);
        CHHook0(TFNTwitterAccount, isVerificationV2ElectionsBadgeEnabled);
        CHHook0(TFNTwitterAccount, isVerificationV2AffiliateBadgingM2Enabled);
        CHHook0(TFNTwitterAccount, isVerificationV2AffiliateBadgingEnabled);
    }
}
