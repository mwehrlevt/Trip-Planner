//
//  MapViewController.swift
//  Trip Planner
//
//  Created by Alexander Medvedeff on 11/14/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    //MARK:- Variable Declarations

    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var currentLocationStr = "Current location"
    var currentCity: String = "Burlington"
    var allActivitesTitles: [String] = []
    
    func convertScheduleCityToCoordinate(city: String) -> CLLocationCoordinate2D{
        
        var defaultCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: 44.4759,
                longitude: -73.2121
            )
        }
        
        if city == "Burlington"{
            var locationCoordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(
                    latitude: 44.4759,
                    longitude: -73.2121
                )
            }
            
            return locationCoordinate
        } else if city == "Boston"{
            var locationCoordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(
                    latitude:42.3601,
                    longitude: -71.0589
                )
            }
            
            return locationCoordinate
        } else if city == "Chicago" {
            var locationCoordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(
                    latitude: 41.8781,
                    longitude: -87.6298
                )
            }
            
            return locationCoordinate
        } else if city == "Orlando" {
            var locationCoordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(
                    latitude: 28.5384,
                    longitude: -81.3789
                )
            }
            
            return locationCoordinate
        } else if city == "New York City" {
            var locationCoordinate: CLLocationCoordinate2D {
                CLLocationCoordinate2D(
                    latitude: 40.7128,
                    longitude: -74.0060
                )
            }
            
            return locationCoordinate
        }
        
        return defaultCoordinate
        
    }

    func updateCurrentCity(city: String?){
        currentCity = city ?? "Burlington"
    }
    
    func loadAllActivitiesTitles(){
        for activity in activities{
            allActivitesTitles.append(activity.id)
        }
        for activity in bostonActivities{
            allActivitesTitles.append(activity.id)
        }
        for activity in chicagoActivities{
            allActivitesTitles.append(activity.id)
        }
        for activity in newYorkCityActivities{
            allActivitesTitles.append(activity.id)
        }
        for activity in orlandoActivities{
            allActivitesTitles.append(activity.id)
        }
               
     
    }

    //MARK:- ViewController LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadAllActivitiesTitles()
        mapView.delegate = self
        if schedule.schedule.isEmpty{
            updateCurrentCity(city: "Burlington")
        } else {
            updateCurrentCity(city: schedule.schedule[0].city)
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        let region = MKCoordinateRegion(center: convertScheduleCityToCoordinate(city: currentCity), span: span)
        
        mapView.setRegion(region, animated: true)
        
        self.configureMap()
        self.addAllPins()
    }

    override func viewDidAppear(_ animated: Bool) {
        
//        determineCurrentLocation()
        if schedule.schedule.isEmpty{
            updateCurrentCity(city: "Burlington")
        } else {
            updateCurrentCity(city: schedule.schedule[0].city)
        }
        if schedule.schedule.isEmpty{
            
        } else {
            print("The first schedule item is ", schedule.schedule[0].name)
        }
        for annotation in mapView.annotations{
            mapView.removeAnnotation(annotation)
        }
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        let region = MKCoordinateRegion(center: convertScheduleCityToCoordinate(city: currentCity), span: span)
        
        mapView.setRegion(region, animated: true)
        self.configureMap()
        self.addAllPins()
        
    }

    //MARK:- CLLocationManagerDelegate Methods

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mUserLocation:CLLocation = locations[0] as CLLocation

        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        mapView.setRegion(mRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Error - locationManager: \(error.localizedDescription)")
        
    }
    
    //MARK:- Intance Methods

    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func addAllPins(){
        for location in bostonActivities{
            let annotation = MKPointAnnotation()
            annotation.title = location.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.locationCoordinate.latitude, longitude: location.locationCoordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
        
        for location in activities{
            let annotation = MKPointAnnotation()
            annotation.title = location.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.locationCoordinate.latitude, longitude: location.locationCoordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
            
        for location in chicagoActivities{
            let annotation = MKPointAnnotation()
            annotation.title = location.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.locationCoordinate.latitude, longitude: location.locationCoordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
        
        for location in newYorkCityActivities{
            let annotation = MKPointAnnotation()
            annotation.title = location.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.locationCoordinate.latitude, longitude: location.locationCoordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
        
        for location in orlandoActivities{
            let annotation = MKPointAnnotation()
            annotation.title = location.id
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.locationCoordinate.latitude, longitude: location.locationCoordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
        
    }
    
    func configureMap(){
        
        let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
        let region = MKCoordinateRegion(center: convertScheduleCityToCoordinate(city: currentCity), span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mMapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")
                    
        if schedule.schedule.isEmpty{

        } else {
            for activity in schedule.schedule{
                if annotation.title!! == activity.name{
                    annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
                }
            }
        }
        return annotationView
    }
    
}
