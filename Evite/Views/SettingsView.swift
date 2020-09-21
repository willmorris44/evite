//
//  SettingsView.swift
//  Evite
//
//  Created by Will morris on 9/21/20.
//  Copyright © 2020 william. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ScrollView {
            
            Group {
                HStack {
                    Text("ACCOUNT")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.caption)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                SettingsRowView(title: "Manage Account")
                SettingsRowView(title: "Privacy")
                SettingsRowView(title: "Security")
                SettingsRowView(title: "Share profile")
            }
            
            Divider()
            
            Group {
                HStack {
                    Text("CONTENT & ACTIVITY")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.caption)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                SettingsRowView(title: "Push notifications")
                SettingsRowView(title: "Dark mode")
                SettingsRowView(title: "Accessibility")
            }
            
            Divider()
            
            Group {
                HStack {
                    Text("SUPPORT")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.caption)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                SettingsRowView(title: "Report a problem")
                SettingsRowView(title: "Help Center")
                SettingsRowView(title: "Saftey Center")
            }
            Divider()
            
            Group {
                HStack {
                    Text("ABOUT")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .font(.caption)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                SettingsRowView(title: "Community Guidelines")
                SettingsRowView(title: "Terms of Use")
                SettingsRowView(title: "Privacy Policy")
                SettingsRowView(title: "Copyright Policy")
            }
            
            Divider()
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Log out")
                        .foregroundColor(.black)
                })
                .padding(.bottom)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .navigationBarTitle("Settings and privacy", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            .frame(width: 50, height: 30)
                            .offset(x: -15)
                    })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
