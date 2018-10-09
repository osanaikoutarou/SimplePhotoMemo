//
//  LineSpacingLabel.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/09.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class LineSpacingLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setLineSpacingValue(value: self.lineSpace)
    }

    @IBInspectable var lineSpace:CGFloat = 0 {
        didSet {
            self.setLineSpacingValue(value: lineSpace)
        }
    }

    override var text:String? {
        didSet {
            self.setLineSpacingValue(value: self.lineSpace)
        }
    }
    
    func set(text:String, lineSpace:CGFloat) {
        self.text = text
        setLineSpacingValue(value: lineSpace)
    }
    
    func setLineSpacingValue(value:CGFloat) {
        let attrString = NSMutableAttributedString(string: self.text!)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = value
        style.lineBreakMode = self.lineBreakMode
        attrString.addAttribute(.paragraphStyle,
                                value: style,
                                range: NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }
}
