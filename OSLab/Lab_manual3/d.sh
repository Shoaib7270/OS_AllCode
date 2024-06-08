#!/bin/bash

calculate_circle_perimeter() {
    read -p "Enter the radius of the circle: " radius
    perimeter=$(echo "scale=3; 2 * 3.14159 * $radius" | bc)
    echo "The perimeter of the circle is: $perimeter"
}

calculate_rectangle_perimeter() {
    read -p "Enter the length of the rectangle: " length
    read -p "Enter the width of the rectangle: " width
    perimeter=$((2 * (length + width)))
    echo "The perimeter of the rectangle is: $perimeter"
}

calculate_triangle_perimeter() {
    read -p "Enter the length of the first side of the triangle : " side1
    read -p "Enter the length of the second side of the triangle : " side2
    read -p "Enter the length of the third side of the triangle : " side3
    
    perimeter=$((side1 + side2 + side3))
    echo "The perimeter of the triangle is: $perimeter"
}

echo "Menu"
echo "1. Circle"
echo "2. Rectangle"
echo "3. Triangle"

read -p "Choose an option to find the perimeter: " choice

case $choice in
    1)
        calculate_circle_perimeter
        ;;
    2)
        calculate_rectangle_perimeter
        ;;
    3)
        calculate_triangle_perimeter
        ;;
    *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
esac
