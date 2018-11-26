//
//  ViewController.swift
//  radius_New
//
//  Created by Glory Kanes on 11/9/18.
//  Copyright © 2018 LavaLab. All rights reserved.
//

import UIKit
import Mapbox

// MGLPointAnnotation subclass
class MyCustomPointAnnotation: MGLPointAnnotation {
    var willUseImage: Int = 0
}
// end MGLPointAnnotation subclass

class ViewController: UIViewController,  MGLMapViewDelegate {
    
    //Mark: Properties
    @IBOutlet weak var infoButton: UIButton!
    
    
    @IBAction func someButtonPressed(infoButton: UIButton){
        //pushViewController(ViewControl)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Create a new map view using the Mapbox Light style.
        let mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.lightStyleURL)
        mapView.layer.zPosition = 1
        infoButton.layer.zPosition = 2
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set the map’s center coordinate and zoom level.
        mapView.setCenter(CLLocationCoordinate2D(latitude: 34.023078, longitude: -118.286887), zoomLevel: 14, animated: false)
        view.addSubview(mapView)
        mapView.delegate = self
        
        // Create four new point annotations with specified coordinates and titles.
        let point1 = MyCustomPointAnnotation()
        point1.coordinate = CLLocationCoordinate2D(latitude: 34.024116, longitude: -118.286690)
        point1.title = "Theft"
        point1.subtitle = "A suspect on bicycle approcahed a student from behind and snatched her cell phone from her."
        point1.willUseImage = 2
        
        //34TH ST & MCCLINTOCK AV
        let point2 = MyCustomPointAnnotation()
        point2.coordinate = CLLocationCoordinate2D(latitude: 34.0242858, longitude: -118.2897999)
        point2.title = "Battery"
        point2.subtitle = "Fours suspects approached a juvenile as he was walking near the location and one of them punched him in the face."
        point2.willUseImage = 1
        
        //TROY HALL
        let point3 = MyCustomPointAnnotation()
        point3.title = "Theft-Petty"
        point3.subtitle = "A suspect removed a bicycle.."
        point3.coordinate = CLLocationCoordinate2D(latitude: 34.0253158, longitude: -118.2845767)
        point3.willUseImage = 3
        
        // MCCARTHY WAY STRUCTURE
        let point4 = MyCustomPointAnnotation()
        point4.title = "Theft from Motor Vehicle"
        point4.subtitle = "A suspect removed a laptop computer from car."
        point4.coordinate = CLLocationCoordinate2D(latitude: 34.0205212, longitude: -118.2846508)
        point4.willUseImage = 2
        
        // USERLOCATION
        let USER = MyCustomPointAnnotation()
        USER.title = "User Location"
        USER.coordinate = CLLocationCoordinate2D(latitude: 34.020964, longitude: -118.284799)
        USER.willUseImage = 0

        //SHRINE PARKING STRUCTURE
        let point5 = MyCustomPointAnnotation()
        point5.coordinate = CLLocationCoordinate2D(latitude: 34.0246608, longitude: -118.2818744)
        point5.title = "Sex Offense"
        point5.subtitle = "A suspect was arrested for slapping a student twice on the buttocks while she was walking."
        point5.willUseImage = 1
        
        // SHEELY & OFER NEMIROVSKY AND DAVID C.
        //BOHNETT RESIDENTIAL COLLEGE
        let point6 = MyCustomPointAnnotation()
        point6.title = "Theft-Petty"
        point6.subtitle = "A suspect removed a bicycle.."
        point6.coordinate = CLLocationCoordinate2D(latitude: 34.0248873, longitude: -118.2863785)
        point6.willUseImage = 3
        
        //28TH ST & UNIVERSITY AV
        let point7 = MyCustomPointAnnotation()
        point7.title = "Vandalism-Felony"
        point7.subtitle = "A suspect used a wine bottle to smash the rear windshield of a student's vehicle."
        point7.coordinate = CLLocationCoordinate2D(latitude: 34.0279107, longitude: -118.2836346)
        point7.willUseImage = 2
        
        //ADAMS BL & FIGUEROA ST
        let point8 = MyCustomPointAnnotation()
        point8.coordinate = CLLocationCoordinate2D(latitude: 34.0222397, longitude: -118.2847391)
        point8.title = "Robbery-Simulated Weapon"
        point8.subtitle = "A suspect was arrested for taking a student's skateboard from him after stating that he had a gun and threatening to shoot him."
        point5.willUseImage = 1
        
        // Fill an array with four point annotations.
        let myPlaces = [point1, point2, point3, point4, USER, point5, point6, point7, point8]
        
        // Add all annotations to the map all at once, instead of individually.
        mapView.addAnnotations(myPlaces)
        //mapView.selectAnnotation(myPlaces, animated: true)
        // Allow the map view to display the user's location
        //mapView.showsUserLocation = true
    }
    
 
    
        
    
    
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        return UIButton(type: .detailDisclosure)
    }
    
    // This delegate method is where you tell the map to load an image for a specific annotation based on the willUseImage property of the custom subclass.
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        
        if let castAnnotation = annotation as? MyCustomPointAnnotation {
            if (castAnnotation.willUseImage==1) {
                // For better performance, always try to reuse existing annotations.
                var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "dangerous")
                
                // If there is no reusable annotation image available, initialize a new one.
                if(annotationImage == nil) {
                    annotationImage = MGLAnnotationImage(image: UIImage(named: "dangerous")!, reuseIdentifier: "dangeorus")
                }
                
                return annotationImage
            }
            else if(castAnnotation.willUseImage==2){
                // For better performance, always try to reuse existing annotations.
                var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "medium")
                
                // If there is no reusable annotation image available, initialize a new one.
                if(annotationImage == nil) {
                    annotationImage = MGLAnnotationImage(image: UIImage(named: "medium")!, reuseIdentifier: "medium")
                }
                
                return annotationImage
            }
            else if(castAnnotation.willUseImage==3){
                // For better performance, always try to reuse existing annotations.
                var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "ovalCopy7")
                
                // If there is no reusable annotation image available, initialize a new one.
                if(annotationImage == nil) {
                    annotationImage = MGLAnnotationImage(image: UIImage(named: "ovalCopy7")!, reuseIdentifier: "ovalCopy7")
                }
                return annotationImage
            }
            
        }
        return nil
    }
    
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    
    func mapView(_ mapView: MGLMapView, leftCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        
        // Callout height is fixed; width expands to fit its content.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 100))
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.81, green: 0.71, blue: 0.23, alpha: 1)
        label.text = "金閣寺"
        
        return label
    }
    // Zoom to the annotation when it is selected
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, fromDistance: 5000, pitch: 0, heading: 0)
        mapView.fly(to: camera, completionHandler: nil)
    }
    
    //MARK: Actions
    @IBAction func changeScreen(_ sender: UIButton) {
        //do smthg
    }
    
}

// Create a subclass of MGLUserLocationAnnotationView.
class CustomUserLocationAnnotationView: MGLUserLocationAnnotationView {
    let size: CGFloat = 48
    var dot: CALayer!
    var arrow: CAShapeLayer!
    
    // -update is a method inherited from MGLUserLocationAnnotationView. It updates the appearance of the user location annotation when needed. This can be called many times a second, so be careful to keep it lightweight.
    override func update() {
        if frame.isNull {
            frame = CGRect(x: 0, y: 0, width: size, height: size)
            return setNeedsLayout()
        }
        
        // Check whether we have the user’s location yet.
        if CLLocationCoordinate2DIsValid(userLocation!.coordinate) {
            setupLayers()
            updateHeading()
        }
    }
    
    private func updateHeading() {
        // Show the heading arrow, if the heading of the user is available.
        if let heading = userLocation!.heading?.trueHeading {
            arrow.isHidden = false
            
            // Get the difference between the map’s current direction and the user’s heading, then convert it from degrees to radians.
            let rotation: CGFloat = -MGLRadiansFromDegrees(mapView!.direction - heading)
            
            // If the difference would be perceptible, rotate the arrow.
            if fabs(rotation) > 0.01 {
                // Disable implicit animations of this rotation, which reduces lag between changes.
                CATransaction.begin()
                CATransaction.setDisableActions(true)
                arrow.setAffineTransform(CGAffineTransform.identity.rotated(by: rotation))
                CATransaction.commit()
            }
        } else {
            arrow.isHidden = true
        }
    }
    
    private func setupLayers() {
        // This dot forms the base of the annotation.
        if dot == nil {
            dot = CALayer()
            dot.bounds = CGRect(x: 0, y: 0, width: size, height: size)
            
            // Use CALayer’s corner radius to turn this layer into a circle.
            dot.cornerRadius = size / 4
            dot.backgroundColor = super.tintColor.cgColor
            dot.borderWidth = 4
            dot.borderColor = UIColor.white.cgColor
            layer.addSublayer(dot)
        }
        
        // This arrow overlays the dot and is rotated with the user’s heading.
        if arrow == nil {
            arrow = CAShapeLayer()
            arrow.path = arrowPath()
            arrow.frame = CGRect(x: 0, y: 0, width: size / 2, height: size / 2)
            arrow.position = CGPoint(x: dot.frame.midX, y: dot.frame.midY)
            arrow.fillColor = dot.borderColor
            layer.addSublayer(arrow)
        }
    }
    
    // Calculate the vector path for an arrow, for use in a shape layer.
    private func arrowPath() -> CGPath {
        let max: CGFloat = size / 2
        let pad: CGFloat = 3
        
        let top =    CGPoint(x: max * 0.5, y: 0)
        let left =   CGPoint(x: 0 + pad,   y: max - pad)
        let right =  CGPoint(x: max - pad, y: max - pad)
        let center = CGPoint(x: max * 0.5, y: max * 0.6)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: top)
        bezierPath.addLine(to: left)
        bezierPath.addLine(to: center)
        bezierPath.addLine(to: right)
        bezierPath.addLine(to: top)
        bezierPath.close()
        
        return bezierPath.cgPath
    }
    
}




