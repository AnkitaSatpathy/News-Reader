//
//  DetailArticleViewController.swift
//  News Reader
//
//  Created by Ankita Satpathy on 01/02/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit

class DetailArticleViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var descLabel: UILabel!
   var image = UIImage(named: "")
    var headline = ""
    var desc = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        heading.text = headline
        descLabel.text = desc
        imageview.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
