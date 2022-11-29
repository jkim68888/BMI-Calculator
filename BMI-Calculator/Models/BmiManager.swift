//
//  BmiManager.swift
//  BMI-Calculator
//
//  Created by 김지현 on 2022/11/29.
//

import UIKit

struct BmiManager {
	
	private var bmi: Bmi?
	
	// self를 구조체에서 쓰기 위한 mutating 키워드
	mutating func getBmiResult(height: String, weight: String) -> Bmi {
		calculateBmi(height: height, weight: weight)
		return bmi ?? Bmi(value: 0.0, matchColor: .white, advice: "문제 발생")
	}
	
	mutating func calculateBmi(height: String, weight: String) {
		guard let h = Double(height), let w = Double(weight) else {
			bmi = Bmi(value: 0.0, matchColor: .white, advice: "문제 발생")
			return
		}
		
		var bmiNumber = w / (h * h) * 10000
			// 소수점 버린뒤 반올림
		bmiNumber = round(bmiNumber * 10) / 10
		
		switch bmiNumber {
		case ..<18.6:
			let color = UIColor(red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
			bmi = Bmi(value: bmiNumber, matchColor: color, advice: "저체중")
		case 18.6..<23.0:
			let color = UIColor(red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
			bmi = Bmi(value: bmiNumber, matchColor: color, advice: "저체중")
		case 23.0..<25.0:
			let color = UIColor(red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
			bmi = Bmi(value: bmiNumber, matchColor: color, advice: "저체중")
		case 25.0..<30.0:
			let color = UIColor(red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
			bmi = Bmi(value: bmiNumber, matchColor: color, advice: "저체중")
		case 30.0...:
			let color = UIColor(red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
			bmi = Bmi(value: bmiNumber, matchColor: color, advice: "저체중")
		default:
			bmi = Bmi(value: 0.0, matchColor: .white, advice: "문제 발생")
		}
	}
	
}
