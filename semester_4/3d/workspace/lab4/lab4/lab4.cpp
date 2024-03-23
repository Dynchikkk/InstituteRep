// lab4.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "lab4.h"
#include "SharpMatrix.h"

#define MAX_LOADSTRING 100

const int WIN_SIZE_X = 1400;
const int WIN_SIZE_Y = 1000;
const int CONTRAST_RANGE_S = 100;
const int CONTRAST_RANGE_E = 200;

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

void DrawGraph(HDC hdc, int drawX, int drawY, int picX, int picY, int picSizeX, int picSizeY)
{
    int* colorPerColumns = new int[picSizeX];

    for (size_t x = 0; x < picSizeX; x++)
    {
        colorPerColumns[x] = 0;
        for (size_t y = 0; y < picSizeY; y++)
        {
            COLORREF color = GetPixel(hdc, x + picX, y + picY);
            int srColorPixel = (GetRValue(color) + GetGValue(color) + GetBValue(color)) / 3;
            colorPerColumns[x] += srColorPixel;
        }
        colorPerColumns[x] /= picSizeY;
    }

    for (size_t i = 0; i < picSizeX; i++)
    {
        int maxY = colorPerColumns[i];
        int x = i + drawX;
        for (size_t j = 0; j < maxY; j++)
        {
            int y = drawY + 255 - j;
            SetPixel(hdc, x, y, RGB(0, 0, 0));
        }
    }
}

int IntepolateColorOne(int col, int rangeS, int rangeE)
{
    if (col < rangeS)
        return 0;
    else if (col > rangeE)
        return 255;
    else
        return (col - rangeS) * (255 / (rangeE - rangeS));

    return -1;
}

COLORREF InterpolateColor(COLORREF orig, int rangeS, int rangeE)
{
    int r = IntepolateColorOne(GetRValue(orig), rangeS, rangeE);
    int g = IntepolateColorOne(GetGValue(orig), rangeS, rangeE);
    int b = IntepolateColorOne(GetBValue(orig), rangeS, rangeE);

    return RGB(r, g, b);
}

void ChangeContrast(HDC hdc, HBITMAP pic, int sizeX, int sizeY, int origX, int origY, int resX, int resY)
{
    // Draw original pic
    HDC memdc = CreateCompatibleDC(hdc);
    SelectObject(memdc, pic);
    BitBlt(hdc, origX, origY, sizeX, sizeY, memdc, 0, 0, SRCCOPY);
    DeleteDC(memdc);

    // Draw contrast copy
    for (size_t x = 0; x < sizeX; x++)
    {
        for (size_t y = 0; y < sizeY; y++)
        {
            COLORREF color = GetPixel(hdc, origX + x, origY + y);
            COLORREF interpolatedColor = InterpolateColor(color, CONTRAST_RANGE_S, CONTRAST_RANGE_E);
            SetPixel(hdc, resX + x, resY + y, interpolatedColor);
        }
    }
}

COLORREF GetSharpPixelColor(HDC hdc, int x, int y, const int sharpMatrix[3][3])
{
    COLORREF color11 = GetPixel(hdc, x - 1, y - 1);
    COLORREF color12 = GetPixel(hdc, x + 0, y - 1);
    COLORREF color13 = GetPixel(hdc, x + 1, y - 1);

    COLORREF color21 = GetPixel(hdc, x - 1, y + 0);
    COLORREF color22 = GetPixel(hdc, x + 0, y + 0);
    COLORREF color23 = GetPixel(hdc, x + 1, y + 0);

    COLORREF color31 = GetPixel(hdc, x - 1, y + 1);
    COLORREF color32 = GetPixel(hdc, x + 0, y + 1);
    COLORREF color33 = GetPixel(hdc, x + 1, y + 1);

    int r = GetRValue(color11) * sharpMatrix[0][0] + 
        GetRValue(color12) * sharpMatrix[0][1] + 
        GetRValue(color13) * sharpMatrix[0][2] +
        GetRValue(color21) * sharpMatrix[1][0] + 
        GetRValue(color22) * sharpMatrix[1][1] + 
        GetRValue(color23) * sharpMatrix[1][2] +
        GetRValue(color31) * sharpMatrix[2][0] + 
        GetRValue(color32) * sharpMatrix[2][1] + 
        GetRValue(color33) * sharpMatrix[2][2];
    int g = GetGValue(color11) * sharpMatrix[0][0] +
        GetGValue(color12) * sharpMatrix[0][1] +
        GetGValue(color13) * sharpMatrix[0][2] +
        GetGValue(color21) * sharpMatrix[1][0] +
        GetGValue(color22) * sharpMatrix[1][1] +
        GetGValue(color23) * sharpMatrix[1][2] +
        GetGValue(color31) * sharpMatrix[2][0] +
        GetGValue(color32) * sharpMatrix[2][1] +
        GetGValue(color33) * sharpMatrix[2][2];
    int b = GetBValue(color11) * sharpMatrix[0][0] +
        GetBValue(color12) * sharpMatrix[0][1] +
        GetBValue(color13) * sharpMatrix[0][2] +
        GetBValue(color21) * sharpMatrix[1][0] +
        GetBValue(color22) * sharpMatrix[1][1] +
        GetBValue(color23) * sharpMatrix[1][2] +
        GetBValue(color31) * sharpMatrix[2][0] +
        GetBValue(color32) * sharpMatrix[2][1] +
        GetBValue(color33) * sharpMatrix[2][2];
    return RGB(r / 9, g / 9, b / 9);
}

void ChangeSharpness(HDC hdc, int sizeX, int sizeY, int origX, int origY, int resX, int resY, const int sharpMatrix[3][3])
{
    for (size_t x = 1; x < sizeX - 1; x++)
    {
        for (size_t y = 1; y < sizeY - 1; y++)
        {
            COLORREF color = GetPixel(hdc, origX + x, origY + y);
            COLORREF sharpColor = GetSharpPixelColor(hdc, origX + x, origY + y, sharpMatrix);
            SetPixel(hdc, resX + x, resY + y, sharpColor);
        }
    }
}

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_LAB4, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_LAB4));

    MSG msg;

    // Main message loop:
    while (GetMessage(&msg, nullptr, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_LAB4));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_LAB4);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Store instance handle in our global variable

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, nullptr, nullptr, hInstance, nullptr);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE: Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
    case WM_SIZE:
        SetWindowPos(hWnd, HWND_TOP, 0, 0, WIN_SIZE_X, WIN_SIZE_Y, SWP_NOMOVE);
        break;

    case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case IDM_ABOUT:
                DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
                break;
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;
    case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hWnd, &ps);
            // TODO: Add any drawing code that uses hdc here...
            HBITMAP contrast = (HBITMAP)LoadImageW(NULL, L"frac.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
            HBITMAP sharpness = (HBITMAP)LoadImageW(NULL, L"sharp.bmp", IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);

            // Contrast
            /*ChangeContrast(hdc, contrast, 200, 200, 10, 10, 220, 10);
            DrawGraph(hdc, 10, 220, 10, 10, 200, 200);
            DrawGraph(hdc, 220, 220, 220, 10, 200, 200);*/

            // Sharpness
            HDC memdc = CreateCompatibleDC(hdc);
            SelectObject(memdc, sharpness);
            BitBlt(hdc, 10, 495, 150, 150, memdc, 0, 0, SRCCOPY);
            DeleteDC(memdc);
            DrawGraph(hdc, 10, 655, 10, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 170, 495, SHARP_MATRIX_1);
            DrawGraph(hdc, 170, 655, 170, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 330, 495, SHARP_MATRIX_2);
            DrawGraph(hdc, 330, 655, 330, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 490, 495, SHARP_MATRIX_3);
            DrawGraph(hdc, 490, 655, 490, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 650, 495, SHARP_MATRIX_4);
            DrawGraph(hdc, 650, 655, 650, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 810, 495, SHARP_MATRIX_5);
            DrawGraph(hdc, 810, 655, 810, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 970, 495, SHARP_MATRIX_6);
            DrawGraph(hdc, 970, 655, 970, 495, 150, 150);

            ChangeSharpness(hdc, 150, 150, 10, 495, 1130, 495, SHARP_MATRIX_7);
            DrawGraph(hdc, 1130, 655, 1130, 495, 150, 150);

            EndPaint(hWnd, &ps);
        }
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
