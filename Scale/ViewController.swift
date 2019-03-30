//
//  ViewController.swift
//  Scale
//
//  Created by Максим Алексеев on 10/11/2018.
//  Copyright © 2018 Pineapple team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Экземпляр весов(круги)
    @IBOutlet weak var scaleView: ScaleView!
    // Экземпляр label веса
    @IBOutlet weak var gramm: UILabel!
    // Экземпляр силы нажатия
    @IBOutlet weak var force: UILabel!
    override func viewDidLoad() {
        force.text = "Сила нажатия - 0%"
        gramm.text = "0 грамм"
    }
    // Функция взвешивания
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { // Из всех нажатий выбираем первое
            if #available(iOS 9.0, *) { // Провека на операционную систему
                if traitCollection.forceTouchCapability == UIForceTouchCapability.available { // Проверка на поддержку 3DTouch
                    if touch.force >= touch.maximumPossibleForce { // Если нажатие равно максимально считываемому
                        force.text = "100%+ force"
                        gramm.text = "385 грамм"
                    } else {
                        // Вычисления
                        let force = (touch.force / touch.maximumPossibleForce) * 100 // Вычисляем процент силы нажатия
                        let grams = force * 385 / 100 // Вычисления веса граммов
                        /*
                         Формуула
                         100% = 385 грамм
                         */
                        let roundGrams = Int(grams) // Округляем до целого значения, если оно будет типа Double
                        // Передаем значения в Label
                        gramm.text = "\(roundGrams) грамм"
                        
                    }
                }
            }
        }
    }
    // Обнуление значения, когда нажатие прекратится
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        force.text = "0% force"
        gramm.text = "0 грамм"
    }
}

