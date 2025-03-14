#ifndef HASH_TABLE
#define HASH_TABLE

#define CAPACITY 50000

typedef struct Ht_item Ht_item;
// Define the Hash Table Item here
struct Ht_item {
    char* key;
    char* value;
};


typedef struct LinkedList LinkedList;
// Define the Linkedlist here
struct LinkedList {
    Ht_item* item;
    LinkedList* next;
};


typedef struct HashTable HashTable;
// Define the Hash Table here
struct HashTable {
    // Contains an array of pointers
    // to items
    Ht_item** items;
    LinkedList** overflow_buckets;
    int size;
    int count;
};

unsigned long hash_function(char* str);

// Linked list
static LinkedList* allocate_list();
static LinkedList* linkedlist_insert(LinkedList* list, Ht_item* item);
static Ht_item* linkedlist_remove(LinkedList* list);
static void free_linkedlist(LinkedList* list);

// HashTable
// -- Oveflow
static LinkedList** create_overflow_buckets(HashTable* table);
static void free_overflow_buckets(HashTable* table);
// -- HashTable  func
Ht_item* create_item(char* key, char* value);
HashTable* create_table(int size);
void free_item(Ht_item* item);
void free_table(HashTable* table);
void handle_collision(HashTable* table, unsigned long index, Ht_item* item);
void ht_insert(HashTable* table, char* key, char* value);
char* ht_search(HashTable* table, char* key);
void ht_delete(HashTable* table, char* key);
void print_search(HashTable* table, char* key);
void print_table(HashTable* table);

#endif 
