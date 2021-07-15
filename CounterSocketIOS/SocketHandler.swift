//
//  SocketHandler.swift
//  CounterSocketIOS
//
//  Created by Thushen Mohanarajah on 2021-07-14.
//

import Foundation
import SocketIO

class SocketHandler: NSObject {
    static let sharedInstance = SocketHandler()
    let socket = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
    var mSocket: SocketIOClient!

    override init() {
        super.init()
        mSocket = socket.defaultSocket
    }

    func getSocket() -> SocketIOClient {
        return mSocket
    }

    func establishConnection() {
        mSocket.connect()
    }

    func closeConnection() {
        mSocket.disconnect()
    }
}
