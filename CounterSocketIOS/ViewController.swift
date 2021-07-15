//
//  ViewController.swift
//  CounterSocketIOS
//
//  Created by Thushen Mohanarajah on 2021-07-13.
//

import UIKit

class ViewController: UIViewController {
    
    var mSocket = SocketHandler.sharedInstance.getSocket()
    @IBOutlet weak var labelCounter: UILabel!
    
    
    @IBAction func btnCounter(_ sender: Any) {
        mSocket.emit("counter")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SocketHandler.sharedInstance.establishConnection()
        
        mSocket.on("counter") { ( dataArray, ack) -> Void in
            let dataReceived = dataArray[0] as! Int
            self.labelCounter.text = "\(dataReceived)"
        }
    }
}
