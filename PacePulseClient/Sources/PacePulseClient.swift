import Foundation
import Supabase

typealias Client = SupabaseClient

let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxsZmlnaXl6amxhZ3FhYm9zemhvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkxOTcxMDksImV4cCI6MjA2NDc3MzEwOX0.ZDsjxT7Fjelx28KZq1nbBqUYEWnCvedR0-SqJQF-uxU"

public class PacePulseClient {
    
    private let client: Client
    
    
    init() {
        client = Client(supabaseURL: URL(string: "https://llfigiyzjlagqaboszho.supabase.co")!, supabaseKey: apiKey)
    }
    
    public func signInWithEmail(email: String, password: String) async -> Bool {
        return true
    }
    
    public func signOut() async -> Bool {
        do {
            try await client.auth.signOut()
            return true
        } catch {
            print("SignOut error => ", error.localizedDescription)
            return false
        }
    }
    
    public func signUpWithEmail(email: String, password: String) async -> Bool {
        do {
            let response = try await client.auth.signUp(email: email, password: password)
            print("SignIn Response => ", response)
        } catch {
            print(error.localizedDescription)
            return false
        }
        return true
    }
}
