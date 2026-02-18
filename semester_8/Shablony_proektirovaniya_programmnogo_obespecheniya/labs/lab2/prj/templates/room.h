#ifndef ROOM_H
#define ROOM_H

#include "mapSite.h"

/// <summary>
/// Directions for the four sides of a room.
/// </summary>
enum Direction { North, South, East, West };

/// <summary>
/// Abstract base class representing a room in the maze.
/// </summary>
class Room : public MapSite {
public:
    /// <summary>
    /// Destructor.
    /// </summary>
    virtual ~Room() = default;

    /// <summary>
    /// Places a MapSite on the specified side of the room.
    /// </summary>
    /// <param name="dir">The side (North, South, East, West) where the site is placed.</param>
    /// <param name="site">Pointer to the MapSite (wall, door, etc.) to set. The room takes ownership.</param>
    virtual void SetSide(Direction dir, MapSite* site) = 0;

    /// <summary>
    /// Retrieves the MapSite on the specified side of the room.
    /// </summary>
    /// <param name="dir">The side (North, South, East, West) to query.</param>
    /// <returns>Pointer to the MapSite on that side, or nullptr if not set.</returns>
    virtual MapSite* GetSide(Direction dir) const = 0;

    /// <summary>
    /// Returns the room number.
    /// </summary>
    /// <returns>The integer identifier of the room.</returns>
    virtual int GetNumber() const = 0;
};

#endif // ROOM_H