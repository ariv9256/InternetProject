//
//  InternetDetailViewController.swift
//  InternetProject
//
//  Created by Rivas, Angela on 12/14/18.
//  Copyright © 2018 CTEC CSP. All rights reserved.
//

import UIKit
import WebKit

class InternetDetailViewController: UIViewController
{
    
    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILable!
    
    var detailTitle: String?
    {
        didSet
        {
                updateView()
        }
    }
    
    var detialAddress : String?
    {
        didSet
        {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func udpateView() -> Void
    {
        if (detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if(detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                loadPDF()
            }
            else
            {
                if(detialAddress != nil)
                {
                    loadURL(webAdress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        
        udpateView()
    }
    
    private func loadURL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "networking internet topics programming ", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestedPDF = NSURLRequst(url: contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
