//
//  SocketIOManager.swift
//  halfsies
//
//  Created by Maxmillion McLaughlin on 9/24/16.
//  Copyright © 2016 Halfsies. All rights reserved.
//

import UIKit

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: "http://localhost:8888")!)
    
    override init() {
        super.init()
    }
    
    
    func establishConnection(withNickname: String) {
        socket.connect()
        
        socket.on("connect") {data, ack in
            print("socket connected")
            SocketIOManager.sharedInstance.loginUser(withNickname: withNickname)
        }
    }
    
    func closeConnection(completion: () -> Void) {
        socket.disconnect()
        
        socket.on("disconnect") {data, ack in
            print("socket disconnected")
        }
    }
    
    func loginUser(withNickname: String) {
        print(withNickname + " will login")

        socket.emit("loginUser", withNickname)
        
        socket.on("didLogin") {data, ack in
            print(withNickname + " is in the building")
            self.socket.emit("findMatch", withNickname)
        }
    }

}
