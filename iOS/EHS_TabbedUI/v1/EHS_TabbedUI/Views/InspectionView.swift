//
//  InspectionView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 2/24/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI
import PDFKit


struct InspectionView: View {
    //@State var toggleStatus = false
    @State private var showExportSheet = false
    @State private var showError = false
    
    var insp1: EhsInspection = EhsInspection.init(type: "1 LAB   ", location: "US - CA: Menlo Park 41 (Lab) (MPK0041)", area: "Aquilia Lab  ", building: "MPK-41" )
    var insp2: EhsInspection = EhsInspection.init(type: "2 LAB   ", location: "US - CA: Menlo Park 41 (Lab) (MPK0041)", area: "Main Building", building: "MPK-41" )
    var insp3: EhsInspection = EhsInspection.init(type: "3 OFFICE", location: "Argentina: Buenos Aires (BAI0001)     ", area: "Tucuman No 1 ", building: "Building 1" )
    var insp4: EhsInspection = EhsInspection.init(type: "4 OFFICE", location: "Canada - BC: Vancouver (VAN0200)      ", area: "Office", building: "661 University Ave" )
    
    var body: some View {
            VStack {
                
                List{
                    Text("Available Checklists:")
                    .font( .largeTitle)
                    
                        Spacer()
                    
                        HStack{
                            Text( insp1.type + ": " + insp1.location )
                            Text( insp1.building + ", " + insp1.area  )
                                .bold()
                                .italic()
                            
                            Text( "Submit Inspection")
                                .underline()
                            
                            /*
                             
                             NavigationLink(destination: InspectDetailView()) {
                                 Text("submit")
                                     .bold()
                                     .font(.headline)
                             }.navigationBarTitle("Nav")
                             
                             NavigationView {
                                HStack {
                                    Text("Submit")
                                    NavigationLink(destination: InspectDetailView() ) {
                                        Text("Submit")
                                    }
                                }
                            }*/

                        }
                        HStack{
                            Text( insp2.type + ": " + insp2.location )
                            Text( insp2.building + ", " + insp2.area  )
                                .bold()
                                .italic()
                            
                            Text( "Submit Inspection")
                                .underline()

                        }
                        HStack{
                            Text( insp3.type + ": " + insp3.location )
                            Text(  insp3.building + ", " + insp3.area  )
                                .bold()
                                .italic()
                            
                            Text( "Submit Inspection")
                                .underline()

                        }
                        HStack{
                            Text( insp4.type + ": " + insp4.location )
                            Text(  insp4.building + ", " + insp4.area  )
                                .bold()
                                .italic()
                            
                            Text( "Submit Inspection")
                                .underline()

                        }

                    
                    Spacer()
                    
                    
                    Button(action:{
                        //self.exportToPDF()
                        
                        // generate pdf
                        print("Export to PDF")
                    })
                    {
                        Text("Export to PDF")
                            .font(.title)
                            //.alignmentGuide(.center)
                    }
                    
                    
                } // List
                

        }
    }
    
    func show() {
        print("Inspection View")
        
    }
    
    func exportToPDF() {
        /*
           let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           let outputFileURL = documentDirectory.appendingPathComponent("SwiftUI.pdf")

           //Normal with
           let width: CGFloat = 8.5 * 72.0
           //Estimate the height of your view
           let height: CGFloat = 1000
           let charts = PDFUIView()

           let pdfVC = UIHostingController(rootView: self )
           pdfVC.view.frame = CGRect(x: 0, y: 0, width: width, height: height)

           //Render the view behind all other views
           let rootVC = UIApplication.shared.windows.first?.rootViewController
           rootVC?.addChild(pdfVC)
           rootVC?.view.insertSubview(pdfVC.view, at: 0)

           //Render the PDF
           let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 8.5 * 72.0, height: height))
           DispatchQueue.main.async {
               do {
                 try pdfRenderer.writePDF(to: outputFileURL, withActions: { (context) in
                     context.beginPage()
                     pdfVC.view.layer.render(in: context.cgContext)
                 })

                 //self.exportURL = outputFileURL
                 self.showExportSheet = true

               }catch {
                 self.showError = true
                 print("Could not create PDF file: \(error)")
               }
           }

           pdfVC.removeFromParent()
           pdfVC.view.removeFromSuperview()
            */
       } // exportTOPDF()

}

struct InspectionView_Previews: PreviewProvider {
    static var previews: some View {
        InspectionView()
    }
}
