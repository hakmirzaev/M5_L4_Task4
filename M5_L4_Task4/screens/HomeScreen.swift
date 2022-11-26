//
//  HomeScreen.swift
//  M5_L4_Task4
//
//  Created by Bekhruz Hakmirzaev on 26/11/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var showAlert = false
    @State var showAction = false
    var action: ActionSheet {
        let title = "iOS"
        let message = "Here we go"
        return ActionSheet(title: Text(title), message: Text(message), buttons: [
            .default(Text("OK")){ },
            .destructive(Text("NO")){ }
        ])
    }
    var body: some View {
        TabView{
            Button(action: {
                showAlert = true
            }, label: {
                Text("Alert Dialog")
            }).alert(isPresented: $showAlert, content: {
                let title = "iOS"
                let message = "Here we go"
                return Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("NO")){ }, secondaryButton: .default(Text("OK")){ })
            })
            .tabItem({
                Image(systemName: "circle")
                Text("Alert")
            })
            Button(action: {
                showAction = true
            }, label: {
                Text("Action Sheet")
            }).actionSheet(isPresented: $showAction, content: {self.action})
            .tabItem({
                Image(systemName: "circle")
                Text("Sheet")
            })
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
