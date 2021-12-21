//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Birkan Pusa on 21.12.2021.
//

import UIKit
import LocalAuthentication //kimlik doğrulama için import

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //butona tıklandığı zaman ne olacak
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let authContext = LAContext() //
        
        var error : NSError? //fonksiyona error tanımlamak için error tipinde obje oluşturduk
        
        
        
        //parmakizi veya yüze göre doğrulama
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            //biometrik veri kontrolü yaptırdık
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you ?") { success, error in
                //eğer faceid eşleşiyorsa
                if success == true {
                    //oldu
                    DispatchQueue.main.async { //main threadda çalıştırdık
                    self.performSegue(withIdentifier: "toSecondVC", sender: nil) //butona tıklayınca tosecondVC'ye gönderdik
                        self.myLabel.text = "Login succesfull"
                    }
                }else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "error"
                    }
                    
                }
            }
        }
            
    }
    
}

