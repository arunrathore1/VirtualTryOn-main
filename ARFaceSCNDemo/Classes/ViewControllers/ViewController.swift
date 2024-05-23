//
//  ViewController.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import UIKit

class ViewController: UIViewController {
    let modelsData:[String] = [
        Constants.ModelNames.glass1,
        Constants.ModelNames.glass2,
        Constants.ModelNames.glass3,
        Constants.ModelNames.glass4,
        Constants.ModelNames.glass5,
    ]

  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
  @IBAction func tryAction(_ sender: Any) {
    let modelName = modelsData[0]
    let trymodelVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoardIDs.tryModelVC) as! TryModelVC

    trymodelVC.nameOfModelToDisplay = modelName
    self.present(trymodelVC, animated:true, completion:nil)
  }
}
