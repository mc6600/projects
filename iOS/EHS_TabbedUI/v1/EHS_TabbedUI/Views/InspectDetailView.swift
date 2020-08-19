//
//  InspectDetailView.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 6/5/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import SwiftUI
import UIKit
import PDFKit


struct InspectDetailView: View {
    //let urlPath  = "https://ehsmetrics.thefacebook.com/RestController.php?api=getEhsUsers"
    //let sessionDelegate = SessionDelegate()
    let curDate = Date();
    let formatter = DateFormatter()
    //formatter.dateFormat = "dd.MM.yyyy"
    //let result = formatter.string(from: date)
        
    @State private var name: String = "John"
    @State private var email1: String = "EHSAdmin@fb.com"
    @State private var email2: String = ""
    @State private var auditDate: Date = Date()
    @State private var taskNumber: String = ""
    @State private var toggleStatus = false
    @State private var users: Array<FBUser2> = []
    @State private var items: Array<InspCheckItem> = []
    @State private var theDate: Date = Date()
    
    //@State private var exportURL:URL = ""
    @State private var showExportSheet = false
    @State private var showError = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        
        VStack (alignment: .center){
            Text("Submit Safety Inspection Checklist:")
                .font(.title)
            
            
            List{

                HStack{
                    Text( "Submitall Date: " + curDate.description)
                        .font(.headline)
                    Spacer()
                    Text( "Inspection Area: " + "Aquilia Lab")
                        .font(.headline)
                    Spacer()
                }
                HStack{
                    Text( "Type:   OFFICE" )
                        .font(.headline)
                    Spacer()
                    Text( "Office/Lab Name:   N/A" )
                        .font(.headline)
                    Spacer()
                }
                
                HStack{
                    Text( "Location: Argentina     ")
                        .font(.headline)
                    Text( "Building: Number 1    " )
                        .font(.headline)
                    Spacer()
                    Text("Submit By: ")
                        .font(.headline)
                    TextField("Enter inspector's name:", text:$name)
                        .font(.headline)

                }
                
                HStack{
                    DatePicker(selection: $theDate, in: ...Date(), displayedComponents: .date) {
                        Text("Audit Date")
                            .font(.headline)
                    }.frame(width: 400, height: 150)

                    Text("Audit Date is \(theDate, formatter: dateFormatter)")
                }
                

                // Are chemical storage areas free of debris/garbage?
                VStack{
                    // Checklist info comes from web service call to db
                    ChecklistItem( question:"Are chemical storage areas free of debris/garbage?",  id:"01" )
                            .font(.headline)
                    ChecklistItem( question:"Are employees using PPE where required (safety glasses, gloves)?", id:"02" )
                            //.font(.headline)
                    ChecklistItem( question:"Are electrical panels kept free of obstructions? (Need 36\" of clearance)", id:"03" )
                            //.font(.headline)
                    ChecklistItem( question:"Are fire extinguishers properly marked, labeled and hung?", id:"04" )
                            //.font(.headline)
                    Spacer()
                    Text("      ")
                }
              
                HStack{
                    Text( "Task Number: (Optional) " )
                        //.font(.headline)
                    TextField("Enter Number:", text:$taskNumber)
                    Spacer()
                }
                HStack{
                    Text( "Email to: (Optional) " )
                        //.font(.headline)
                    TextField("Enter email:", text:$email1)
                    Spacer()
                }
                HStack{
                    Text( "Email to: (Optional) " )
                        //.font(.headline)
                    TextField("Enter email:", text:$email2)
                    Spacer()
                }
                
                HStack{
                    // button to submit
                    Button(action: {
                        self.archiveInspectionInfo()
                    }) {
                        Text("Submit Inspection")
                            .padding(.all, 12)
                            .background(Color.blue)
                            .foregroundColor(.black)
                    }
                    .font(.headline)
                    .cornerRadius(40)
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: 250, alignment: .center)
                    
                    // button to generate report
                    Button(action: {
                        self.generatePdfReport()
                    }) {
                        Text("Generate PDF Report")
                            .padding(.all, 12)
                            .background(Color.blue)
                            .foregroundColor(.black)
                    }
                    .font(.headline)
                    .cornerRadius(40)
                    .buttonStyle(BorderlessButtonStyle())
                    .frame(width: 250, alignment: .center)
                }
                
            }   // List
        } // top VStack
    } // var view body
    
    func populateChecklistItems() -> Array<InspCheckItem>  {
        var items: Array<InspCheckItem> = []
        var item: InspCheckItem = InspCheckItem.init(id: "01", comment: "", ans: CheckAnswer.NA, question: "Are chemical storage areas free of debris/garbage?")
        items.append(item)
        item = InspCheckItem.init(id: "02", comment: "", ans: CheckAnswer.NO, question: "Are employees using PPE where required (safety glasses, gloves)?")
        items.append(item)
        item = InspCheckItem.init(id: "03", comment: "", ans: CheckAnswer.YES, question: "Are electrical panels kept free of obstructions? (Need 36\" of clearance)")
        items.append(item)
        item = InspCheckItem.init(id: "04", comment: "", ans: CheckAnswer.YES, question: "Are fire extinguishers properly marked, labeled and hung?")
        items.append(item)
        
        return items
    }
    
    
    // archive all state info and send to web service to record inspection
    func archiveInspectionInfo () {
        self.items = self.populateChecklistItems()
        
        print("\nSubmitting inspection...")
        print( " Inspector:   " + self.name )
        print( " Inspection area: Aquilia Lab " )
        print( " Type: OFFICE" )
        print( " Location: Argentina: (BAI0001) ")
        print( " Building:   Building Number 1" )
        print( " Office/Lab name: N/A ")
        
        print( " Audit date:   " + self.auditDate.description )
        print( " Inspection date: " + self.theDate.description )
        print( " Task No: " + self.taskNumber )
        print( " Email1:   " + self.email1 )
        print( " Email2:   " + self.email2 )
        
        // Iterate thru items: Array<InspCheckItem>
        for i in 0..<self.items.count {
            print( self.items[i].id + " " + self.items[i].question )
            print( self.items[i].ans )
            //print( self.items[i].comment )
        }
    }
    
    func generatePdfReport() {
        // now we got the scrape of inspection info, and we want to generate a report based on that
        print("Generating report....")
        
        self.exportToPDF()
    }
    
    func exportToPDF() {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let outputFileURL = documentDirectory.appendingPathComponent("SwiftTest.pdf")

        //Normal with
        let width: CGFloat = 8.5 * 72.0
        //Estimate the height of your view
        let height: CGFloat = 1000
        let charts = InspectionView()

        let pdfVC = UIHostingController(rootView: charts )
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
                
                print("PDF doc created  " )

            }catch {
              self.showError = true
              print("Could not create PDF file: \(error)")
            }
        }

        //pdfVC.removeFromParent()
        //pdfVC.view.removeFromSuperview()
    }

}  // struct

struct InspectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InspectDetailView()
    }
}
