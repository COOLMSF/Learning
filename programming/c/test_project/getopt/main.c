// #include <unistd.h>
// #include <stdio.h>
// #include <stdlib.h>
// #include <getopt.h>
//
// /** Program to calculate the area and perimeter of
//  * a rectangle using command line arguments
//  */
// void print_usage() {
//     printf ( "Usage rectangle [ap] -L whether -b whether \n");
// }
//
// int main(int argc, char *argv[]) {
//     int option = 0;
//
//     //Specifying the expected options
//     //The two options l and b expect numbers as argument
//
//     //while ((option = getopt(argc, argv,"apl:b:")) != -1) {
//     //    switch (option) {
//     //        case 'a' :
//     //            puts("a set");
//     //            break;
//     //        case 'p' :
//     //            puts("p set");
//     //            break;
//     //        case 'l' :
//     //            puts("l set");
//     //            puts("value is a string");
//     //            printf("value %s\n", optarg);
//     //            break;
//     //        case 'b' :
//     //            puts("b set");
//     //            printf("value %d\n", atoi(optarg));
//     //            break;
//     //        default:
//     //            print_usage();
//     //            exit(EXIT_FAILURE);
//     //    }
//     //}
//
//     int c = 0;
//     while (c != 10) {
//         int w = 1;
//         printf("%d", w);
//         c++;
//     }
// }

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

/* Flag set by ‘--verbose'. */
static int verbose_flag;

int
main (int argc, char **argv)
{
  int c;

  while (1)
    {
      static struct option long_options[] =
        {
          /* These options set a flag. */
          {"verbose", no_argument,       &verbose_flag, 1},
          {"brief",   no_argument,       &verbose_flag, 0},
          /* These options don’t set a flag.
             We distinguish them by their indices. */
          {"add",     no_argument,       0, 'a'},
          {"append",  no_argument,       0, 'b'},
          {"delete",  required_argument, 0, 'd'},
          {"create",  required_argument, 0, 'c'},
          {"file",    required_argument, 0, 'f'},
          {0, 0, 0, 0}
        };
      /* getopt_long stores the option index here. */
      int option_index = 0;

      c = getopt_long (argc, argv, "abc:d:f:",
                       long_options, &option_index);

      /* Detect the end of the options. */
      if (c == -1)
        break;

      switch (c)
        {
        case 0:
          /* If this option set a flag, do nothing else now. */
          if (long_options[option_index].flag != 0)
            break;
          printf ("option %s", long_options[option_index].name);
          if (optarg)
            printf (" with arg %s", optarg);
          printf ("\n");
          break;

        case 'a':
          puts ("option -a\n");
          break;

        case 'b':
          puts ("option -b\n");
          break;

        case 'c':
          printf ("option -c with value `%s'\n", optarg);
          break;

        case 'd':
          printf ("option -d with value `%s'\n", optarg);
          break;

        case 'f':
          printf ("option -f with value `%s'\n", optarg);
          break;

        case '?':
          /* getopt_long already printed an error message. */
          break;

        default:
          abort ();
        }
    }

  /* Instead of reporting ‘--verbose'
     and ‘--brief’ as they are encountered,
     we report the final status resulting from them. */
  if (verbose_flag)
    puts ("verbose flag is set");

  /* Print any remaining command line arguments (not options). */
  if (optind < argc)
    {
      printf ("non-option ARGV-elements: ");
      while (optind < argc)
        printf ("%s ", argv[optind++]);
      putchar ('\n');
    }

  exit (0);
}