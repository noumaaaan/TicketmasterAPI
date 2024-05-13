//
//  MockData.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

class MockData {
    let testVenue: TMVenue = .init(
        id: "KovZ9177-37",
        name: "St Martin's Theatre",
        type: "venue",
        url: "https://www.ticketmaster.co.uk/st-martins-theatre-tickets-london/venue/434709",
        postalCode: "WC2H 9NZ",
        timezone: "Europe/London",
        city: .init(
            name: "London"
        ),
        country: .init(
            name: "Great Britain"
        ),
        address: .init(
            line1: "West Street",
            line2: "Second Line address"
        ),
        location: .init(
            longitude: "-0.127672",
            latitude: "51.512848"
        ),
        boxOfficeInfo: .init(
            phoneNumberDetail: "Ticketmaster UK: 0870 154 40 40 International: 00 44 161 385 3500",
            openHoursDetail: "Monday - Saturday: 10:00 - 20:00",
            acceptedPaymentDetail: "Ticketmaster accepts all major credit cards.",
            willCallDetail: "Tickets left at the box office for collection may be picked up on the day, during the hour before the performance starts. Please take the credit card and Ticketmaster Booking Reference Number as proof of purchase."
        ),
        parkingDetail: "There is a National Car Park in St Martin's Lane, and very limited street parking so would advise using public transport.",
        accessibleSeatingDetail: "Please contact the Box Office direct for more information.",
        images: [
            .init(
                url: "https://s1.ticketm.net/uk/dbimages/2269v.",
                width: 175,
                height: 95
            )
        ]
    )
    
    let testEvent: TMEvent = .init(
        ID: "vv1A7ZkeKGkduOwi0",
        name: "Imagine Dragons: LOOM WORLD TOUR",
        type: "event",
        url: "https://concerts.livenation.com/imagine-dragons-loom-world-tour-tinley-park-illinois-08-18-2024/event/04006093CD832B24",
        images: [
            .init(
                url: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_SOURCE",
                width: 2426,
                height: 1365
            ),
            .init(
                url: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_RETINA_PORTRAIT_3_2.jpg",
                width: 640,
                height: 427
            )
        ],
        sales: .init(
            publicSales: .init(
                startDateTime: "2024-04-26T15:00:00Z",
                endDateTime: "2024-08-19T02:00:00Z"
            ),
            presales: [
                .init(
                    startDateTime: "2024-04-23T15:00:00Z",
                    endDateTime: "2024-04-26T03:00:00Z",
                    name: "Citi® Cardmember Presale"
                ),
                .init(
                    startDateTime: "2024-04-25T15:00:00Z",
                    endDateTime: "2024-04-26T03:00:00Z",
                    name: "Live Nation Presale"
                )
            ]
        ),
        dates: .init(
            start: .init(
                localDate: "2024-08-18",
                localTime: "19:00:00",
                dateTime: "2024-08-19T00:00:00Z"
            ),
            timezone: "America/Chicago",
            status: .init(
                code: "onsale"
            ),
            spanMultipleDays: false
        ),
        classifications: [
            .init(
                segment: .init(
                    name: "Music"
                ),
                genre: .init(
                    name: "Rock"
                ),
                subGenre: .init(
                    name: "Pop"
                ),
                type: .init(
                    name: "Undefined"
                ),
                subType: .init(
                    name: "Undefined"
                )
            )
        ],
        promoter: .init(
            name: "LIVE NATION MUSIC",
            description: "LIVE NATION MUSIC / NTL / USA"
        ),
        priceRanges: [
            .init(
                type: "standard",
                currency: "USD",
                min: 50,
                max: 229.5
            )
        ],
        products: [
            .init(
                name: "Imagine Dragons VIP Upgrades (No Ticket Included)",
                url: "http://concerts.livenation.com/event/04006097DDA1265C",
                classifications: [
                    .init(
                        segment: .init(
                            name: "Miscellaneous"
                        ),
                        genre: .init(
                            name: "Undefined"
                        ),
                        subGenre: .init(
                            name: "Undefined"
                        ),
                        type: .init(
                            name: "Upsell"
                        ),
                        subType: .init(
                            name: "Special Entry"
                        )
                    )
                ]
            ),
            .init(
                name: "Concert Concierge - Imagine Dragons - Not a Concert Ticket",
                url: "http://concerts.livenation.com/event/04006096C9861A74",
                classifications: [
                    .init(
                        segment: .init(
                            name: "Miscellaneous"
                        ),
                        genre: .init(
                            name: "Undefined"
                        ),
                        subGenre: .init(
                            name: "Undefined"
                        ),
                        type: .init(
                            name: "Upsell"
                        ),
                        subType: .init(
                            name: "Special Entry"
                        )
                    )
                ]
            )
        ],
        seatmap: .init(
            staticUrl: "https://maps.ticketmaster.com/maps/geometry/3/event/04006093CD832B24/staticImage?type=png&systemId=HOST"
        ),
        ticketLimit: .init(
            info: "There is an overall 8 ticket limit for this event."
        ), 
        embedded: .init(
            venues: [
                .init(
                    id: "ZFr9jZe667",
                    name: "Target Center",
                    type: "venue",
                    url: nil,
                    postalCode: "55403",
                    timezone: "America/Chicago",
                    city: .init(
                        name: "Minneapolis"
                    ),
                    country: .init(
                        name: "United States Of America"
                    ),
                    address: .init(
                        line1: "600 First Ave. North",
                        line2: "600 First Ave. North"
                    ),
                    location: .init(
                        longitude: "-93.286102",
                        latitude: "44.970299"
                    ),
                    boxOfficeInfo: nil,
                    parkingDetail: "",
                    accessibleSeatingDetail: "",
                    images: []
                )
            ], 
            attractions: [
                .init(
                    ID: "K8vZ9171Jo7",
                    name: "P!NK",
                    type: "attraction",
                    url: "https://www.ticketmaster.ca/pnk-tickets/artist/718655",
                    images: [],
                    classifications: [],
                    externalLinks: nil,
                    aliases: []
                )
            ]
        )
    )
    
    let testAttraction: TMAttraction = .init(
        ID: "K8vZ9171Jo7",
        name: "P!NK",
        type: "attraction",
        url: "https://www.ticketmaster.ca/pnk-tickets/artist/718655",
        images: [
            .init(
                url: "https://s1.ticketm.net/dam/a/8cc/0850a9c7-f269-4506-87f5-0acb3e2e08cc_CUSTOM.jpg",
                width: 305,
                height: 225
            ),
            .init(
                url: "https://s1.ticketm.net/dam/a/8cc/0850a9c7-f269-4506-87f5-0acb3e2e08cc_RETINA_PORTRAIT_16_9.jpg",
                width: 640,
                height: 360
            )
        ],
        classifications: [
            .init(
                segment: .init(
                    name: "Music"
                ),
                genre: .init(
                    name: "Rock"
                ),
                subGenre: .init(
                    name: "Pop"
                ),
                type: .init(
                    name: "Individual"
                ),
                subType: .init(
                    name: "Musician"
                ))
        ],
        externalLinks: .init(
            youtube: [
                .init(url: "https://www.youtube.com/user/PinkVideoVault"),
                .init(url: "https://www.youtube.com/user/PinkVEVO")
            ],
            twitter: [
                .init(url: "https://twitter.com/Pink")
            ],
            wiki: [
                .init(url: "https://en.wikipedia.org/wiki/Pink_(singer)")
            ],
            facebook: [
                .init(url: "https://www.facebook.com/pink")
            ],
            spotify: [
                .init(url: "https://open.spotify.com/artist/1KCSPY1glIKqW2TotWuXOR")
            ],
            instagram: [
                .init(url: "https://www.instagram.com/pink/")
            ]
        ),
        aliases: [ "p!nk", "pink" ]
    )
    
    let testSection: TMSection = .init(
        segment: .init(
            ID: "KZFzniwnSyZfZ7v7n1",
            name: "Miscellaneous",
            embedded: .init(
                genres: [
                    .init(
                        ID: "KnvZfZ7vAAa",
                        name: "Casino/Gaming"
                    ),
                    .init(
                        ID: "KnvZfZ7vAAt",
                        name: "Holiday"
                    )
                ]
            )
        )
    )
}
