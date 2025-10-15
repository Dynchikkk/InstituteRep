#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <dirent.h>
#include <unistd.h>
#include <errno.h>
#include <limits.h>

#define SOURCE_DIR "/bin"
#define TARGET_SUBDIR "bin"

// === Function prototypes ===
int create_target_dir(const char *base_dir, char *out_path, size_t size);
void link_bin_files(const char *target_path);
void create_link(const char *src_path, const char *dst_path);

// === Main function ===
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <target_directory>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char target_path[PATH_MAX];

    if (create_target_dir(argv[1], target_path, sizeof(target_path)) == -1) {
        return EXIT_FAILURE;
    }

    printf("Creating hard links in directory: %s\n\n", target_path);
    link_bin_files(target_path);

    printf("\nDone! All possible files from /bin were linked to %s\n", target_path);
    return EXIT_SUCCESS;
}

// === Create the subdirectory bin ===
int create_target_dir(const char *base_dir, char *out_path, size_t size) {
    snprintf(out_path, size, "%s/%s", base_dir, TARGET_SUBDIR);

    if (mkdir(out_path, 0755) == -1) {
        if (errno != EEXIST) {
            perror("Error creating subdirectory bin");
            return -1;
        }
    } else {
        printf("Subdirectory created: %s\n", out_path);
    }

    return 0;
}

// === Iterate through /bin and create links ===
void link_bin_files(const char *target_path) {
    DIR *src_dir = opendir(SOURCE_DIR);
    if (!src_dir) {
        perror("Failed to open /bin");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(src_dir)) != NULL) {
        // Skip "." and ".."
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
            continue;

        char src_path[PATH_MAX];
        char dst_path[PATH_MAX];

        snprintf(src_path, sizeof(src_path), "%s/%s", SOURCE_DIR, entry->d_name);
        snprintf(dst_path, sizeof(dst_path), "%s/%s", target_path, entry->d_name);

        struct stat sb;
        if (stat(src_path, &sb) == -1) {
            perror("Error getting file info");
            continue;
        }

        // Only create links for regular files
        if (S_ISREG(sb.st_mode)) {
            create_link(src_path, dst_path);
        }
    }

    closedir(src_dir);
}

// === Create one hard link ===
void create_link(const char *src_path, const char *dst_path) {
    // Remove destination if it already exists
    unlink(dst_path);

    if (link(src_path, dst_path) == -1) {
        fprintf(stderr, "Failed to create link: %s → %s : %s\n",
                dst_path, src_path, strerror(errno));
    } else {
        printf("Link created: %s → %s\n", dst_path, src_path);
    }
}
