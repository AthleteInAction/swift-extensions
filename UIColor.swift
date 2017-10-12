//
//  UIColor.swift
//
//  Created by William Robinson on 10/9/17.
//  Copyright © 2017 Wambl, LLC. All rights reserved.
//

import UIKit

extension UIColor {

    // INIT
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Colors
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
//    static var one: UIColor = UIColor(255,72,68)
    static var one: UIColor = UIColor(109,89,89)
    static var one_text: UIColor = UIColor.white
    static var bg: UIColor = UIColor.white
    static var bg_accent: UIColor = UIColor(239,239,239)
    static var text: UIColor = UIColor(61,61,61)
    static var text_light: UIColor = UIColor(112,112,112)
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Bootstrap
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    class Bootstrap {
        class primary {
            static var color: UIColor = UIColor(19,120,213)
            static var text: UIColor = UIColor.white
        }
        class success {
            static var color: UIColor = UIColor(96,182,96)
            static var text: UIColor = UIColor.white
        }
        class info {
            static var color: UIColor = UIColor(96,192,220)
            static var text: UIColor = UIColor.white
        }
        class warning {
            static var color: UIColor = UIColor(239,172,87)
            static var text: UIColor = UIColor.white
        }
        class danger {
            static var color: UIColor = UIColor(215,84,83)
            static var text: UIColor = UIColor.white
        }
        class inverse {
            static var color: UIColor = UIColor(41,43,44)
            static var text: UIColor = UIColor.white
        }
        class faded {
            static var color: UIColor = UIColor(247,247,247)
            static var text: UIColor = UIColor(41,43,44)
        }
    }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Table
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    class Table {
        class grouped {
            static var color: UIColor = UIColor(239,239,244)
        }
    }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Spotify
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    static var spotifyDigitalGreen: UIColor { return UIColor(29,185,84,1) }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Vote Thumbs
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    static var thumbsUp: UIColor { return UIColor(145,254,85,1) }
    static var thumbsDown: UIColor { return UIColor(255,102,102,1) }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

    // Adjustments
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }else{
            return nil
        }
    }
    // :-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:

}
