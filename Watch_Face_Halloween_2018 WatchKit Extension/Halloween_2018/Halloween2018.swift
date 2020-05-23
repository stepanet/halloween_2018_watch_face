//
//  Halloween2018.swift
//  Watch_Face_Halloween_2018 WatchKit Extension
//
//  Created by Michal on 29/10/2018.
//  Copyright © 2018 Michal Tynior. All rights reserved.
//

import Foundation
import SpriteKit

public final class Halloween2018: SKScene {
    
    let textureAtlas = SKTextureAtlas(named: "halloween2018")
    
    let calendar = Calendar.current
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter
    }()
    
    lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    public override convenience init() {
        self.init(fileNamed: "Halloween2018")!
    }
    
    public override func sceneDidLoad() {
        guard let faceNode = childNode(withName: "Face"),
            let backgroundNode = faceNode.childNode(withName: "Background") as? SKSpriteNode,
            let labelTimeNode = faceNode.childNode(withName: "Time") as? SKLabelNode,
            let labelDateNode = faceNode.childNode(withName: "Date") as? SKLabelNode,
            let witchNode = faceNode.childNode(withName: "Witch") as? SKSpriteNode,
            let witchNode2 = faceNode.childNode(withName: "Witch2") as? SKSpriteNode,
            let witchNode3 = faceNode.childNode(withName: "Witch3") as? SKSpriteNode else {
                return
        }
        
        backgroundNode.texture = textureAtlas.textureNamed("background")
        labelTimeNode.fontName = "LakkiReddy"
        labelDateNode.fontName = "LakkiReddy"
        
        witchNode.texture = textureAtlas.textureNamed("witch")
        witchNode.run(animateWitch(node: witchNode))
        
        witchNode2.texture = textureAtlas.textureNamed("witch2")
        witchNode2.run(animateWitch(node: witchNode2))
        
        witchNode3.run(animateWitch2(node: witchNode3))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        updateTime()
    }
    
    private func updateTime() {
        guard let faceNode = childNode(withName: "Face"),
            let labelTimeNode = faceNode.childNode(withName: "Time") as? SKLabelNode,
            let labelDateNode = faceNode.childNode(withName: "Date") as? SKLabelNode else {
                return
        }
        
        let now = Date()
        let time = timeFormatter.string(from: now)
        labelTimeNode.text = time
        labelTimeNode.fontSize = fontSizeFor(text: time)
        labelDateNode.text = dateFormatter.string(from: now)
    }
    
    private func animateWitch(node: SKNode) -> SKAction {
        let moveRight = SKAction.moveTo(x: self.frame.maxX + node.frame.width, duration: TimeInterval(Int.random(in: 0 ..< 15)))
        let rotateLeft = SKAction.scaleX(to: -node.xScale, duration: 0)
        let moveLeft = SKAction.moveTo(x: (self.frame.minX - node.frame.width), duration: TimeInterval(Int.random(in: 0 ..< 15)))
        let rotateRight = SKAction.scaleX(to: node.xScale, duration: 0)
        let moveLoop = SKAction.sequence([moveRight, rotateLeft, moveLeft, rotateRight])
        return SKAction.repeatForever(moveLoop)
    }
    
    private func animateWitch2(node: SKNode) -> SKAction {
        //let moveDown = SKAction.moveTo(y: self.frame.maxY - node.frame.height, duration: TimeInterval(Int.random(in: 0 ..< 15)))
        //let moveUp = SKAction.moveTo(y: self.frame.maxY + node.frame.height, duration: TimeInterval(Int.random(in: 0 ..< 15)))
        let ZoomIn = SKAction.scale(to: CGSize(width: 40, height: 40), duration: 10)
        let ZoomOut = SKAction.scale(to: CGSize(width: 0, height: 0), duration: 10)
        let moveLoop = SKAction.sequence([ZoomIn,ZoomOut])
        return SKAction.repeatForever(moveLoop)
    }
    
    private func fontSizeFor(text: String) -> CGFloat {
        switch text.count {
        case 0...5: return 28
        case 6...7: return 24
        case 8: return 19
        default: return 18
        }
    }
    
}
