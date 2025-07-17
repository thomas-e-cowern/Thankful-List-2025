//
//  ThanksExportView.swift
//  Thankful-List-2025
//
//  Created by Thomas Cowern on 7/17/25.
//

import SwiftUI
import SwiftData

struct ThanksExportView: View {
    
    var thanks: [Thanks]
    
    
    var body: some View {
        VStack {
            ForEach(thanks) { thank in
                ThanksExportRowView(thanks: thank)
                Divider()
            }
            
//            Button("Export Thanks") {
//                let thanksPrintView = createPrintView(thanks: thanks)
//                let renderer = ImageRenderer(content: thanksPrintView)
//                renderer.render { size, renderer in
//                    var mediaBox = CGRect(origin: .zero,
//                                          size: CGSize(width: 800, height: 600))
//                    guard let consumer = CGDataConsumer(url: renderURL as CFURL),
//                          let pdfContext =  CGContext(consumer: consumer,
//                                                      mediaBox: &mediaBox, nil)
//                    else {
//                        return
//                    }
//                    pdfContext.beginPDFPage(nil)
//                    pdfContext.translateBy(x: mediaBox.size.width / 2 - size.width / 2,
//                                           y: mediaBox.size.height / 2 - size.height / 2)
//                    renderer(pdfContext)
//                    pdfContext.endPDFPage()
//                    pdfContext.closePDF()
//                }
//            }
        }
    }
}

#Preview {
    ThanksExportView(thanks: Thanks.sampleThanks)
}

private func createPrintView(thanks: [Thanks]) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        ForEach(thanks) { thanks in
            Text("I'm thankful for...")
            Text(thanks.title)
                .font(.title)
                .fontWeight(.bold)
            Text("Because...")
            Text(thanks.reason)
                .font(.title)
                .fontWeight(.bold)
        }
        Divider()
    }
    .multilineTextAlignment(.center)
    .frame(width: 200, height: 290)
}
