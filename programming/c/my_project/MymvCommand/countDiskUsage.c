//
// Created by coolder on 10/11/20.
//

//
// Created by coolder on 10/11/20.
//
#include "allheaders.h"

size_t countDiskUsage(const char* pathname)
{
  if (pathname == NULL) {
    printf("Erorr: pathname is NULL\n");
  }

  struct stat stats;

  if (lstat(pathname, &stats) == 0) {
    if (S_ISREG(stats.st_mode)){
      return stats.st_size;
    }
  } else {
    perror("lstat\n");
  }

  DIR* dir = opendir(pathname);

  if (dir == NULL) {
    perror("Error");
    return 0;
  }

  struct dirent *dirEntry;
  size_t totalSize = 4096;

  for (dirEntry = readdir(dir); dirEntry != NULL; dirEntry =   readdir(dir)) {
    long pathLength = sizeof(char) * (strlen(pathname) + strlen(dirEntry->d_name) + 2);
    char* name = (char*)malloc(pathLength);
    strcpy(name, pathname);
    strcpy(name + strlen(pathname), "/");
    strcpy(name + strlen(pathname) + 1, dirEntry->d_name);

    if (dirEntry->d_type == DT_DIR) {
      if (strcmp(dirEntry->d_name, ".") != 0 && strcmp(dirEntry->d_name, "..") != 0) {
        totalSize += countDiskUsage(name);
      }
    } else {
      int status = lstat(name, &stats);
      if (status == 0) {
        totalSize += stats.st_size;
      } else {
        perror("lstat\n");
      }
    }
    free(name);
  }

  closedir(dir);

  return totalSize;
}