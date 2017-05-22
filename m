From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Documenting sigaltstack SS_AUTODISRM
Date: Mon, 22 May 2017 22:38:59 +0200
Message-ID: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Stas,

I have attempted to document the SS_AUTODISARM feature that you added
in Linux 4.7.

Could you please take a look at the SS_AUTODISARM pieces in the
sigaltstack() man page below? There is also one FIXME that I would
like help with.

It seems to me that the API has become rather odd now. It is no longer
possible to simply check whether code is executing on an alternative
stack by using

    sigaltstack(NULL, &old_ss);
    if (old_ss.ss_flags & SS_ONSTACK)
        ....

Thanks,

Michael


NAME
       sigaltstack - set and/or get signal stack context

SYNOPSIS
       #include <signal.h>

       int sigaltstack(const stack_t *ss, stack_t *old_ss);

   Feature    Test    Macro   Requirements   for   glibc   (see   fea=E2=80=
=90
   ture_test_macros(7)):

       sigaltstack():
           _XOPEN_SOURCE >=3D 500
               || /* Since glibc 2.12: */ _POSIX_C_SOURCE >=3D 200809L
               || /* Glibc versions <=3D 2.19: */ _BSD_SOURCE

DESCRIPTION
       sigaltstack() allows a process to define a new alternate signal
       stack and/or retrieve the state of an existing alternate signal
       stack.  An alternate signal stack is used during the  execution
       of  a  signal handler if the establishment of that handler (see
       sigaction(2)) requested it.

       The normal sequence of events for  using  an  alternate  signal
       stack is the following:

       1. Allocate an area of memory to be used for the alternate sig=E2=80=
=90
          nal stack.

       2. Use sigaltstack() to inform the system of the existence  and
          location of the alternate signal stack.

       3. When  establishing  a  signal  handler  using  sigaction(2),
          inform the system that the signal handler should be executed
          on  the  alternate signal stack by specifying the SA_ONSTACK
          flag.

       The ss argument is used  to  specify  a  new  alternate  signal
       stack,  while  the old_ss argument is used to retrieve informa=E2=80=
=90
       tion about the currently established signal stack.  If  we  are
       interested  in  performing  just  one  of these tasks, then the
       other argument can be specified as NULL.

       The stack_t type used to type the arguments of this function is
       defined as follows:

           typedef struct {
               void  *ss_sp;     /* Base address of stack */
               int    ss_flags;  /* Flags */
               size_t ss_size;   /* Number of bytes in stack */
           } stack_t;

       To  establish  a new alternate signal stack, the fields of this
       structure are set as follows:

       ss.ss_flags
              This field contains either 0, or the following flag:

              SS_AUTODISARM (since Linux 4.7)
                     Clear the  alternate  signal  stack  settings  on
                     entry  to  the  signal  handler.  When the signal
                     handler returns, the  previous  alternate  signal
                     stack settings are restored.

                     This  flag  was  added  in  order make it safe to
                     switch away from the signal handler with swapcon=E2=80=
=90
                     text(3).   Without this flag, a subsequently han=E2=80=
=90
                     dled  signal  will  corrupt  the  state  of   the
                     switched-away  signal  handler.  On kernels where
                     this flag is not supported,  sigaltstack()  fails
                     with the error EINVAL when this flag is supplied.

       ss.ss_sp
              This  field specifies the starting address of the stack.
              When a signal handler is invoked on the alternate stack,
              the  kernel  automatically  aligns  the address given in
              ss.ss_sp to a suitable address boundary for the underly=E2=80=
=90
              ing hardware architecture.

       ss.ss_size
              This  field  specifies  the size of the stack.  The con=E2=80=
=90
              stant SIGSTKSZ is defined to be large  enough  to  cover
              the  usual  size  requirements  for  an alternate signal
              stack, and the constant MINSIGSTKSZ defines the  minimum
              size required to execute a signal handler.

       To  disable  an  existing stack, specify ss.ss_flags as SS_DIS=E2=80=
=90
       ABLE.  In this case, the kernel  ignores  any  other  flags  in
       ss.ss_flags and the remaining fields in ss.

       If  old_ss  is  not NULL, then it is used to return information
       about the alternate signal stack which was in effect  prior  to
       the call to sigaltstack().  The old_ss.ss_sp and old_ss.ss_size
       fields return the starting address and size of that stack.  The
       old_ss.ss_flags may return either of the following values:

       SS_ONSTACK
              The process is currently executing on the alternate sig=E2=80=
=90
              nal stack.  (Note that it is not possible to change  the
              alternate  signal stack if the process is currently exe=E2=80=
=90
              cuting on it.)

       SS_DISABLE
              The alternate signal stack is currently disabled.

              Alternatively, this value is returned if the process  is
              currently  executing  on  an alternate signal stack that
              was established using the SS_AUTODISARM flag.   In  this
              case,  it is safe to switch away from the signal handler
              with swapcontext(3).  It is also possible to  set  up  a
              different  alternative signal stack using a further call
              to sigaltstack().


              =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
              =E2=94=82FIXME                                               =
 =E2=94=82
              =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
              =E2=94=82Was it intended that one  can  set  up  a  different=
 =E2=94=82
              =E2=94=82alternative signal stack in this scenario? (In pass=
=E2=80=90 =E2=94=82
              =E2=94=82ing,  if  one  does  this,   the   sigaltstack(NULL,=
 =E2=94=82
              =E2=94=82&old_ss)  now returns old_ss.ss_flags=3D=3DSS_AUTODI=
SARM =E2=94=82
              =E2=94=82rather  than  old_ss.ss_flags=3D=3DSS_DISABLE.  The =
 API =E2=94=82
              =E2=94=82design here seems confusing...                      =
 =E2=94=82
              =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

       SS_AUTODISARM
              The  alternate  signal  stack  has  been  marked  to  be
              autodisarmed as described above.

       By specifying ss as NULL, and old_ss as a non-NULL  value,  one
       can  obtain the current settings for the alternate signal stack
       without changing them.

RETURN VALUE
       sigaltstack() returns 0 on success, or -1 on failure with errno
       set to indicate the error.

ERRORS
       EFAULT Either  ss  or  old_ss is not NULL and points to an area
              outside of the process's address space.

       EINVAL ss is not  NULL  and  the  ss_flags  field  contains  an
              invalid flag.

       ENOMEM The  specified  size  of  the new alternate signal stack
              ss.ss_size was less than MINSTKSZ.

       EPERM  An attempt was made to change the alternate signal stack
              while  it was active (i.e., the process was already exe=E2=80=
=90
              cuting on the current alternate signal stack).

ATTRIBUTES
       For an explanation of the  terms  used  in  this  section,  see
       attributes(7).

       =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90
       =E2=94=82Interface     =E2=94=82 Attribute     =E2=94=82 Value   =E2=
=94=82
       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=A4
       =E2=94=82sigaltstack() =E2=94=82 Thread safety =E2=94=82 MT-Safe =E2=
=94=82
       =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98
CONFORMING TO
       POSIX.1-2001, POSIX.1-2009, SUSv2, SVr4.

       The SS_AUTODISARM flag is a Linux extension.

NOTES
       The most common usage of an alternate signal stack is to handle
       the SIGSEGV signal that is generated if the space available for
       the  normal  process stack is exhausted: in this case, a signal
       handler for SIGSEGV cannot be invoked on the process stack;  if
       we wish to handle it, we must use an alternate signal stack.

       Establishing  an  alternate signal stack is useful if a process
       expects that it may  exhaust  its  standard  stack.   This  may
       occur,  for  example,  because the stack grows so large that it
       encounters the upwardly growing heap, or  it  reaches  a  limit
       established  by  a  call to setrlimit(RLIMIT_STACK, &rlim).  If
       the standard stack is exhausted, the kernel sends the process a
       SIGSEGV  signal.   In these circumstances the only way to catch
       this signal is on an alternate signal stack.

       On most hardware architectures supported by Linux, stacks  grow
       downward.   sigaltstack()  automatically  takes  account of the
       direction of stack growth.

       Functions called from a signal handler executing on  an  alter=E2=80=
=90
       nate  signal  stack  will  also use the alternate signal stack.
       (This also applies to any handlers invoked  for  other  signals
       while  the process is executing on the alternate signal stack.)
       Unlike the standard stack, the system  does  not  automatically
       extend  the  alternate  signal  stack.  Exceeding the allocated
       size of the alternate signal stack will lead  to  unpredictable
       results.

       A  successful  call to execve(2) removes any existing alternate
       signal stack.  A child process created via fork(2)  inherits  a
       copy of its parent's alternate signal stack settings.

       sigaltstack()  supersedes the older sigstack() call.  For back=E2=80=
=90
       ward compatibility, glibc also provides  sigstack().   All  new
       applications should be written using sigaltstack().

   History
       4.2BSD  had  a sigstack() system call.  It used a slightly dif=E2=80=
=90
       ferent struct, and had the major disadvantage that  the  caller
       had to know the direction of stack growth.

EXAMPLE
       The  following  code  segment  demonstrates  the use of sigalt=E2=80=
=90
       stack():

           stack_t ss;

           ss.ss_sp =3D malloc(SIGSTKSZ);
           if (ss.ss_sp =3D=3D NULL)
               /* Handle error */;
           ss.ss_size =3D SIGSTKSZ;
           ss.ss_flags =3D 0;
           if (sigaltstack(&ss, NULL) =3D=3D -1)
               /* Handle error */;

BUGS
       In the lead up to the development  of  the  Linux  2.4  kernel,
       someone   got   confused  and  allowed  the  kernel  to  accept
       SS_ONSTACK in ss.ss_flags, which results behavior that  is  the
       same  as  when  ss_flags  is  0.  On other implementations, and
       according to POSIX.1, SS_ONSTACK appears  only  as  a  reported
       flag in old_ss.ss_flags.  There is no need ever to specify this
       flag in ss.ss_flags.

SEE ALSO
       execve(2),    setrlimit(2),    sigaction(2),     siglongjmp(3),
       sigsetjmp(3), signal(7)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
