//
//  ViewController.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import UIKit

class ViewController: UIViewController {


    var searchingBeers = [Beer]()
    var beerSelected: Beer?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewController.register(UINib(nibName: "BeerTableViewCell",bundle: nil), forCellReuseIdentifier: "beerCell")
       

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if beerSelected != nil{
                if let destination = segue.destination as? DetailViewController{
                    destination.beerParam = beerSelected
                }
            }
        }
      
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchingBeers.count == 0 ){
            if let text = searchBar.text{
                if(text.isEmpty){
                    self.tableViewController.setEmptyMessage("Please, enter a food")
                }else{
                    self.tableViewController.setEmptyMessage("0 results found for this food")
                }
            }
        }
        else {
            self.tableViewController.restore()
            }
        
        
        return searchingBeers.count
        

    
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell") as? BeerTableViewCell
        
        let beer = searchingBeers[indexPath.row]
        cell?.titleBeer?.text = beer.name
        cell?.tagLine?.text = beer.tagline

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        beerSelected = searchingBeers[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    
}

extension ViewController: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  

        NetworkingProvider.shared.getBeerByName(name: searchBar.text!) { listBeers in
            
            if(listBeers != nil){
                self.searchingBeers = listBeers!
               
            }
            else{
                self.searchingBeers = []
            }
            self.tableViewController.reloadData()
        }
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}





