#ifndef DOOR_H
#define DOOR_H

#include "mapSite.h"
#include "room.h"

/// <summary>
/// Abstract base class representing a door that connects two rooms.
/// Doors are MapSites that can be entered and provide passage between rooms.
/// </summary>
class Door : public MapSite {
public:
    /// <summary>
    /// Destructor.
    /// </summary>
    virtual ~Door() = default;

    /// <summary>
    /// Given one room, returns the room on the other side of the door.
    /// </summary>
    /// <param name="r">Pointer to a room (should be one of the two rooms this door connects).</param>
    /// <returns>Pointer to the other room, or nullptr if the given room is not connected.</returns>
    virtual Room* OtherSideFrom(Room* r) = 0;
};

#endif // DOOR_H