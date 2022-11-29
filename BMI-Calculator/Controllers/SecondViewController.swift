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
	
	var bmiNumber: Double?
	var backgroundColor: UIColor?
	var bmiAdviceString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
		setUI()
    }
    
	func setUI() {
		bmiNumberLabel.clipsToBounds = true
		bmiNumberLabel.layer.cornerRadius = 8
		bmiNumberLabel.backgroundColor = .gray
		
		backButton.clipsToBounds = true
		backButton.layer.cornerRadius = 5
		
		guard let bmiNumber = bmiNumber else { return }
		bmiNumberLabel.text = String(bmiNumber)
		
		bmiNumberLabel.backgroundColor = self.backgroundColor
		adviceLabel.text = self.bmiAdviceString
	}
	
	@IBAction func backButtonTapped(_ sender: UIButton) {
		self.dismiss(animated: true)
	}

}
