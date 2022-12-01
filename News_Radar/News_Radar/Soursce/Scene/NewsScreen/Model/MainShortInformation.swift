//
//  MainShortInformation.swift
//  News_Radar
//
//  Created by Andrei Maskal on 17/11/2022.
//

import Foundation

struct MainShortInformation: Identifiable, Hashable {
    
    var id = UUID()
    let contry: String?
    let icon: String?
    let shortInfo: String?
    
    static var model: [MainShortInformation] = [
        MainShortInformation(contry: "Poland",icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Belarus",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Ukraina", icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "USA", icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Germany", icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Italy",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Italy",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Сборники",icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Авторы",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Poland",icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Belarus",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Ukraina", icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "USA", icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Germany", icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Italy",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Italy",icon: "images", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Сборники",icon: "small-people-news", shortInfo: "Короткая информация"),
        MainShortInformation(contry: "Авторы",icon: "images", shortInfo: "Короткая информация")
    ]
}
