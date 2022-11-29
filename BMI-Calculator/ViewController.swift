//
//  ViewController.swift
//  BMI-Calculator
//
//  Created by 김지현 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var mainLabel: UILabel!
	@IBOutlet weak var heightTextField: UITextField!
	@IBOutlet weak var weightTextField: UITextField!
	@IBOutlet weak var calculateButton: UIButton!
	
	var bmiNumber: Double?
	var backgroundColor: UIColor?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUI()
	}
	
	func setUI() {
		heightTextField.delegate = self
		weightTextField.delegate = self
		
		mainLabel.text = "키와 몸무게를 입력해주세요."
		
		calculateButton.layer.cornerRadius = 5
		calculateButton.clipsToBounds = true
		calculateButton.setTitle("BMI 계산하기", for: .normal)
		
		heightTextField.placeholder = "cm단위로 입력해주세요."
		weightTextField.placeholder = "kg단위로 입력해주세요."
	}

	@IBAction func calculateButtonTapped(_ sender: UIButton) {
		// bmi 결과값을 뽑아냄
		self.bmiNumber = calculateBmi(height: heightTextField.text!, weight: weightTextField.text!)
	}
	
	func calculateBmi(height: String, weight: String) -> Double {
		
		guard let h = Double(height), let w = Double(weight) else { return 0.0 }
		var bmi = w / (h * h) * 10000
		// 소수점 버린뒤 반올림
		bmi = round(bmi * 10) / 10
		return bmi
		
	}
	
	func getBackgroundColor() -> UIColor {
		guard let bmi = bmiNumber else { return .black }
		
		switch bmi {
		case ..<18.6:
			return UIColor(red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
		case 18.6..<23.0:
			return UIColor(red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
		case 23.0..<25.0:
			return UIColor(red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
		case 25.0..<30.0:
			return UIColor(red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
		case 30.0...:
			return UIColor(red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
		default:
			return .black
		}
	}
	
	func getBmiAdviceString() -> String {
		guard let bmi = bmiNumber else { return "" }
		
		switch bmi {
		case ..<18.6:
			return "저체중"
		case 18.6..<23.0:
			return "표준"
		case 23.0..<25.0:
			return "과체중"
		case 25.0..<30.0:
			return "중도비만"
		case 30.0...:
			return "고도비만"
		default:
			return ""
		}
	}
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		
		if heightTextField.text == "" || weightTextField.text == "" {
			mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!"
			mainLabel.textColor = .red
			return false
		}
		
		mainLabel.text = "키와 몸무게를 입력해주세요."
		mainLabel.textColor = .black
		return true
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "toSecondVC" {
			let secondVC = segue.destination as! SecondViewController
			
			// 계산된 결과값을 다음화면으로 전달
			secondVC.bmiNumber = self.bmiNumber
			secondVC.backgroundColor = getBackgroundColor()
			secondVC.bmiAdviceString = getBmiAdviceString()
		}
		
		// 다음화면으로 가기전에 텍스트필드 비우기
		heightTextField.text = ""
		weightTextField.text = ""
		
	}
	
}

extension ViewController: UITextFieldDelegate {
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		if Int(string) != nil || string == "" { // 숫자이거나, 빈 문자일때
			return true // 글자 입력을 허용
		}
		return false // 글자 입력을 허용하지 않음
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		// 두개의 텍스트 필드 모두 종료
		if heightTextField.text != "", weightTextField.text != "" {
			weightTextField.resignFirstResponder() // 키보드 내리기
			return true
		// 첫번째만 종료
		} else if heightTextField.text != "" {
			weightTextField.becomeFirstResponder() // 두번째 텍스트 필드로 넘어감
			return true
		}
		return false
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		heightTextField.resignFirstResponder()
		weightTextField.resignFirstResponder()
	}
	
}
