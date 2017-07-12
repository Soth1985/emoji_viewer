//
//  DetailsViewController.swift
//  Emoji
//
//  Created by Victor Rykov on 10/7/17.
//  Copyright © 2017 Victor Rykov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController
{
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var emojiDescription: UILabel!
    
    var curEmoji : Emoji!
    
    override func viewDidLoad() {
        emoji.text = curEmoji.view
        emojiDescription.text = curEmoji.description
    }
}
