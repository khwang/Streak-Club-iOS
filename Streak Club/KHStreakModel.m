//
//  KHStreakModel.m
//  Streak Club
//
//  Created by Kevin Hwang on 4/15/15.
//  Copyright (c) 2015 Kevin Hwang. All rights reserved.
//

#import "KHStreakModel.h"

#import "KHUserModel.h"

@implementation KHStreakModel

+ (NSDateFormatter *)dateformatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return dateFormatter;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"endDate" : @"end_date",
             @"host" : @"host",
             @"hourOffset" : @"hour_offset",
             @"remoteId" : @"id",
             @"publishStatus" : @"publish_status",
             @"startDate" : @"start_date",
             @"category" : @"category",
             @"title" : @"title",
             @"shortDescription" : @"short_description",
             @"rate" : @"rate",
             @"submissionsCount" : @"submissions_count",
             @"usersCount" : @"users_count"
             };
}

+ (NSValueTransformer *)endDateJSONTransformer {
    return [MTLValueTransformer transformerUsingReversibleBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSString class]]) {
            return [[self dateformatter] dateFromString:value];
        } else {
            return [[self dateformatter] stringFromDate:value];
        }
    }];
}

+ (NSValueTransformer *)startDateJSONTransformer {
    return [MTLValueTransformer transformerUsingReversibleBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        if ([value isKindOfClass:[NSString class]]) {
            return [[self dateformatter] dateFromString:value];
        } else {
            return [[self dateformatter] stringFromDate:value];
        }
    }];
}

+ (NSValueTransformer *)hostJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[KHUserModel class]];
}

+ (NSValueTransformer *)publishStatusJSONTransformer {
    return [NSValueTransformer
            mtl_valueMappingTransformerWithDictionary:
  @{
    @"draft" : @(KHStreakPublishStatusDraft),
    @"published" : @(KHStreakPublishStatusPublished),
    @"hidden" : @(KHStreakPublishStatusHidden),
    }];
}

+ (NSValueTransformer *)rateJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:
            @{
              @"daily" : @(KHStreakRateDaily),
              @"weekly" : @(KHStreakRateWeekly)
              }];
}


@end
