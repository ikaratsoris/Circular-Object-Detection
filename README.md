# Circular Object Detection
Computer Vision MATLAB project for detecting circular objects and classifying them based on their radius.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Example of Use](#example-of-use)

## General info
This project was created to detect circular objects on oil images taken from a microscope. It mainly uses the circular Hough transform (imfindcircles).
In case the detected circle is inside a larger one, the program uses the function similar_center to eliminate the smaller one.

## Technologies
The project was developed in MATLAB

## Example of Use
<img src="https://github.com/ikaratsoris/circular-object-detection/tree/main/sample/bags 008.jpg?raw=true" width="30%">
