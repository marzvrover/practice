#include <iostream>

#include "./shape.h"
#include "./box.h"
#include "./sphere.h"

void printShape(char* name, Shape& shape);

int main () {
    Box *box = new Square(2);
    Sphere *sphere = new Sphere(2.3);

    printShape((char *)"box", *box);
    printShape((char *)"sphere", *sphere);
}

void printShape(char* name, Shape& shape) {
    std::cout << name << ":" << std::endl;
    std::cout << "\tSA: " << shape.surfaceArea() << std::endl;
    std::cout << "\tvol: " << shape.volume() << std::endl;
}