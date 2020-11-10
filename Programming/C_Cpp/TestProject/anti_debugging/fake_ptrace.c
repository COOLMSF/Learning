enum __ptrace_request
{
  /* Indicate that the process making this request should be traced.
     All signals received by this process can be intercepted by its
     parent, and its parent can use the other `ptrace' requests.  */
  PTRACE_TRACEME = 0,
};

long ptrace(enum __ptrace_request request, unsigned int pid,
                    void *addr, void *data)
{
    return 0;
}
