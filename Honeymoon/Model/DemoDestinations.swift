//
//  HoneymoonData.swift
//  Honeymoon
//
//  Created by Cristiano Galiano on 8/20/21.
//
//
import SwiftUI


var demoDestinations: [Destination] = [
    Destination(
        id: UUID().uuidString,
        place: "Veligandu",
        country: "Maldives",
        image: "photo-veligandu-island-maldives",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Paris",
        country: "France",
        image: "photo-paris-france",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-paris-france"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-paris-france"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-paris-france")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Athens",
        country: "Greece",
        image: "photo-athens-greece",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-athens-greece"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-athens-greece"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-athens-greece")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Dubai",
        country: "United Arab Emirates",
        image: "photo-dubai-emirates",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-dubai-emirates"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-dubai-emirates"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-dubai-emirates")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Grand Canyon",
        country: "United States of America",
        image: "photo-grandcanyon-usa",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-grandcanyon-usa"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-grandcanyon-usa"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-grandcanyon-usa")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Venice",
        country: "Italy",
        image: "photo-venice-italy",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-venice-italy"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-venice-italy"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-venice-italy")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Budapest",
        country: "Hungary",
        image: "photo-budapest-hungary",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-budapest-hungary"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-budapest-hungary"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-budapest-hungary")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "High Tatras",
        country: "Poland",
        image: "photo-tatras-poland",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-tatras-poland"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-tatras-poland"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-tatras-poland")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Lake Bled",
        country: "Slovenia",
        image: "photo-lakebled-slovenia",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-lakebled-slovenia"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-lakebled-slovenia"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-lakebled-slovenia")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Barcelona",
        country: "Spain",
        image: "photo-barcelona-spain",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-barcelona-spain"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-barcelona-spain"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-barcelona-spain")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "San Francisco",
        country: "United States of America",
        image: "photo-sanfrancisco-usa",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-sanfrancisco-usa"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-sanfrancisco-usa"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-sanfrancisco-usa")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Emerald Lake",
        country: "Canada",
        image: "photo-emaraldlake-canada",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-emaraldlake-canada"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-emaraldlake-canada"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-emaraldlake-canada")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Krabi",
        country: "Thailand",
        image: "photo-krabi-thailand",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-krabi-thailand"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-krabi-thailand"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-krabi-thailand")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Rome",
        country: "Italy",
        image: "photo-rome-italy",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-rome-italy"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-rome-italy"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-rome-italy")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Seoraksan",
        country: "South Korea",
        image: "photo-seoraksan-southkorea",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-seoraksan-southkorea"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-seoraksan-southkorea"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-seoraksan-southkorea")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "New York",
        country: "USA",
        image: "photo-newyork-usa",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-newyork-usa"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-newyork-usa"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-newyork-usa")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Tulum",
        country: "Mexico",
        image: "photo-tulum-mexico",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-tulum-mexico"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-tulum-mexico"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-tulum-mexico")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "London",
        country: "United Kingdom",
        image: "photo-london-uk",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-london-uk"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-london-uk"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-london-uk")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Yosemite",
        country: "USA",
        image: "photo-yosemite-usa",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-yosemite-usa"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-yosemite-usa"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-yosemite-usa")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Rio de Janeiro",
        country: "Brazil",
        image: "photo-riodejaneiro-brazil",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-riodejaneiro-brazil"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-riodejaneiro-brazil"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-riodejaneiro-brazil")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Sydney",
        country: "Australia",
        image: "photo-sydney-australia",
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-sydney-australia"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-sydney-australia"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-sydney-australia")
        ])
]



var previewDestDataTrueLike: [Destination] = [
    Destination(
        id: UUID().uuidString,
        place: "Veligandu",
        country: "Maldives",
        image: "photo-veligandu-island-maldives",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Paris",
        country: "France",
        image: "photo-paris-france",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Athens",
        country: "Greece",
        image: "photo-athens-greece",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Dubai",
        country: "United Arab Emirates",
        image: "photo-dubai-emirates",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Grand Canyon",
        country: "United States of America",
        image: "photo-grandcanyon-usa",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Venice",
        country: "Italy",
        image: "photo-venice-italy",
        like: true,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
 ]
var previewDestDataFalseLike: [Destination] = [
    Destination(
        id: UUID().uuidString,
        place: "Veligandu",
        country: "Maldives",
        image: "photo-veligandu-island-maldives",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Paris",
        country: "France",
        image: "photo-paris-france",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Athens",
        country: "Greece",
        image: "photo-athens-greece",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Dubai",
        country: "United Arab Emirates",
        image: "photo-dubai-emirates",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Grand Canyon",
        country: "United States of America",
        image: "photo-grandcanyon-usa",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
    Destination(
        id: UUID().uuidString,
        place: "Venice",
        country: "Italy",
        image: "photo-venice-italy",
        like: false,
        promotionFrom: "from $299",
        promotions: [
            Promotion(
                title: "Package 1",
                description: "The package one will take you to the best excursion of the city",
                price: "$299",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 2",
                description: "The package number two will spoil you with SPA service and massages",
                price: "$399",
                image: "photo-veligandu-island-maldives"),
            Promotion(
                title: "Package 3",
                description: "Package three is the top one! All inclusive: excursions, SPA and more...",
                price: "$499",
                image: "photo-veligandu-island-maldives")
        ]),
 ]

