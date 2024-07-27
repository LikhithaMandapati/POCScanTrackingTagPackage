//
//  ViewController.swift
//  POCScanTrackingTag
//
//  Created by Pradeep Buddharaju on 7/13/24.
//

import UIKit
//import CreditCardScanner
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var txtViewCapturedTag: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnScanBarcodeTapped(_ sender: Any) {
        /*
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        viewController.metadata.append(AVMetadataObject.ObjectType.qr)
        
        present(viewController, animated: true, completion: nil)
         */
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cameraVC = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        cameraVC.delegate = self
        present(cameraVC, animated: true, completion: nil)
    }
    
    @IBAction func btnScanTextTapped(_ sender: Any) {
        let creditCardScannerViewController = CreditCardScannerViewController(delegate: self)
        present(creditCardScannerViewController, animated: true)
    }
    
    
    
}

extension ViewController: CreditCardScannerViewControllerDelegate {
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
        viewController.dismiss(animated: true)
        print(error.errorDescription ?? "Unknown error")
    }
    
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
        // Do something with credit card info
        txtViewCapturedTag.text = card.number
        viewController.dismiss(animated: true)
        print("\(card)")
    }
}

extension ViewController: CameraViewControllerDelegate {
    func didFinishScanningBarcode(detectedCode: String) {
        txtViewCapturedTag.text = detectedCode
    }
}

/*
extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        controller.dismiss(animated: true, completion: nil)
        txtViewCapturedTag.text = code
        controller.reset()
    }
}

extension ViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

extension ViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
*/
