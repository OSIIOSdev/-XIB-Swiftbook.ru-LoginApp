//
//  GreatingViewController.swift
//  LoginApp
//
//  Created by OSIIOSdev on 06.04.2025.
//

import UIKit

final class GreetingViewController: UIViewController {

    // MARK: - @IBOutlets
    
    @IBOutlet var logOutButton: UIButton!
    
    
    // MARK: - Private properties
    
    var user = ""
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logOutButton.layer.cornerRadius = 10
    }
    
    // MARK: - Override methods
    
    
    // MARK: - @IBActions

    
    
    // MARK: - Private methods
    
}
