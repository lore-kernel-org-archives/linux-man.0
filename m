From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 25292] New: async-signal-safe functions list in Linux
Date: Mon, 20 Dec 2010 05:38:16 GMT
Message-ID: <bug-25292-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=25292

           Summary: async-signal-safe functions list in Linux
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No


Signal(7) described which functions are async-signal-safe. But it is only
written POSIX definition, is not described linux implementation specific limit.
And it should be.

I have three example.

1. fork

glibc malloc are calling pthread_atfork() internally, therefore our fork is
async signal unsafe since long time ago.

http://sourceware.org/bugzilla/show_bug.cgi?id=4737


The standard comitte has decided to remove fork() from async-signal-safe
functions in future standard. (see following defect reports)

http://www.opengroup.org/austin/aardvark/latest/xshbug3.txt

>  _____________________________________________________________________________
>  COMMENT                                         Enhancement Request Number 15
>  rajani.g.k:xxxxxx                              Defect in XSH 2.4.3 (rdvk#  6)
>  {GKRFORK012009}                                  Thu, 8 Jan 2009 07:41:10 GMT
>  _____________________________________________________________________________
>  Accept_____    Accept as marked below_X___     Duplicate_____     Reject_____
>  Rationale for rejected or partial changes:
> 
> We agreed not to send this down the interps track yet.
> 
> The standard is clear and concerns are being forwarded to the sponsor.
> A previous interpretation 1003.1c-1995 #37, and also ERN XSHbug2145 have
> addressed the same issue, but still the problem has remained unresolved.
> 
> Because of the problems which exist here it has become
> clear that an application using pthread_atfork(), even if the application itself
> did not call pthread_atfork(), may have had pthread_atfork() handlers
> installed by a third party library or the implementation. Therefore
> calling fork() from an asynchronous signal handler is undefined.
> Therefore we are removing fork() from the list of
> async-signal-safe functions.
> 
> 
> Recommendations for a future revision:
> A future revision should mandate posix_spawn() and add that to the list
> of async-signal-safe functions.
> Remove fork() from the list of async-signal-safe functions.
> [ 12 Feb 2009 - we had no consensus on the changes for a future revision]

2. aio_suspend

It is using pthread_mutex_lock() internally.

glibc/sysdeps/pthread/aio_suspend.c
------------------------------------------
int
aio_suspend (list, nent, timeout)
     const struct aiocb *const list[];
     int nent;
     const struct timespec *timeout;
{
(snip)

  /* Request the mutex.  */
  pthread_mutex_lock (&__aio_requests_mutex);


3. execle

It is using realloc internally.

glibc/posix/execle.c
----------------------------------------------------------
int
execle (const char *path, const char *arg, ...)
{
#define INITIAL_ARGV_MAX 1024
  size_t argv_max = INITIAL_ARGV_MAX;
  const char *initial_argv[INITIAL_ARGV_MAX];
  const char **argv = initial_argv;
  va_list args;
  argv[0] = arg;

  va_start (args, arg);
  unsigned int i = 0;
  while (argv[i++] != NULL)
    {
      if (i == argv_max)
        {
          argv_max *= 2;
          const char **nptr = realloc (argv == initial_argv ? NULL : argv,
                                       argv_max * sizeof (const char *));
          if (nptr == NULL)
            {


Can you please consider to update signal(7) man page?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
