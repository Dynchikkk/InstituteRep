#ifndef STANDARDROOM_H
#define STANDARDROOM_H

#include <vector>
#include "room.h"

/// <summary>
/// Concrete class representing a standard (ordinary) room in the maze.
/// </summary>
class StandardRoom : public Room {
public:
    /// <summary>
    /// Constructs a standard room with the given number.
    /// </summary>
    /// <param name="roomNumber">The unique identifier/number of the room.</param>
    explicit StandardRoom(int roomNumber);

    /// <summary>
    /// Places a MapSite (wall, door, etc.) on the specified side of the room.
    /// </summary>
    /// <param name="dir">The side (North, South, East, West) where the site is placed.</param>
    /// <param name="site">Pointer to the MapSite to set on that side.</param>
    void SetSide(Direction dir, MapSite* site) override;

    /// <summary>
    /// Retrieves the MapSite on the specified side of the room.
    /// </summary>
    /// <param name="dir">The side to query.</param>
    /// <returns>Pointer to the MapSite on that side, or nullptr if not set.</returns>
    MapSite* GetSide(Direction dir) const override;

    /// <summary>
    /// Returns the room number.
    /// </summary>
    /// <returns>The integer identifier of the room.</returns>
    int GetNumber() const override;

    /// <summary>
    /// Defines the behavior when entering the room.
    /// </summary>
    void Enter() override;

private:
    /// Unique room number.
    int roomNumber_;                
    /// Array of four sides (North, South, East, West) containing MapSites.
    std::vector<MapSite*> sides_;    
};

#endif // STANDARDROOM_H