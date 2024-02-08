#define _USE_MATH_DEFINES
#include <cmath>

#pragma region MatrixOperation
// Matrix multiplication
double** MatrixMult(double** matA, double** matB, int m, int k, int n)
{
	double** nMat = new double*[m];
	for (int i = 0; i < m; i++)
		nMat[i] = new double[n];

	for (int i = 0; i < m; i++)
	{
		for (int j = 0; j < n; j++)
		{
			nMat[i][j] = 0;
			for (int l = 0; l < k; l++)
				nMat[i][j] += matA[i][l] * matB[l][j];
		}
	}

	return nMat;
}

// Creating an empty matrix and initializing with zeros
double** CreateEmptyMatrix(int row, int col)
{
	double** arr = new double*[row];
	for (int i = 0; i < row; i++)
		arr[i] = new double[col];

	for (int i = 0; i < row; i++)
		for (int j = 0; j < col; j++)
			arr[i][j] = 0;
	
	return arr;
}

// Creating an empty matrix, initializing with zeros and set diagonal to zero
double** CreateEmptyMultMatrix(int x, int y)
{
	double** arr = CreateEmptyMatrix(x, y);

	arr[0][0] = 1;
	arr[1][1] = 1;
	arr[2][2] = 1;

	return arr;
}

// Get link of coordinates array
double** GetCoordLink(double matrix[][3], int size)
{
	double** nMatrix = CreateEmptyMatrix(size, 3);
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < 3; j++)
			nMatrix[i][j] = matrix[i][j];
	}

	return nMatrix;
}
#pragma endregion

#pragma region Move
// Move whole picture by moving all dots to x, y
double** MovePicture(double** pic, int size, double x, double y)
{
	double** multMatrix = CreateEmptyMultMatrix(3, 3);
	multMatrix[2][0] = x;
	multMatrix[2][1] = y;

	double** resPic = MatrixMult(pic, multMatrix, size, 3, 3);
	return resPic;
}
#pragma endregion

#pragma region Scale
// Scale whole picture by scaling all dots to x, y
double** ScalePicture(double** pic, int size, double x, double y)
{
	double** multMatrix = CreateEmptyMultMatrix(3, 3);
	multMatrix[0][0] = x;
	multMatrix[1][1] = y;

	double** resPic = MatrixMult(pic, multMatrix, size, 3, 3);
	return resPic;
}
#pragma endregion

#pragma region Mirror
// Mirror axis
enum class Axis
{
	XAxis = 0,
	YAxis = 1
};

// Mirror picture by mirror all dots depends on choosen axis
double** MirrorPicture(double** pic, int size, Axis axis)
{
	double** multMatrix = CreateEmptyMultMatrix(3, 3);
	switch (axis)
	{
	case Axis::XAxis:
		multMatrix[1][1] = -1;
		break;
	case Axis::YAxis:
		multMatrix[0][0] = -1;
		break;
	default:
		break;
	}

	double** resPic = MatrixMult(pic, multMatrix, size, 3, 3);
	return resPic;
}
#pragma endregion

#pragma region Rotate
// Rotate picture by rotate all dots depends on angle in degree
double** RotatePicture(double** pic, int size, double degreeAngle)
{
	double radAngle = degreeAngle * M_PI / 180;

	double** multMatrix = CreateEmptyMultMatrix(3, 3);
	multMatrix[0][0] = cos(radAngle);
	multMatrix[0][1] = sin(radAngle);
	multMatrix[1][0] = -sin(radAngle);
	multMatrix[1][1] = cos(radAngle);

	double** resPic = MatrixMult(pic, multMatrix, size, 3, 3);
	return resPic;
}
#pragma endregion

#pragma region ReturnOrigin
// Return to default coordinates
double** ReturnOrigin(double** pic, int size, double** origin)
{
	double** resPic = CreateEmptyMatrix(size, 3);
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < 3; j++)
			resPic[i][j] = origin[i][j];
	}

	return resPic;
}
#pragma endregion
