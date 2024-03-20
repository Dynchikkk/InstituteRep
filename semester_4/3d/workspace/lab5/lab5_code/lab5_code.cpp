// lab5_code.cpp : Defines the entry point for the application.
//

#include "framework.h"
#include "lab5_code.h"
#include "data.h"

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

void UpdateVid()
{
    vid[0][0] = -sin(t);
    vid[0][1] = -cos(f) * cos(t);
    vid[0][2] = -sin(f) * cos(t);
    vid[1][0] = cos(t);
    vid[1][1] = -cos(f) * sin(t);
    vid[1][2] = -sin(f) * sin(t);
    vid[2][1] = sin(f);
    vid[2][2] = -cos(f);
    vid[3][2] = R;
}


void UpdatePer()
{
    int n;
    for (int i = 0; i < sizeof(halfcube_2D) / (ARRAY_SIZE * 4); i++)
    {
        if (halfcube_2D[i][3] == 1)
            continue;

        n = 1 - halfcube_2D[i][3];
        halfcube_2D[i][3] = 1;
        halfcube_2D[i][0] += n;
        halfcube_2D[i][1] += n;
    }
}

void Copy(const double temp[][4], double halfcube_2D[][4])
{
	for (int i = 0; i < sizeof(halfcube) / (ARRAY_SIZE * 4); i++)
	{
		for (int j = 0; j < 4; j++)
			halfcube_2D[i][j] = temp[i][j];
	}
}

void Transformation(double halfcube_2D[][4], double transf[4][4])
{
	double x[4];

	for (int i = 0; i < sizeof(halfcube) / (ARRAY_SIZE * 4); i++)
	{
		for (int j = 0; j < 4; j++)
			x[j] = 
			halfcube_2D[i][0] * transf[0][j] + 
			halfcube_2D[i][1] * transf[1][j] + 
			halfcube_2D[i][2] * transf[2][j] + 
			halfcube_2D[i][3] * transf[3][j];

		for (int j = 0; j < 4; j++)
			halfcube_2D[i][j] = x[j];
	}
}

void DrawCube(HDC hdc, double halfcube_2D[][4])
{
	// draw front
	MoveToEx(hdc, halfcube_2D[0][0], halfcube_2D[0][1], NULL);
	for (int i = 1; i < 4; i++)
		LineTo(hdc, halfcube_2D[i][0], halfcube_2D[i][1]);
	LineTo(hdc, halfcube_2D[0][0], halfcube_2D[0][1]);

	// draw back
	MoveToEx(hdc, halfcube_2D[4][0], halfcube_2D[4][1], NULL);
	for (int i = 5; i < 8; i++)
		LineTo(hdc, halfcube_2D[i][0], halfcube_2D[i][1]);
	LineTo(hdc, halfcube_2D[4][0], halfcube_2D[4][1]);

	// draw up
	MoveToEx(hdc, halfcube_2D[0][0], halfcube_2D[0][1], NULL);
	LineTo(hdc, halfcube_2D[4][0], halfcube_2D[4][1]);
	LineTo(hdc, halfcube_2D[7][0], halfcube_2D[7][1]);
	LineTo(hdc, halfcube_2D[3][0], halfcube_2D[3][1]);

	// draw down
	MoveToEx(hdc, halfcube_2D[1][0], halfcube_2D[1][1], NULL);
	LineTo(hdc, halfcube_2D[5][0], halfcube_2D[5][1]);
	LineTo(hdc, halfcube_2D[6][0], halfcube_2D[6][1]);
	LineTo(hdc, halfcube_2D[2][0], halfcube_2D[2][1]);
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
    LoadStringW(hInstance, IDC_LAB5CODE, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_LAB5CODE));

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
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_LAB5CODE));
    wcex.hCursor        = LoadCursor(nullptr, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_LAB5CODE);
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

	case WM_KEYDOWN:
	{
		int wmId = LOWORD(wParam);

		switch (wmId)
		{
		case VK_UP:
			f += PI / 36;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_DOWN:
			f -= PI / 36;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_RIGHT:
			t -= PI / 36;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_LEFT:
			t += PI / 36;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;

		case VK_NUMPAD4:
			per[3][0] -= 10;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_NUMPAD6:
			per[3][0] += 10;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_NUMPAD2:
			per[3][1] += 10;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_NUMPAD8:
			per[3][1] -= 10;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;

		case VK_SUBTRACT:
			per[2][3]--;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;
		case VK_ADD:
			per[2][3]++;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
			break;

		case VK_CONTROL:
			per[2][3] = 0;
			f = F;
			t = T;
			UpdateVid();
			InvalidateRect(hWnd, 0, true);
			UpdateWindow(hWnd);
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

		Copy(halfcube, halfcube_2D);

		Transformation(halfcube_2D, vid);
		Transformation(halfcube_2D, per);

		UpdatePer();

		DrawCube(hdc, halfcube_2D);

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
