//
//  ProductDetailsViewController.swift
//  BUXAssignment
//
//  Created by Vladimir Ionița on 15/11/2017.
//  Copyright © 2017 Vladimir Ionița. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    var output: ProductDetailsViewOutput!
    
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var closingPriceLabel: UILabel!
    @IBOutlet var currentPriceLabel: UILabel!
    @IBOutlet var roiLabel: UILabel!
    
    // MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
        setupInitialState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        output.viewWillDisappear()
    }
}

// MARK: - ProductDetailsViewInput
extension ProductDetailsViewController: ProductDetailsViewInput {
    func populateProductDetails(productName: String, closingPrice: String, currentPrice: String, roi: String, roiIsPositive: Bool) {
        productNameLabel.text = productName
        closingPriceLabel.text = closingPrice
        updateCurrentPriceAndRoi(currentPrice: currentPrice,
                                 roi: roi,
                                 roiIsPositive: roiIsPositive)
    }
    
    func updateCurrentPriceAndRoi(currentPrice: String, roi: String, roiIsPositive: Bool) {
        currentPriceLabel.text = currentPrice
        roiLabel.text = roi
        roiLabel.textColor = roiIsPositive ? UIColor.bxGreen : UIColor.bxRed
    }
}

// MARK: - Private Methods
private extension ProductDetailsViewController {
    func setupInitialState() {
        customizeNavigationBarTitle()
        customizeNavigationBarBackButton()
        
        localize()
    }
    
    func customizeNavigationBarTitle() {
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(withRGBWhite: 87, alpha: 199),
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Regular", size: 20)!
        ]
    }
    
    func customizeNavigationBarBackButton() {
        self.navigationController?.navigationBar.tintColor = UIColor(withRGBWhite: 87, alpha: 199)
    }
    
    func localize() {
        self.navigationItem.title = NSLocalizedString("PRODUCT_DETAILS_TITLE", comment: "Screen title")
    }
}
