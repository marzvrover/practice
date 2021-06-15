#ifndef MVR_SHAPE_H
#define MVR_SHAPE_H
class Shape {
    public:
        virtual double volume() = 0;
        virtual double surfaceArea() = 0;
};
#endif