//
//  isiViewController.swift
//  ParsingDataActor
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class isiViewController: UIViewController {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Des: UILabel!
    @IBOutlet weak var Job: UILabel!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Spouse: UILabel!
    @IBOutlet weak var Children: UILabel!
    @IBOutlet weak var Image: UILabel!
    
    var passName:String?
    var passDes:String?
    var passJob:String?
    var passCountry:String?
    var passHeight:String?
    var passSpouse:String?
    var passChildren:String?
    var passImage:String?
    
    override func viewDidLoad() {
        
        Name.text = passName!
        Des.text = passDes!
        Job.text = passJob!
        Country.text = passCountry!
        Height.text = passHeight!
        Spouse.text = passSpouse!
        Children.text = passChildren!
        Image.text = passImage!
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
