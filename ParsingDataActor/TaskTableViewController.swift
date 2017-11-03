//
//  TaskTableViewController.swift
//  ParsingDataActor
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    let actorsURL = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    var actor = [Actors]()
    var nameSelected:String?
    var DesSelected:String?
    var JobSelected:String?
    var CountrySelected:String?
    var HeightSelected:String?
    var SpouseSelected:String?
    var ChildrenSelected:String?
    var ImageSelected:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getActor()
        
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actor.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskTableViewCell
       
        cell.lblName.text = actor[indexPath.row].name
        cell.lblDes.text = actor[indexPath.row].description
        cell.lblJob.text = actor[indexPath.row].job
        cell.lblCountry.text = actor[indexPath.row].country
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = actor[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        
        nameSelected = dataTask.name
        DesSelected = dataTask.description
        JobSelected = dataTask.job
        CountrySelected = dataTask.country
        HeightSelected = dataTask.height
        SpouseSelected = dataTask.spouse
        ChildrenSelected = dataTask.children
        ImageSelected = dataTask.image
    
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! isiViewController
            sendData.passName = nameSelected
            sendData.passDes = DesSelected
            sendData.passCountry = CountrySelected
            sendData.passHeight = HeightSelected
            sendData.passSpouse = SpouseSelected
            sendData.passChildren = ChildrenSelected
            sendData.passImage = ImageSelected
            sendData.passJob = JobSelected
    }
    }
    func getActor() {
        guard let actorURL = URL(string: actorsURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        let request = URLRequest(url: actorURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.actor = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    func parseJsonData(data: Data) -> [Actors] {
        var actor = [Actors]()
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonActors = jsonResult?["actor"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonActor in jsonActors {
                //declare loan as object from class loan
                let actors = Actors()
                actors.name = jsonActor["name"] as! String
                actors.description = jsonActor["description"] as! String
                actors.job = jsonActor["job"] as! String
                actors.country = jsonActor["country"] as! String
                actors.height = jsonActor["height"] as! String
                actors.spouse = jsonActor["spouse"] as! String
                actors.children = jsonActor["children"] as! String
                actors.image = jsonActor["image"] as! String
                
                actor.append(actors)
            }
        }catch{
            print(error)
        }
        return actor

    }

}

