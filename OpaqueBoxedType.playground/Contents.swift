import UIKit

import SwiftUI

enum ViewTypes {
   case Simple
   case Awesome
}
struct ContentView: View {
    //'some' types are only permitted in properties, subscripts, and functions
    // error here
   // typealias Body = some View
    
    var body: some View {
        VStack {
            displayViewFor(viewType: .Awesome)
            displayViewFor(viewType: .Simple)
        }
    }
    
    @ViewBuilder
    func displayViewFor(viewType: ViewTypes) -> some View {
        if(viewType == .Awesome) {
            AwesomeView()
        } else {
             SimpleView()
        }
    }
}

struct AwesomeView: View {
    var body: some View {
        Text("Awesome View")
                   .font(.title)
                   .padding()
                   .background(Color.yellow)
                   .cornerRadius(10)
                   .shadow(radius: 5)
    }
}

struct SimpleView: View {
    var body: some View {
        Text("Simpl;e View")
                   .font(.title)
                   .padding()
                   .background(Color.yellow)
                   .cornerRadius(10)
                   .shadow(radius: 5)
    }
}
