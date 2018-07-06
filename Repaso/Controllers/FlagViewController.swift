//
//  FlagViewController.swift
//  Repaso
//
//  Created by Erick Carrasco on 7/4/18.
//  Copyright © 2018 Erick Carrasco. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import SVGKit

class FlagViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var subregionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    let flagStore = FlagStore()
    
    var flags: [Flag] = []
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func updateView(for flag: Flag) {
        nameLabel.text = flag.name
        codeLabel.text = flag.code
        regionLabel.text = flag.region
        subregionLabel.text = flag.subregion
        populationLabel.text = flag.population
        if let url = URL(string: flag.flagImage){
            print(url)
            flagImage.af_setImage(withURL: url)
            
        }
    }
    
    func getData() {
        Alamofire.request("https://restcountries.eu/rest/v2/all")
        .validate()
            .responseJSON(completionHandler: {response in
                switch response.result{
                case .success(let value):
                        let jsonFlags = JSON(value).array
                        self.flags =  Flag.buildAll(from: jsonFlags!)
                        self.updateView(for: self.flags[self.currentIndex])
                case .failure(let error):
                    print("Response error \(error.localizedDescription)")
                }
            })
    }
    
    @IBAction func favoriteFalgAction(_ sender: UIButton) {
        let name = flags[currentIndex].name
        let image = flags[currentIndex].flagImage
        
        flagStore.flagStore = Flag(name: name, flagImage: image)
        
    }
    
    @IBAction func nextFlagAction(_ sender: UIButton) {
        currentIndex += 1
        let count = flags.count
        if currentIndex < count {
            updateView(for: self.flags[currentIndex])
        } else {
            currentIndex = 0
        }
        
    }
    @IBAction func backFlagAction(_ sender: UIButton) {
        currentIndex -= 1
        let count = flags.count
        if currentIndex > 0 {
            updateView(for: self.flags[currentIndex])
        } else {
            currentIndex = count
        }
    }
    
}
