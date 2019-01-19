//
//  main.m
//  1-Two Sum
//
//  Created by Alexcai on 2019/1/18.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>
/** Two Sum  Question:
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].

 */



int result[2] = {0,0};

/** answer 1 : O(n*n) */
int* twoSum(int* nums, int numsSize, int target) {
    if (numsSize < 2) {
        NSLog(@"the nums size error ,must larger then 2");
        return NULL;
    }
    for (int i = 0; i < numsSize; ++i) {
        for (int j = i + 1; j < numsSize; ++j) {
            if ((nums[i] + nums[j]) == target) {
                result[0] = i;
                result[1] = j;
                return result;
            }
        }
    }
    return NULL;
}

/** answer 2: O(n) */
int* twoSum1(int* nums, int numsSize, int target){
    int *resualtArray = malloc(sizeof(int)*2);
    for(int i = 0, j = 1; i < numsSize; j++) {
        if(j == numsSize) j = ++i + 1;
        if(nums[i] + nums[j] == target) {
            resualtArray[0] = i;
            resualtArray[1] = j;
            break;
        }
    }
    return resualtArray;
    
}

/** answer 3: 使用set  */

int * towSum2(int * nums, int numsSize, int target){
    int *resultArray = malloc(sizeof(int) * 2);
    
    NSMutableSet *numsSet = [NSMutableSet set];
    /** 1. 将数组中的元素添加到set 中 */
    for (int i = 0; i < numsSize; i++) {
        [numsSet addObject:@(nums[i])];
    }
    NSUInteger setCount = numsSet.count;
    int index = 0;
    for (int i = 0; i < numsSize; i++) {
        int delta = target - nums[i];
        [numsSet addObject:@(delta)];
        NSUInteger newSetCount = numsSet.count;
        if (setCount != newSetCount) {
            setCount = newSetCount;
        }else{
            resultArray[index++] = i;
        }
    }
    
    return resultArray;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int sample[] = {1,4,5,2,6,9,3,11,7,8,23};
        int target = 31;
        
//        twoSum(sample, 11, target);
        int *result1 = towSum2(sample, 11, target);
        
        NSLog(@"result is  %d    %d",result1[0], result1[1]);
    }
    return 0;
}


