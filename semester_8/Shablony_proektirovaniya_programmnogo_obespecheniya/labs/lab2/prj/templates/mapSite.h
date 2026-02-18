#ifndef MAPSITE_H
#define MAPSITE_H

/// <summary>
/// Base class for all elements that make up a maze (rooms, walls, doors, etc.).
/// </summary>
class MapSite {
public:
    /// <summary>
    /// Destructor
    /// </summary>
    virtual ~MapSite() = default;

    /// <summary>
    /// Defines the behavior when a player or entity attempts to enter this map element.
    /// </summary>
    virtual void Enter() = 0;
};

#endif // MAPSITE_H