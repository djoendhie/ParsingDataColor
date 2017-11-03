//
//  ViewController.swift
//  ParsingDataPopulation
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Rank: UILabel!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var population: UILabel!
    
    var passRank:String?
    var passCountry:String?
    var passPopulation:String?
    
    override func viewDidLoad() {
        
        Rank.text = passRank!
        Country.text = passCountry!
        population.text = passPopulation!
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

