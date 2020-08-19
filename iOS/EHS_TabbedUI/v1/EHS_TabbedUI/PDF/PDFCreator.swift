//
//  PDFCreator.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 7/2/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import PDFKit
import UIKit
import SwiftUI
//import ChartView

class PDFCreator: NSObject {
        
    func createFlyer() -> Data {
      // 1
      let pdfMetaData = [
        kCGPDFContextCreator: "Facebook EHS",
        kCGPDFContextAuthor: "Ming Chen"
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]

      // 2
      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

      // 3
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      // 4
      let data = renderer.pdfData { (context) in
        // 5
        context.beginPage()
        // 6
        let attributes = [
          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
        ]
        let text = "I'm a PDF! blahb;lahknklndfgb"
        text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
      }

      return data
    }

}
