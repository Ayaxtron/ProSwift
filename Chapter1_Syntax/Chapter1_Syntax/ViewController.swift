//
//  ViewController.swift
//  Chapter1_Syntax
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 19/11/20.
//  Copyright © 2020 Ayax Alexis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let usuario1 = (name:"Ayax", password: "Alexis")
        let usuario2 = (name:"Alejandro", password: "Arteaga")
        let usuario3 = (name:"Roman", password: "Omar")
        let usuarios = [usuario1, usuario2, usuario3]
        
        for usuario in usuarios {
            print(usuario.name)
        }
        
    }


}

