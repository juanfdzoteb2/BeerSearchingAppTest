//
//  DetailViewController.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var beerParam: Beer?

    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descriptionDetail: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var foodPairing: UILabel!
    @IBOutlet weak var ibuBitterness: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleDetail.numberOfLines = 3
        tagLine.numberOfLines = 3
        descriptionDetail.numberOfLines = 10
        foodPairing.numberOfLines = 10
        
        if let beer  = beerParam{
            
            titleDetail.text = beer.name!
            tagLine.text = beer.tagline!
            descriptionDetail.text = beer.description!
            abv.text = "\(beer.abv!) %"
            foodPairing.text = getFoodParigingString(foodPairing: beer.food_pairing)
            if beer.image_url != nil{
                downloadImage(from: URL(string:beer.image_url!)!)
            }
            if(beer.ibu != nil){
                ibuBitterness.text = "Bitterness (IBU) \(beer.ibu!)"
            }
        }

    }
    
   func getFoodParigingString(foodPairing: Array<String>?) -> String{
    
    var result = ""
    
    if(foodPairing != nil ){
        
        for food in foodPairing!{
            result.append("\(food) \n")
        }
        return result
        
    }else{
        return ""
    }
        
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.imageDetail.image = UIImage(data: data)
            }
        }
    }
    

}
