//
//  ViewController.swift
//  ParsingDataColor
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var passcolorLabel:String?
    var passvalueLabel:String?
    
    
    
    override func viewDidLoad() {
        colorLabel.text = passcolorLabel!
        valueLabel.text = passvalueLabel!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

