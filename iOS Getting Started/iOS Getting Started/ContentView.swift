//
//  ContentView.swift
//  iOS Getting Started
//
//  Created by 김솔아 on 2023/06/09.
//
import SwiftUI
// a view to represent a single list item
struct ListRow: View {
    @ObservedObject var note : Note
var body: some View {
    ZStack {
            if (userData.isSignedIn) {
                NavigationView {
                    List {
                        ForEach(userData.notes) { note in
                            ListRow(note: note)
                        }
                    }
                    .navigationBarTitle(Text("Notes"))
                    .navigationBarItems(leading: SignOutButton())
                }
            } else {
                SignInButton()
            }
        }
    }
}
// this is the main view of our app,
// it is made of a Table with one line per Note
struct ContentView: View {
    @ObservedObject private var userData: UserData = .shared

    var body: some View {
        List {
            ForEach(userData.notes) { note in
ListRow(note: note)
            }
        }
    }
}
// this is use to preview the UI in Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        prepareTestData()

        return ContentView()
    }
}

struct SignInButton: View {
    var body: some View {
        Button(
            action: {
                Task { await Backend.shared.signIn() }
            },
            label: {
                HStack {
                    Image(systemName: "person.fill")
                        .scaleEffect(1.5)
                        .padding()
                    Text("Sign In")
                        .font(.largeTitle)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(30)
            }
        )
    }
}
struct SignOutButton : View {
    var body: some View {
        Button(
            action: {
                Task { await Backend.shared.signOut() }
            },
            label: { Text("Sign Out") }
        )
    }
}
