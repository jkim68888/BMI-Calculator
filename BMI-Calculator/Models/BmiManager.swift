//
//  BmiManager.swift
//  BMI-Calculator
//
//  Created by 김지현 on 2022/11/29.
//

import UIKit

struct BmiManager {
	
	var bmiNumber: Double?
	
	func getBmiResult() -> Double? {
		return bmiNumber
	}
	
	// self를 구조체에서 쓰기 위한 mutating 키워드
	mutating func calculateBmi(height: String, weight: String) {
		guard let h = Double(height), let w = Double(weight) else {
			self.bmiNumber = 0.0
			return
		}
		var bmi = w / (h * h) * 10000
			// 소수점 버린뒤 반올림
		self.bmiNumber = round(bmi * 10) / 10
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
}
