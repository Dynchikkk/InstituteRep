#include <iostream>

enum Direction { North, South, East, West };

class MapSite {
public:
    virtual ~MapSite() {}
    virtual void enter() = 0;
};

class Wall : public MapSite {
public:
    void enter() override {
        std::cout << "Wall\n";
    }
};

class Room : public MapSite {
public:
    int roomNumber;
    MapSite* sides[4];

    Room(int n) : roomNumber(n) {
        for (int i = 0; i < 4; ++i)
            sides[i] = new Wall();
    }

    void setSide(Direction d, MapSite* site) { sides[d] = site; }

    void enter() override {
        std::cout << "Room " << roomNumber << "\n";
    }
};

class Door : public MapSite {
public:
    Room* room1;
    Room* room2;
    bool isOpen;

    Door(Room* r1, Room* r2) : room1(r1), room2(r2), isOpen(true) {}

    void enter() override {
        std::cout << "Door between room " << room1->roomNumber
            << " and room " << room2->roomNumber << "\n";
    }
};

int main() {
    // Create rooms
    Room* r1 = new Room(1);
    Room* r2 = new Room(2);

    // Create door and connect rooms
    Door* d = new Door(r1, r2);
    r1->setSide(East, d);
    r2->setSide(West, d);

    // Display maze structure
    std::cout << "Maze has two rooms:\n";
    r1->enter();
    std::cout << "  East side: "; r1->sides[East]->enter();
    std::cout << "  North side: "; r1->sides[North]->enter();
    std::cout << "  South side: "; r1->sides[South]->enter();
    std::cout << "  West side: "; r1->sides[West]->enter();

    r2->enter();
    std::cout << "  West side: "; r2->sides[West]->enter();
    std::cout << "  North side: "; r2->sides[North]->enter();
    std::cout << "  South side: "; r2->sides[South]->enter();
    std::cout << "  East side: "; r2->sides[East]->enter();

    return 0;
}