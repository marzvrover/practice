#include "./shape.h"


#ifndef MVR_BOX_H
#define MVR_BOX_H
class Box : public Shape {
    public:
        double length;
        double height;
        double breadth;

        Box(double length, double height, double breadth) {
            this->length = length;
            this->height = height;
            this->breadth = breadth;
        }

        double volume() {
            return this->length * this->height * this->breadth;
        }

        double surfaceArea() {
            return 2 * (this->breadth * this->length
                        * this->height * this->length
                        * this->height * this->breadth);
        }
};

class Square : public Box {
    public:
        Square(double length) : Box(length, length, length) {
        }

        double volume() {
            return Box::volume();
        }

        double surfaceArea() {
            return Box::surfaceArea();
        }
};
#endif