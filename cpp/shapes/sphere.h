#include "./shape.h"
#include <math.h>

#ifndef MVR_SPHERE_H
#define MVR_SPHERE_H
class Sphere : public Shape {
    public:
        double radius;

        Sphere(double radius) {
            this->radius = radius;
        }

        double volume() {
            return (4 * M_PI * pow(this->radius, 3)) / 3;
        }

        double surfaceArea() {
            return  4 * M_PI * pow(this->radius, 2);
        }
};
#endif