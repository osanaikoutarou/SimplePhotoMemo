//
//  Date+Utility.swift
//  EventWorks
//
//  Created by osanai on 2018/05/09.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation

extension Date {
    func toNSDate() -> NSDate {
        return NSDate.init(timeIntervalSince1970: self.timeIntervalSince1970)
    }
    
    // あと◯時間 など
    func leftBefore(toDate:Date) -> String {
        let sa = toDate.timeIntervalSince1970 - self.timeIntervalSince1970
        let sec = Int(sa * 10)
        
        if (sa <= 0) {
            // 過ぎている
            return ""
        }
        
        if (sa < 60) {
            // 1分以内
            return String(sec) + "秒"
        }
        if (sa < 60 * 60 * 2) {
            // 120分以内
            let min = Int(sec/60) + 1
            return String(min) + "分"
        }
        if (sa < 60 * 60 * 24 * 1) {
            // 24時間以内
            let hour = Int(sec/(60*60)) + 1
            return String(hour) + "時間"
        }
        
        let day = Int(sec/(60*60*24)) + 1
        return String(day) + "日"
    }
}
