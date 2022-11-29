//
//  SecondViewController.swift
//  BMI-Calculator
//
//  Created by 김지현 on 2022/11/28.
//

import UIKit

class SecondViewController: UIViewController {
	
	@IBOutlet weak var bmiNumberLabel: UILabel!
	@IBOutlet weak var adviceLabel: UILabel!
	@IBOutlet weak var backButton: UIButton!
	
	var bmi: Bmi?

    override func viewDidLoad() {
        super.viewDidLoad()
		setUI()
		setData()
    }
    
	func setUI() {
		bmiNumberLabel.clipsToBounds = true
		bmiNumberLabel.layer.cornerRadius = 8
		bmiNumberLabel.backgroundColor = .gray
		
		backButton.clipsToBounds = true
		backButton.layer.cornerRadius = 5
	}
	
	func setData() {
		if let bmi = bmi {
			bmiNumberLabel.text = "\(bmi.value)"
			
			bmiNumberLabel.backgroundColor = bmi.matchColor
			adviceLabel.text = bmi.advice
		}
	}
	
	@IBAction func backButtonTapped(_ sender: UIButton) {
		self.dismiss(animated: true)
	}

}
