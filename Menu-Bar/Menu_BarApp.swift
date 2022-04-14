//
//  Menu_BarApp.swift
//  Menu-Bar
//
//  Created by Gokul Nair on 14/04/22.
//

import SwiftUI

@main
struct Menu_BarApp: App {
    // Connecting app delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
 
class AppDelegate: NSObject, NSApplicationDelegate {
    
    // Status Bar Item
    var statusItem: NSStatusItem?
    //Popover
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification:  Notification) {
        
        //Menu View
        let menuView = MenuView()
        
        //Creating PopOver
        popOver.behavior = .transient
        popOver.animates = true
        // Settings Empty View Controller
        // And Setting View as SwiftUI View
        // with the help of Hosting Controller
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        // Creating Status Bar Button...
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Safe Check if status Button is Available or not..
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "link.icloud", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    @objc func MenuButtonToggle() {
        
        if let menuButton = statusItem?.button {
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }
}
