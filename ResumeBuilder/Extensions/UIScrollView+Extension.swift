import Foundation
import UIKit

extension UIScrollView {
    func createPDF() -> URL {
        let priorBounds = self.bounds
        let fittedSize = self.sizeThatFits(CGSize(width:priorBounds.size.width, height: self.contentSize.height))
        
        self.bounds = CGRect(x:0, y:0, width:fittedSize.width, height: fittedSize.height)
        let pdfPageBounds = CGRect(x:0, y:0, width: self.frame.width, height: self.frame.height)
        let pdfData = NSMutableData()
        
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageBounds,nil)
        var pageOriginY: CGFloat = 0

        while pageOriginY < fittedSize.height {
            UIGraphicsBeginPDFPageWithInfo(pdfPageBounds, nil)
            UIGraphicsGetCurrentContext()!.saveGState()
            UIGraphicsGetCurrentContext()!.translateBy(x: 0, y: -pageOriginY)
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
            UIGraphicsGetCurrentContext()!.restoreGState()
            pageOriginY += pdfPageBounds.size.height
        }
        
        UIGraphicsEndPDFContext()
        self.bounds = priorBounds
        var docURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        docURL = docURL.appendingPathComponent("Resume.pdf")
        pdfData.write(to: docURL as URL, atomically: true)
        print("URL:", docURL)
        
        return docURL
     }
}
