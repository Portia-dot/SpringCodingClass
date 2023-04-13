//
//  progressBar.swift
//  EggTimer
//
//  Created by Oluwayomi M on 2023-04-13.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CircularProgressBar: UIView {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularProgressBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularProgressBar()
    }
    
    func setupCircularProgressBar() {
        // Add your custom drawing code for the circular progress bar here
    }
}

