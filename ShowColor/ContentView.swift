//
//  ContentView.swift
//  ShowColor
//
//  Created by Raysharp666 on 2020/3/31.
//  Copyright © 2020 LyongY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        List {
            ForEach(UserData().data, id: \.self.0) { (element) in
                HStack {
                    Rectangle().fill(Color(element.1)).frame(width: 50, height: 50, alignment: .center)
                    Text("\(element.0)")
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
