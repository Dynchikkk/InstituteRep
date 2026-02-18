#ifndef WALL_H
#define WALL_H

#include "mapSite.h"

/// <summary>
/// Abstract base class for walls in the maze.
/// Walls are MapSites that cannot be entered (typically).
/// </summary>
class Wall : public MapSite {
public:
    /// <summary>
    /// Destructor.
    /// </summary>
    virtual ~Wall() = default;
};

#endif // WALL_H