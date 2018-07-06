//
//  FavoriteViewController.swift
//  Repaso
//
//  Created by Erick Carrasco on 7/4/18.
//  Copyright © 2018 Erick Carrasco. All rights reserved.
//

import UIKit
import AlamofireImage

class FavoriteViewController: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let flagStore = FlagStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView(){
        if let name = flagStore.flag.string(forKey: "flagName"){
            nameLabel.text = name
            if let url = URL(string: flagStore.flag.string(forKey: "flagImage")!){
                flagImage.af_setImage(withURL: url)
            }
        }
        
        
    }  

}
