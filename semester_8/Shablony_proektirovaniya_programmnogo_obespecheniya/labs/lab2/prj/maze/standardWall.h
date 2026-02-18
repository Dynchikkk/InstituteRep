#ifndef STANDARDWALL_H
#define STANDARDWALL_H

#include <iostream>
#include "wall.h"

/// <summary>
/// Concrete class representing a standard (ordinary) wall in the maze.
/// </summary>
class StandardWall : public Wall {
public:
    /// <summary>
    /// Defines the behavior when attempting to enter this wall.
    /// </summary>
    void Enter() override {
        std::cout << "Standard wall\n";
    }
};

#endif // STANDARDWALL_H