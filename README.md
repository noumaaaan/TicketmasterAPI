# TicketmasterAPI
Welcome to TicketmasterAPI! A multi-tab application utilising various aspects of the Ticketmaster API with various features integrated built purely in SwiftUI and available on Testflight. This repository is a work in progress. 

## Getting Started

This application utilises the Ticketmaster API working against many platforms including Ticketmaster, TicketWeb, Universe, FrontGate, Ticketmaster Resale (TMR) and more. 

> To get started, first signup to get your API key here:
https://developer.ticketmaster.com/products-and-docs/apis/getting-started/

You will then need to create `Ticketmaster -> Networking -> Config.swift`
```  
class Config {
    let APIKEY = "YOUR_API_KEY_HERE"
} 
```

## Features
- Built purely in SwiftUI conforming to MMVVM 
- Seperated logic for the Networking layer, utilising async/await
- Launchscreen
- Persisting selected country in UserDefaults
- Creation of custom, shared and reusable components
- Custom tab bar view
- Minimalist animation where appropriate 
- Takes into account [Apples Human Interface Guidlines]([/guides/content/editing-an-existing-page#modifying-front-matter](https://developer.apple.com/design/human-interface-guidelines))


## Walkthrough
<table>
    <tr>
        <th>Tab</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><img src="discover.gif"></td>
        <td><ul>
            <strong>Events</strong>
            <li>View all events </li>
            <li>Search for a specific event within a specified country or worldwide</li>
            <li>Sort the results by relevance, name asc/desc, date asc/desc</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue or attraction for the given event</li>
            <li>See event information and details</li>
        </ul></td>
    </tr>
        <tr>
        <td><img src="discover.gif"></td>
        <td><ul>
            <strong>Attractions</strong>
            <li>Discover all attractions</li>
            <li>Sort the results by relevance, name asc/desc or random</li>
            <li>Search for a specific attraction</li>
            <li>See attraction information and their social links</li>
        </ul></td>
    </tr>
        <tr>
        <td><img src="discover.gif"></td>
        <td><ul>
            <strong>Discover</strong>
            <li>Discover all possible event types </li>
            <li>Filter down a type to view all genres i.e. Sport -> Football</li>
            <li>View all events for a selected genre</li>
            <li>Sort the results by relevance, name asc/desc, date asc/desc</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue or attraction for the given event</li>
        </ul></td>
    </tr>
        <tr>
        <td><img src="discover.gif"></td>
        <td><ul>
            <strong>Venues</strong>
            <li>Discover all venues </li>
            <li>Sort the results by relevance, name asc/desc or random</li>
            <li>Search for a specific venue</li>
            <li>Filter to a specific country or search worldwide</li>
            <li>View the venue information as well as map/location information</li>
        </ul></td>
    </tr>
</table>

## TODO
- Unit and UI Testing 
- Ability to save events/venues/attractions into a 'favourite' section using SwiftData
- Localise strings
- Walkthrough screen
