//
//  DetailsView.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 24.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var characterData : CharacterModel
    @State private var name : String = ""
    @State private var status : String = ""
    @State private var specy : String = ""
    @State private var gender : String = ""
    @State private var origin : String = ""
    @State private var location : String = ""
    @State private var episodes : String = ""
    @State private var createdTime : Date = Date()
    @State private var visibleTime : String =  ""
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                AsyncImage(url: URL(string: characterData.image)) { image in
                    image
                        .resizable()
                        .frame(width: 275, height: 275)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 50)
                } placeholder: {
                    ProgressView()
                }
                
                HStack(alignment: .top){
                    VStack{
                        Text("Status:")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Specy:")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Gender:")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Origin:")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Location")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Episodes")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text("Created at\n(in API):")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                            .padding(.bottom, 17.5)
                    }
                        
                    
                    VStack{
                        Text(status)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(specy)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(gender)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(origin)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(location)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(episodes)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                        Text(visibleTime)
                            .font(.custom("Avenir", size: 22))
                            .padding(.horizontal,20)
                            .padding(.vertical, 2.5)
                            .padding(.bottom, 17.5)
                    }
                }
            }
            
            
            
            
            
                .navigationTitle("\(name)")
        }
        
                .onAppear{
                    name = characterData.name
                    status = characterData.status
                    specy = characterData.species
                    gender = characterData.gender
                    origin = characterData.origin.name
                    location = characterData.location.name
                    
                    characterData.episode.forEach { str in
                        var episodeNum = str.suffix(2)
                        if(episodeNum.contains("/")){
                            episodeNum = str.suffix(1)
                        }
                        episodes.append("\(episodeNum), ")
                    }
                    episodes.removeLast()
                    episodes.removeLast()
                    
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "en_US_POSIX")
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    
                    createdTime = formatter.date(from: characterData.created) ?? Date()
                    visibleTime.append("\(createdTime.formatted(.dateTime.day())) ")
                    visibleTime.append("\(createdTime.formatted(.dateTime.month())) ")
                    visibleTime.append("\(createdTime.formatted(.dateTime.year())) ")
                    
                    //Cock Formatting
                    let hourAMPM = createdTime.formatted(.dateTime.hour().minute().second())
                    let hour24 : String = timeConversion24(time12: hourAMPM)
                    visibleTime.append(hour24)
                    
                }
    }
    
    //AM-PM to 24Hour System
    func timeConversion24(time12: String) -> String {
        let dateAsString = time12
        let df = DateFormatter()
        df.dateFormat = "ahh:mm:ss"

        let date = df.date(from: dateAsString)
        df.dateFormat = "HH:mm:ss"

        let time24 = df.string(from: date!)

        return time24
    }
}
