//
//  ViewController.swift
//  Alertes
//
//  Created by Rodolphe DUPUY on 25/08/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var actionSheetBtn: UIButton! // Cas de l'iPad

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Les Alertes
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Notre première alerte", message: "Youpi vous avez montré votre premiere alerte", preferredStyle: .alert)
 
        let actionOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Bouton appuyé")
        }
        let actionCancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        let actionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { (action) in
            self.view.backgroundColor = .red
        }
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        alertController.addAction(actionDestructive)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    // Les ActionSheet
    @IBAction func actionSheet(_ sender: Any) {
        let actionSheetController = UIAlertController(title: "Changer de BG", message: "Choisir votre couleur", preferredStyle: .actionSheet)

        let white = UIAlertAction(title: "Blanc", style: .default) { (action) in
            self.view.backgroundColor  = .white
        }
        let blue = UIAlertAction(title: "Bleu", style: .default) { (action) in
            self.view.backgroundColor = .blue
        }
        let orange = UIAlertAction(title: "Orange", style: .default) { (action) in
            self.view.backgroundColor = .orange
        }

        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)

        actionSheetController.addAction(white)
        actionSheetController.addAction(blue)
        actionSheetController.addAction(orange)
        
        actionSheetController.addAction(cancel)

        if UIDevice.current.userInterfaceIdiom == .pad { // Cas de l'iPad
            actionSheetController.popoverPresentationController?.sourceView = self.actionSheetBtn
            actionSheetController.popoverPresentationController?.permittedArrowDirections = [.left, .right]
            actionSheetController.popoverPresentationController?.canOverlapSourceViewRect = true
        }

        present(actionSheetController, animated: true, completion: nil)
    }
    
}

