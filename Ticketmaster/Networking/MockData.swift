//
//  MockData.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 06/05/2024.
//

import Foundation

struct MockData {
    let testEvent: TMEvent = .init(
        ID: "vv1A7ZkeKGkduOwi0",
        name: "Imagine Dragons: LOOM WORLD TOUR",
        type: "event",
        url: "https://concerts.livenation.com/imagine-dragons-loom-world-tour-tinley-park-illinois-08-18-2024/event/04006093CD832B24",
        images: [
            .init(
                ratio: "16_9",
                url: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_SOURCE",
                width: 2426,
                height: 1365
            ),
            .init(
                ratio: "3_2",
                url: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_RETINA_PORTRAIT_3_2.jpg",
                width: 640,
                height: 427
            )
        ],
        sales: .init(
            publicSales: .init(
                startDateTime: "2024-04-26T15:00:00Z",
                startTBD: false,
                startTBA: false,
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
        )
    )
}
