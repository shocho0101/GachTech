//
//  ResultViewController.swift
//  GachTech
//
//  Created by 張翔 on 2018/03/31.
//  Copyright © 2018年 sho. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var haikeiImageView: UIImageView!
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    var monsterArray: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let number = Int(arc4random_uniform(10))
        
        for i in 1...10{
            monsterArray.append(UIImage(named: "monster" + String(format: "%03d", i) + ".png")!)
        }
        
        monsterImageView.image = monsterArray[number]
        
        if number == 9{
            haikeiImageView.image = UIImage(named: "bg_gold.png")
            commentLabel.text = "スーパーレア"
        }else if number > 6{
            haikeiImageView.image = UIImage(named: "bg_red.png")
            commentLabel.text = "レア"
        }else{
            haikeiImageView.image = UIImage(named: "bg_blue.png")
            commentLabel.text = "ノーマル"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = CABasicAnimation(keyPath: "transform")
        
        animation.fromValue = NSNumber(value: 0)
        
        animation.fromValue = NSNumber(value: 2 * Double.pi)
        
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        animation.duration = 5
        
        animation.repeatCount = Float.infinity
        
        haikeiImageView.layer.add(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(){
        dismiss(animated: true, completion: nil)
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
