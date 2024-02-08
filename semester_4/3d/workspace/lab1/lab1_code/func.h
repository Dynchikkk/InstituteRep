#pragma once
double** GetCoordLink(double matrix[][3], int size);

double** MovePicture(double** pic, int size, double x, double y);

double** ScalePicture(double** pic, int size, double x, double y);

enum class Axis
{
	XAxis = 0,
	YAxis = 1
};
double** MirrorPicture(double** pic, int size, Axis axis);

double** RotatePicture(double** pic, int size, double degreeAngle);

double** ReturnOrigin(double** pic, int size, double** origin);