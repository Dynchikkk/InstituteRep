#pragma once
double** GetCoordLink(double matrix[][3], int size);

double* MoveDot(double dot[3], double x, double y);
double** MovePicture(double** pic, int size, double x, double y);

double* ScaleDot(double dot[3], double x, double y);
double** ScalePicture(double** pic, int size, double x, double y);

enum class Axis
{
	XAxis = 0,
	YAxis = 1
};
double* MirrorDot(double dot[3], Axis axis);
double** MirrorPicture(double** pic, int size, Axis axis);

double* RotateDot(double dot[3], double degreeAngle);
double** RotatePicture(double** pic, int size, double degreeAngle);

double** ReturnOrigin(double** pic, int size, double** origin);