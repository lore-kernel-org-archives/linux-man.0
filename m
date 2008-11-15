From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_setschedparam.3
Date: Sat, 15 Nov 2008 22:09:58 +0100
Message-ID: <491F3AA6.6050303@domaigne.com>
References: <cfd18e0f0811060945n3224567du5e98adecb074b5e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811060945n3224567du5e98adecb074b5e-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, "brian m. carlson" <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, =?ISO-8859-1?Q?Loic_Domaign=E9?= <loic-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>, Stefan Puiu <stefanpuiuro-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hallo Michael,

enclosed my review comments.

Regards,
Lo=EFc.
--

> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\"
> .TH PTHREAD_SETSCHEDPARAM 3 2008-11-07 "Linux" "Linux Programmer's Ma=
nual"
> .SH NAME
> pthread_setschedparam, pthread_setschedparam \- set/get
> scheduling policy and parameters of a thread
> .SH SYNOPSIS
> .nf
> .B #include <pthread.h>
>=20
> .BI "pthread_setschedparam(pthread_t " thread ", int " policy ,
> .BI "                      const struct sched_param *" param );
> .BI "pthread_getschedparam(pthread_t " thread ", int *" policy ,
> .BI "                      struct sched_param *" param );
> .sp
> Compile and link with \fI\-pthread\fP.

One question regarding the synopsis. Is there a reason with the=20
"restrict" keyword is not used for pthread_getschedparam(). Accordingly=
=20
to /usr/include/pthread.h:

extern int pthread_getschedparam (pthread_t __target_thread,
                                   int *__restrict __policy,
                                   struct sched_param *__restrict __par=
am);


> .SH DESCRIPTION
> The
> .BR pthread_setschedparam ()
> function sets the scheduling policy and parameters of the thread
> .IR thread .
>=20
> .I policy
> specifies the new scheduling policy for
> .IR thread .
> The supported values for
> .IR policy ,
> and their semantics, are described in
> .BR sched_setscheduler (2).
> .\" FIXME . pthread_setschedparam() places no restriction on the poli=
cy,
> .\" but pthread_attr_setschedpolicy() restricts policy to RR/FIFO/OTH=
ER
> .\" http://sourceware.org/bugzilla/show_bug.cgi?id=3D7013

Perhaps it's my poor english... But why "new scheduling policy"? I may=20
just want to change the priority, within the same scheduling policy...

> The structure pointed to by
> .I param
> specifies the new scheduling parameters for
> .IR thread .

Similar comment here. I may just want to change the scheduling policy,=20
without changing the priority. ( I admit, this one is seldom compared t=
o=20
the previous one ).

> Scheduling parameters are maintained in the following structure:
>=20
> .in +4n
> .nf
> struct sched_param {
>     int sched_priority;     /* Scheduling priority */
> };
> .fi
> .in
>=20
> As can be seen, only one scheduling parameter is supported
> (this is the only parameter specified by POSIX.1-2001.)

No, it think this is not correct? If a system support SCHED_SPORADIC,=20
then the sched_param structure has additional fields.


> For details of the permitted ranges for scheduling priorities
> in each scheduling policy, see
> .BR sched_setscheduler (2).

> The
> .BR pthread_getschedparam ()
> function returns the scheduling policy and parameters of the thread
> .IR thread ,
> in the buffers pointed to by
> .I policy
> and
> .IR param ,
> respectively.
> The returned priority value is that set by the most recent
> .BR pthread_setschedparam (),
> .BR pthread_setschedprio (3),
> or
> .BR pthread_create (3)
> call that affected
> .IR thread .

Hmm, that's perfectly right from a POSIX point of view. Knowing how=20
Linux implements threads, I have been interested about the effect of=20
sched_setscheduler() on a MT-process (since NPTL uses 1:1 model, this=20
should be a NOP).

I tested the following program against the stable glibc-2.7...=20
Apparently, it seems that sched_setscheduler() might affect the main=20
thread priority as well.

--
#include <stdio.h>
#include <pthread.h>
#include <sched.h>
#include <unistd.h>

void
print_schedinfo(const char* thread)
{
    struct sched_param param;
    int policy;
    int rc;

    rc =3D pthread_getschedparam(pthread_self(), &policy, &param);
    if (rc!=3D0) printf("##%d\n", rc);
    printf("%s > Policy=3D%s, prio=3D%d\n",
           thread,
           (policy=3D=3DSCHED_FIFO) ? "FIFO" : "*NOT* FIFO",
	  param.sched_priority);
}

// dummy thread...
//
void*
thread(void* ignore)
{
    sleep(3);
    print_schedinfo("dummy thread");
    pthread_exit(NULL);
}

int
main()
{
    struct sched_param param;
    int    policy;
    int    rc;
    pthread_t tid;

    // create dummy thread
    //
    pthread_create(&tid, NULL, thread, NULL);
    param.sched_priority=3D1;

    // now we shall change the process policy/prio using
    // sched_setscheduler().
    // Normally: this should be a NOP. But due to the way Linux
    // implements threads, I am suspecting that this shall affect
    // the main thread
    //
    rc=3Dsched_setscheduler(0, SCHED_FIFO, &param);
    if (rc=3D=3D-1) printf("sched_setscheduler FAILED\n");

    // print my scheduling info
    //
    print_schedinfo("main");

    // join dummy thread and terminate
    //
    pthread_join(tid, NULL);
    return 0;
}

--

> The returned priority does not reflect any temporary priority adjustm=
ents
> as a result of calls to any priority inheritance or
> priority ceiling functions (see, for example,
> .BR pthread_mutexattr_setprioceiling (3)
> and
> .BR pthread_mutexattr_setprotocol (3)).
> .\" FIXME . nptl/pthread_setschedparam.c has the following
> .\"   /* If the thread should have higher priority because of some
> .\"      PTHREAD_PRIO_PROTECT mutexes it holds, adjust the priority. =
*/
> .\" Eventually (perhaps after writing the mutexattr pages), we
> .\" may want to add something on the topic to this page.

If I understood correctly, the thread can't lower the priority that he=20
has resulting from priority inheritance/ceiling. That makes perfectly=20
sense to me, otherwise this could defeat the purpose of such schemes,=20
among others avoiding priority inversion.

> .SH RETURN VALUE
> On success, these functions return 0;
> on error, they return a non-zero error number.
> If
> .BR pthread_setschedparam ()
> fails, the scheduling policy and parameters of
> .I thread
> are not changed.
> .SH ERRORS
> Both of these functions may fail with the following error:
> .TP
> .B ESRCH
> No thread with the ID
> .I thread
> could be found.

Should the ERSCH error description be consistent across pthread_* linux
man-pages? See for instance pthread_attr_setaffinity_np().

> .PP
> .BR pthread_setschedparam ()
> may additionally fail with the following errors:
> .TP
> .B EINVAL
> .I policy
> is not a recognized policy, or
> .I param
> does not make sense for the
> .IR policy .

I got troubled by the "may additionally", as "may" has a particular=20
meaning in POSIX.1...

But I guess, you just want to express that pthread_setschedparam() shal=
l=20
fail if the policy or the param is invalid, right?

> .TP
> .B EPERM
> The caller does not have appropriate privileges
> .RB ( CAP_SYS_NICE )
> to set the specified scheduling policy and parameters.
> See
> .BR sched_setscheduler (2)
> for more details on what scheduling changes require privileges.
> .PP
> POSIX.1-2001 also documents an
> .B ENOTSUP
> ("attempt was made to set the policy or scheduling parameters
> to an unsupported value") error for
> .BR pthread_setschedparam ().

=2E.. but it doesn't seem to be used by Linux/Glibc...

> .\" .SH VERSIONS
> .\" Available since glibc 2.0
> .SH CONFORMING TO
> POSIX.1-2001.
> .SH NOTES
> See
> .BR sched_setscheduler (2)
> for a description of the effect of changing a thread's
> scheduling policy and priority.
> .SH EXAMPLE
> The program below demonstrates the use of
> .BR pthread_setschedparam ()
> and
> .BR pthread_getschedparam (),
> as well as the use of a number of other scheduling-related
> pthreads functions.
>=20
> In the following run, the main thread sets its scheduling policy to
> .BR SCHED_FIFO
> with a priority of 10,
> and initializes a thread attributes object with
> a scheduling policy attribute of
> .BR SCHED_RR
> and a scheduling priority attribute of 20.
> The program then sets (using
> .BR pthread_attr_setinheritsched (3))
> the inherit scheduler attribute of the thread attributes object to
> .BR PTHREAD_EXPLICIT_SCHED ,
> meaning that threads created using this attributes object should
> take their scheduling attributes from the thread attributes object.
> The program then creates a thread using the thread attributes object,
> and that thread displays its scheduling policy and priority.
> .in +4n
> .nf
>=20
> $ \fBsu\fP      # Need privilege to set real-time scheduling policies
> Password:
> # \fB./a.out \-mf10 \-ar20 \-i e\fP
> Scheduler settings of main thread
>     policy=3DSCHED_FIFO, priority=3D10
>=20
> Scheduler settings in \(aqattr\(aq
>     policy=3DSCHED_RR, priority=3D20
>     inheritsched is EXPLICIT
>=20
> Scheduler attributes of new thread
>     policy=3DSCHED_RR, priority=3D20
> .fi
> .in
>=20
> In the above output, one can see that the scheduling policy and prior=
ity
> were taken from the values specified in the thread attributes object.
>=20
> The next run is the same as the previous,
> except that the inherit scheduler attribute is set to
> .BR PTHREAD_INHERIT_SCHED ,
> meaning that threads created using the thread attributes object shoul=
d
> ignore the scheduling attributes specified in the attributes object
> and instead take their scheduling attributes from the creating thread=
=2E
>=20
> .in +4n
> .nf
> # \fB./a.out \-mf10 \-ar20 \-i i\fP
> Scheduler settings of main thread
>     policy=3DSCHED_FIFO, priority=3D10
>=20
> Scheduler settings in \(aqattr\(aq
>     policy=3DSCHED_RR, priority=3D20
>     inheritsched is INHERIT
>=20
> Scheduler attributes of new thread
>     policy=3DSCHED_FIFO, priority=3D10
> .fi
> .in
>=20
> In the above output, one can see that the scheduling policy and prior=
ity
> were taken from the creating thread,
> rather than the thread attributes object.

A classical trap is that people don't set inheritsched to explicit, and=
=20
by default it is inherit... You could illustrate this by the following=20
example: ./a.out -mf10 -ar20.

( I don't know however if it is the right place to speak about such=20
things ).


> .SS Program source
> \&
> .nf
> /* pthreads_sched_test.c */
>=20
> #include <pthread.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <errno.h>
>=20
> /* Simple error handling functions */
>=20
> #define errExit(msg)            { perror(msg); exit(EXIT_FAILURE); }
>=20
> #define errExitEN(en, msg)      { errno =3D en; perror(msg); \\
>                                   exit(EXIT_FAILURE); }
>=20
> static void
> usage(char *prog_name, char *msg)
> {
>     if (msg !=3D NULL)
>         fputs(msg, stderr);
>=20
>     fprintf(stderr, "Usage: %s [options]\\n", prog_name);
>     fprintf(stderr, "Options are:\\n");
> #define fpe(msg) fprintf(stderr, "\\t%s", msg);          /* Shorter *=
/
>     fpe("\-a<policy><prio> Set scheduling policy and priority in\\n")=
;
>     fpe("                 thread attributes object\\n");
>     fpe("                 <policy> can be\\n");
>     fpe("                     f  SCHED_FIFO\\n");
>     fpe("                     r  SCHED_RR\\n");
>     fpe("                     o  SCHED_OTHER\\n");
>     fpe("\-A               Use default thread attributes object\\n");
>     fpe("\-i {e|s}         Set inherit scheduler attribute to\\n");
>     fpe("                 \(aqexplicit\(aq or \(aqinherit\(aq\\n");
>     fpe("\-m<policy><prio> Set scheduling policy and priority on\\n")=
;
>     fpe("                 main thread before pthread_create() call\\n=
");
>     exit(EXIT_FAILURE);
> } /* usage */
>=20
> static int
> get_policy(char p, int *policy)
> {
>     switch (p) {
>     case \(aqf\(aq: *policy =3D SCHED_FIFO;     return 1;
>     case \(aqr\(aq: *policy =3D SCHED_RR;       return 1;
>     case \(aqo\(aq: *policy =3D SCHED_OTHER;    return 1;
>     default:  return 0;
>     }
> } /* get_policy */
>=20
> static void
> display_sched_attr(int policy, struct sched_param *param)
> {
>     printf("    policy=3D%s, priority=3D%d\\n",
>             (policy =3D=3D SCHED_FIFO)  ? "SCHED_FIFO" :
>             (policy =3D=3D SCHED_RR)    ? "SCHED_RR" :
>             (policy =3D=3D SCHED_OTHER) ? "SCHED_OTHER" :
>             "???",
>             param\->sched_priority);
> } /* display_sched_attr */
>=20
> static void
> display_thread_sched_attr(char *msg)
> {
>     int policy, s;
>     struct sched_param param;
>=20
>     s =3D pthread_getschedparam(pthread_self(), &policy, &param);
>     if (s !=3D 0)
>         errExitEN(s, "pthread_getschedparam");
>=20
>     printf("%s\\n", msg);
>     display_sched_attr(policy, &param);
> } /* display_thread_sched_attr */
>=20
> static void *
> thread_start(void *arg)
> {
>     display_thread_sched_attr("Scheduler attributes of new thread");
>=20
>     return NULL;
> } /* thread_start */
>=20
> int
> main(int argc, char *argv[])
> {
>     int s, opt, inheritsched, use_null_attrib, policy;
>     pthread_t thread;
>     pthread_attr_t attr;
>     pthread_attr_t *attrp;
>     char *attr_sched_str, *main_sched_str, *inheritsched_str;
>     struct sched_param param;
>=20
>     /* Process command\-line options */
>=20
>     use_null_attrib =3D 0;
>     attr_sched_str =3D NULL;
>     main_sched_str =3D NULL;
>     inheritsched_str =3D NULL;
>=20
>     while ((opt =3D getopt(argc, argv, "a:Ai:m:")) !=3D \-1) {
>         switch (opt) {
>         case \(aqa\(aq: attr_sched_str =3D optarg;      break;
>         case \(aqA\(aq: use_null_attrib =3D 1;          break;
>         case \(aqi\(aq: inheritsched_str =3D optarg;    break;
>         case \(aqm\(aq: main_sched_str =3D optarg;      break;
>         default:  usage(argv[0], "Unrecognized option\\n");
>         }
>     }
>=20
>     if (use_null_attrib &&
>             (inheritsched_str !=3D NULL || attr_sched_str !=3D NULL))
>         usage(argv[0], "Can\(aqt specify \-A with \-i or \-a\\n");
>=20
>     /* Optionally set scheduling attributes of main thread,
>        and display the attributes */
>=20
>     if (main_sched_str !=3D NULL) {
>         if (!get_policy(main_sched_str[0], &policy))
>             usage(argv[0], "Bad policy for main thread (\-s)\\n");
>         param.sched_priority =3D strtol(&main_sched_str[1], NULL, 0);
>=20
>         s =3D pthread_setschedparam(pthread_self(), policy, &param);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_setschedparam");
>     }
>=20
>     display_thread_sched_attr("Scheduler settings of main thread");
>     printf("\\n");
>=20
>     /* Initialize thread attributes object according to options */
>=20
>     attrp =3D NULL;
>=20
>     if (!use_null_attrib) {
>         s =3D pthread_attr_init(&attr);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_init");
>         attrp =3D &attr;
>     }
>=20
>     if (inheritsched_str !=3D NULL) {
>         if (inheritsched_str[0] =3D=3D \(aqe\(aq)
>             inheritsched =3D PTHREAD_EXPLICIT_SCHED;
>         else if (inheritsched_str[0] =3D=3D \(aqi\(aq)
>             inheritsched =3D PTHREAD_INHERIT_SCHED;
>         else
>             usage(argv[0], "Value for \-i must be \(aqe\(aq or \(aqi\=
(aq\\n");
>=20
>         s =3D pthread_attr_setinheritsched(&attr, inheritsched);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_setinheritsched");
>     }
>=20
>     if (attr_sched_str !=3D NULL) {
>         if (!get_policy(attr_sched_str[0], &policy))
>             usage(argv[0],
>                     "Bad policy for \(aqattr\(aq (\-a)\\n");
>         param.sched_priority =3D strtol(&attr_sched_str[1], NULL, 0);
>=20
>         s =3D pthread_attr_setschedpolicy(&attr, policy);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_setschedpolicy");
>         s =3D pthread_attr_setschedparam(&attr, &param);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_setschedparam");
>     }
>=20
>     /* If we initialized a thread attributes object, display
>        the scheduling attributes that were set in the object */
>=20
>     if (attrp !=3D NULL) {
>         s =3D pthread_attr_getschedparam(&attr, &param);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_getschedparam");
>         s =3D pthread_attr_getschedpolicy(&attr, &policy);
>         if (s !=3D 0)
>             errExitEN(s, "pthread_attr_getschedpolicy");
>=20
>         printf("Scheduler settings in \(aqattr\(aq\\n");
>         display_sched_attr(policy, &param);
>=20
>         s =3D pthread_attr_getinheritsched(&attr, &inheritsched);
>         printf("    inheritsched is %s\\n",
>                 (inheritsched =3D=3D PTHREAD_INHERIT_SCHED)  ? "INHER=
IT" :
>                 (inheritsched =3D=3D PTHREAD_EXPLICIT_SCHED) ? "EXPLI=
CIT" :
>                 "???");
>         printf("\\n");
>     }
>=20
>     /* Create a thread that will display its scheduling attributes */
>=20
>     s =3D pthread_create(&thread, attrp, &thread_start, NULL);
>     if (s !=3D 0)
>         errExitEN(s, "pthread_create");
>=20
>     /* Destroy unneeded thread attributes object */
>=20
>     s =3D pthread_attr_destroy(&attr);
>     if (s !=3D 0)
>         errExitEN(s, "pthread_attr_destroy");
>=20
>     s =3D pthread_join(thread, NULL);
>     if (s !=3D 0)
>         errExitEN(s, "pthread_join");
>=20
>     exit(EXIT_SUCCESS);
> } /* main */
> .fi
> .SH SEE ALSO
> .BR sched_get_priority_min (2),
> .BR sched_setscheduler (2),
> .BR pthread_attr_init (3),
> .BR pthread_attr_setinheritsched (3),
> .BR pthread_attr_setschedparam (3),
> .BR pthread_attr_setschedpolicy (3),
> .BR pthread_setschedprio (3),
> .BR pthread_create (3),
> .BR pthread_self (3),
> .BR pthreads (7)
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
