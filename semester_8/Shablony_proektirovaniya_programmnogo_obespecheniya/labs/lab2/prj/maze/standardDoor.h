#ifndef STANDARDDOOR_H
#define STANDARDDOOR_H

#include "door.h"
#include "room.h"

/// <summary>
/// Concrete class representing a standard door that connects two rooms.
/// </summary>
class StandardDoor : public Door {
public:
    /// <summary>
    /// Constructs a StandardDoor that connects two rooms.
    /// </summary>
    /// <param name="r1">Pointer to the first room.</param>
    /// <param name="r2">Pointer to the second room.</param>
    StandardDoor(Room* r1, Room* r2);

    /// <summary>
    /// Defines the behavior when entering the door.
    /// Outputs a message indicating it's a door.
    /// </summary>
    void Enter() override;

    /// <summary>
    /// Given one room, returns the room on the other side of the door.
    /// </summary>
    /// <param name="r">Pointer to a room (should be one of the two rooms this door connects).</param>
    /// <returns>Pointer to the other room, or nullptr if the given room is not connected.</returns>
    Room* OtherSideFrom(Room* r) override;

private:
    /// Pointer to the first connected room.
    Room* room1_; 
    /// Pointer to the second connected room.
    Room* room2_; 
    /// Indicates whether the door is open or closed.
    bool isOpen_;   
};

#endif // STANDARDDOOR_H