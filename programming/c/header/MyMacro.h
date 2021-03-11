typedef char* String;


//String_foreach(i, "ABC", "DEF") {
//printf("%s", i);
//}
#define String_foreach(iterator, ...) for (String *iterator = (String []) { __VA_ARGS__, NULL }; *iterator; iterator++)
