//
//  TaskTableViewController.swift
//  ParsingDataPopulation
//
//  Created by SMK IDN MI on 11/3/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {

    var populationURL = "http://www.androidbegin.com/tutorial/jsonparsetutorial.txt"
    var population = [Population]()
    
    var rankSelected:String?
    var countrySelected:String?
    var populationSelected:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPopulation()
        
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
        return population.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TaskTableViewCell

        cell.lblRank.text = "No\(population[indexPath.row].rank)"
        cell.lblCountry.text = population[indexPath.row].country
        cell.lblPopulation.text = population[indexPath.row].population
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = population[indexPath.row]
    
        rankSelected = dataTask.rank
        countrySelected = dataTask.country
        populationSelected = dataTask.population
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ViewController
            sendData.passRank = rankSelected
            sendData.passCountry = countrySelected
            sendData.passPopulation = populationSelected
            
        }
    }
    func getPopulation() {
        guard let populationURL = URL(string: populationURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        let request = URLRequest(url: populationURL)
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
                self.population = self.parseJsonData(data: data)
                
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
    
    func parseJsonData(data: Data) -> [Population] {
        var population = [Population]()
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonLoans = jsonResult?["population"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let populations = Population()
                populations.rank = jsonLoan["rank"] as! String
                populations.country = jsonLoan["country"] as! String
                populations.population = jsonLoan["population"] as! String

                
                population.append(populations)
            }
        }catch{
            print(error)
        }
        return population
    }
}



