//
//  ContentView.swift
//  BucketList
//
//  Created by Antonio Vega on 8/10/21.
//

import SwiftUI

struct ContentView: View {
    var loadingState = LoadingState.loading
    
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
