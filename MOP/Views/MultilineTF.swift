//
//  MultilineTF.swift
//  MOP
//
//  Created by user165103 on 3/15/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct MultilineTF : UIViewRepresentable {
    
    @Binding var txt : String
    
    func makeCoordinator() -> MultilineTF.Coordinator {
        return MultilineTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTF>) -> UITextView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.text = "Type..."
        tview.textColor = .gray
        tview.font = .systemFont(ofSize: 15)
        tview.delegate = context.coordinator
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTF>) {
        
    }
    
    class Coordinator : NSObject, UITextViewDelegate{
        
        var parent : MultilineTF
        
        init(parent1: MultilineTF){
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .label
        }
    }
}
