//
//  RNSegmentIOAnalytics
//
//  Created by Tal Kain <tal@kain.net>.
//  Copyright (c) 2015 Fire Place Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RCTConvert.h>
#import <SEGAnalytics.h>
#import "RNSegmentIOAnalytics.h"

@implementation RNSegmentIOAnalytics

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setup:(NSString*)configKey :(NSUInteger)flushAt :(BOOL)shouldUseLocationServices)
{
    SEGAnalyticsConfiguration *configuration = [SEGAnalyticsConfiguration configurationWithWriteKey:configKey];
    configuration.flushAt = flushAt;
    configuration.shouldUseLocationServices = shouldUseLocationServices;
    [SEGAnalytics setupWithConfiguration:configuration];
}

/*
 https://segment.com/docs/libraries/ios/#identify
 */
RCT_EXPORT_METHOD(identify:(NSString*)userId traits:(NSDictionary *)traits) {
    [[SEGAnalytics sharedAnalytics] identify:userId traits:traits];
}

/*
 https://segment.com/docs/libraries/ios/#track
 */
RCT_EXPORT_METHOD(track:(NSString*)event properties:(NSDictionary *)properties) {
    [[SEGAnalytics sharedAnalytics] track:event properties:properties];
}
/*
 https://segment.com/docs/libraries/ios/#screen
 */
RCT_EXPORT_METHOD(screen:(NSString*)screenName properties:(NSDictionary *)properties) {
    [[SEGAnalytics sharedAnalytics] screen:screenName properties:properties];
}

/*
 https://segment.com/docs/libraries/ios/#flushing
 */
RCT_EXPORT_METHOD(flush) {
    [[SEGAnalytics sharedAnalytics] flush];
}

/*
 https://segment.com/docs/libraries/ios/#reset
 */
RCT_EXPORT_METHOD(reset) {
    [[SEGAnalytics sharedAnalytics] reset];
}

/*
 https://segment.com/docs/libraries/ios/#logging
 */
RCT_EXPORT_METHOD(debug: (BOOL)isEnabled) {
    [SEGAnalytics debug:isEnabled];
}

/*
 https://segment.com/docs/libraries/ios/#opt-out
 */
RCT_EXPORT_METHOD(disable) {
    [[SEGAnalytics sharedAnalytics] disable];
}

/*
 https://segment.com/docs/libraries/ios/#opt-out
 */
RCT_EXPORT_METHOD(enable) {
    [[SEGAnalytics sharedAnalytics] enable];
}

@end
