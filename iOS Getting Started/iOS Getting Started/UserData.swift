// singleton object to store user data
//특정사용자의 데이터를 보유하기 위해 UserData 클래스 생성
import SwiftUI
class UserData : ObservableObject {
    private init() {}
    static let shared = UserData()

    @Published var notes : [Note] = []
    @Published var isSignedIn : Bool = false
}
// this is a test data set to preview the UI in Xcode
// prepareTestData 함수는 UI가 계속 업데이트됨에 따라 SwiftUI 미리보기를 계속 작동시키는데 사용된다.
@discardableResult
func prepareTestData() -> UserData {
    let userData = UserData.shared
    userData.isSignedIn = true
let desc = "this is a very long description that should fit on multiiple lines.\nit even has a line break\nor two."
let n1 = Note(id: "01", name: "Hello world", description: desc, image: "mic")
    let n2 = Note(id: "02", name: "A new note", description: desc, image: "phone")

    n1.image = Image(systemName: n1.imageName!)
    n2.image = Image(systemName: n2.imageName!)

    userData.notes = [ n1, n2 ]

    return userData
}
