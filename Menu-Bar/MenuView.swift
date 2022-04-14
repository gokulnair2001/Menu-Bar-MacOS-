//
//  MenuView.swift
//  Menu-Bar
//
//  Created by Gokul Nair on 14/04/22.
//

import SwiftUI

struct MenuView: View {

    @Namespace var animation
    @State var currenTab = "Uploads"
    
    var body: some View {
        VStack {
            HStack {
                TabButton(title: "Help", currentTab: $currenTab, animation: animation)
                
                TabButton(title: "Uploads", currentTab: $currenTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Image(systemName: "tray.fill")
                .resizable()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
                .padding(40)
            
            HStack(spacing: 2) {
                Text("Export your work..")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                
                Button{
                    
                }label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                    
                }.buttonStyle(PlainButtonStyle())
            }
            
            Spacer(minLength: 25)
            
            Divider()
                .padding(.top, 4)
            
            HStack {
                Image("DP")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                Text("Gokul Nair")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Spacer(minLength: 0)
                
                Button{
                    
                }label: {
                    Image(systemName: "gear")
                        .foregroundColor(.primary)
                    
                }.buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
            
        }
        .frame(width: 250, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct TabButton: View {
    
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }) {
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .primary)
                .padding(.vertical, 4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        
                        if currentTab == title {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                        else {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary, lineWidth: 0.6)
                        }
                    }
                ).contentShape(RoundedRectangle(cornerRadius: 4))
        }.buttonStyle(PlainButtonStyle())
    }
}
