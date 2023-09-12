//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import Foundation
import SpriteKit

class FirefilesScene: SKScene {

    let confettiEmitter = SKEmitterNode(fileNamed: "WinWin.sks")

    override func didMove(to view: SKView) {
        guard let confettiEmitter = confettiEmitter else { return }
        addChild(confettiEmitter)
    }

    override func didChangeSize(_ oldSize: CGSize) {
        guard let confettiEmitter = confettiEmitter else { return }
        confettiEmitter.particlePosition = CGPoint(x: size.width/2, y: size.height/2)
        confettiEmitter.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}
