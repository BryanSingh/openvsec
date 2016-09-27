#include <pwd.h>
#define ROOT 0

struct passwd *getpwuid(int uid);
struct passwd *getpwnam(char *name);

class determine_running_processes {


}