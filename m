From: Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#28702: pthread_setname_np(3) missing man page
Date: Thu, 20 Dec 2012 17:11:53 +0530
Message-ID: <CAMNJgjJfF6Osp1G26bm7SrwknoBzRpF2yWu0R_avJjbgkqoPkw@mail.gmail.com>
References: <CAMNJgjLgNe61yEuQzah3s2znd3nLyB_k71OpU=ntx+oq30RfHQ@mail.gmail.com>
	<CAKgNAkjwOZPCDMQYAh_H8e7jpD1kwJz0mc1cnZttXt_7N9EyHQ@mail.gmail.com>
	<CAMNJgjJ1C6mtxEa8f2K1SeDprEpi79L3KLagyJfnDLQdPVHzPw@mail.gmail.com>
	<CAMNJgjJyGTmicnxLq8LGQ_+PPO9jn5gb7e_Wqb58VhZRmxgxeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMNJgjJyGTmicnxLq8LGQ_+PPO9jn5gb7e_Wqb58VhZRmxgxeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Any feedback on this man page?

Thanks,
Chandan

On Tue, Dec 11, 2012 at 6:24 PM, Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> Sorry about getting back to you this late. Was caught up with exams
> and stuff for the last month. Here's the updated document with all of
> your comments incorporated.
> Please review it and let me know your comments.
>
> .\" Copyright (C) 2012 Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" Permission is granted to make and distribute verbatim copies of this
> .\" manual provided the copyright notice and this permission notice are
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of this
> .\" manual under the conditions for verbatim copying, provided that the
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied by
> .\" the source, must acknowledge the copyright and authors of this work.
> .\"
> .TH PTHREAD_SETNAME_NP 3 2012-10-24 "Linux" "Linux Programmer's Manual"
> .SH NAME
> pthread_setname_np, pthread_getname_np \- set/get the name of a thread
> .SH SYNOPSIS
> .nf
> .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
> .B #include <pthread.h>
> .BI "int pthread_setname_np(pthread_t *" thread ", const char *" name ");
> .BI "int pthread_getname_np(pthread_t *" thread ", const char *" name
> ", size_t" len);
> .fi
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> By default, all the threads created using
> .BR pthread_create (3)
> inherit the program name.
> Using
> .BR pthread_setname_np (3),
> users can specify a unique name for a thread,
> which can be particularly useful for debugging complicated
> multi-threaded applications.
> The thread name is a meaningful C language string, whose length is
> restricted to 16 characters.
> Anything greater than this would lead to an error.
>
> The
> .BR pthread_getname_np (3)
> can be used to retrieve the name of the thread.
> The buffer specified by name must be at least 16 characters in length.
> The returned thread name in the output buffer will be null terminated.
> .SH RETURN VALUE
> On success, these functions return 0;
> on error, they return a nonzero error number.
> .SH ERRORS
> If the functions fail to open /proc/self/task/<TID>/comm, then the
> call may fail with one of
> the errors described in
> .BR open (2).
> .TP
> .B ERANGE
> The length of the string specified as second argument exceeds the allowed limit.
>
> .SH NOTES
> .BR pthread_setname_np (3)
> internally writes to the thread specific comm file under
> .IR /proc
> filesystem:
> .IR /proc/self/task/<tid>/comm.
> .BR pthread_getname_np (3)
> retreives it from the same location.
>
> .SH EXAMPLE
> .PP
> The program below demonstrates the use of
> .BR pthread_setname_np (),
> as well as
> .BR pthread_getname_np ().
>
> The following shell session shows a sample run of the program:
> .in +4n
> .nf
>
> .RB "$" " ./a.out 1 2 4 7 14"
> Created a thread. Default name is: a.out
> The thread name after setting it is THREADFOO.
> Done
> .fi
> .in
>
> .SS Program source
> \&
> .nf
> #define _GNU_SOURCE
>
> #include <pthread.h>
> #include <stdio.h>
> #include <string.h>
> #include <unistd.h>
> #include <errno.h>
> #include <stdlib.h>
>
> #define NAMELEN 16
>
> #define errExitEN(en, msg) \\
>         do { if(en) { errno = en; perror(msg); \\
>                 exit(EXIT_FAILURE);} \\
>         } while (0)
>
> static void *threadfunc(void *parm)
> {
>     sleep(5);                   // allow main program to set the thread name
>     return NULL;
> }
>
> int main(int argc, char **argv)
> {
>     pthread_t thread;
>     int rc;
>     char thread_name[NAMELEN];
>
>     rc = pthread_create(&thread, NULL, threadfunc, NULL);
>     errExitEN(rc, "pthread_create");
>     rc = pthread_getname_np(thread, thread_name, NAMELEN);
>     errExitEN(rc, "pthread_getname_np");
>     printf("Created a thread. Default name is: %s\\n", thread_name);
>     rc = pthread_setname_np(thread, "THREADFOO");
>     errExitEN(rc, "pthread_setname_np");
>     sleep(2);
>     rc = pthread_getname_np(thread, thread_name, NAMELEN);
>     errExitEN(rc, "pthread_getname_np");
>     printf("The thread name after setting it is %s.\\n", thread_name);
>     rc = pthread_join(thread, NULL);
>     errExitEN(rc, "pthread_join");
>     printf("Done\\n");
>     exit(EXIT_SUCCESS);
> }
> .fi
> .SH SEE ALSO
> .ad l
> .nh
> .BR prctl (2),
> .BR pthread_create (3),
> .BR pthreads (7)
>
> Thanks very much,
> Chandan
>
> On Tue, Oct 30, 2012 at 12:20 AM, Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Thanks Michael. Will get back to you with the updated document.
>>
>> On Sat, Oct 27, 2012 at 1:20 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hello Chandan,
>>>
>>> Thanks for the proposed page. Comments below.
>>>
>>> On Thu, Oct 25, 2012 at 7:54 PM, Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Hi,
>>>>
>>>> I have been working on the man pages (version 3.43) for the following APIs:
>>>>
>>>> pthread_setname_np
>>>> pthread_getname_np
>>>
>>> It would be best to integrate these into a single page please.
>>>
>>>> Currently I'm sending the man page document for pthread_setname_np().
>>>> Will submit pthread_getname_np() as soon as I get some review comments
>>>> for this one.
>>>
>>> See above.
>>>
>>>> I looked at the following sources on the Internet, plus the
>>>> glibc-2.16.0 source code, to gather information about these APIs.
>>>>
>>>> http://publib.boulder.ibm.com/infocenter/iseries/v7r1m0/index.jsp?topic=%2Fapis%2Fpthread_setname_np.htm
>>>> http://h30097.www3.hp.com/docs/base_doc/DOCUMENTATION/V51B_HTML/MAN/MAN3/2477____.HTM
>>>> http://www.qnx.com/developers/docs/6.3.2/neutrino/lib_ref/p/pthread_setname_np.html
>>>> http://sourceware.org/ml/libc-help/2010-03/msg00018.html
>>>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=4614a696bd1c3a9af3a08f0e5874830a85b889d4
>>>>
>>>> Following is the source of the man page. Please review the same, and
>>>> let me know your comments.
>>>>
>>>> .\" Copyright (c) 2008 Linux Foundation, written by Chandan Apsangi
>>>> .\"     <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Why the copyright assignment to LF?
>>>
>>>> .\"
>>>> .\" Permission is granted to make and distribute verbatim copies of this
>>>> .\" manual provided the copyright notice and this permission notice are
>>>> .\" preserved on all copies.
>>>> .\"
>>>> .\" Permission is granted to copy and distribute modified versions of this
>>>> .\" manual under the conditions for verbatim copying, provided that the
>>>> .\" entire resulting derived work is distributed under the terms of a
>>>> .\" permission notice identical to this one.
>>>> .\"
>>>> .\" Since the Linux kernel and libraries are constantly changing, this
>>>> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
>>>> .\" responsibility for errors or omissions, or for damages resulting from
>>>> .\" the use of the information contained herein.  The author(s) may not
>>>> .\" have taken the same level of care in the production of this manual,
>>>> .\" which is licensed free of charge, as they might when working
>>>> .\" professionally.
>>>> .\"
>>>> .\" Formatted or processed versions of this manual, if unaccompanied by
>>>> .\" the source, must acknowledge the copyright and authors of this work.
>>>> .\"
>>>> .TH PTHREAD_SETNAME_NP 3 2012-10-24 "Linux" "Linux Programmer's Manual"
>>>> .SH NAME
>>>> pthread_setname_np \- Name a thread
>>>> .SH SYNOPSIS
>>>> .nf
>>>
>>> I think you need to add
>>>
>>> .B #define _GNU_SOURCE
>>>
>>>> .B #include <pthread.h>
>>>>
>>>> .BI "int pthread_setname_np(pthread_t *" thread ", const char *" name ");
>>>> .fi
>>>> .sp
>>>> Compile and link with \fI\-pthread\fP.
>>>> .SH DESCRIPTION
>>>> By default, all the threads created using
>>>> .BR pthread_create (3)
>>>> are unnamed.
>>>
>>> The preceding is not true. They all have the name of the program, initially.
>>>
>>>> Using this API,
>>>
>>> Using pthread_setname_np()
>>>
>>>> users can specify a unique name for a
>>>> thread, which can be particularly useful for debugging complicated
>>>> multi-threaded applications. The thread name is a meaningful C
>>>
>>> Have a read of man-pages(7). It has many useful tips. One of them is,
>>> start new sentences on new source lines please.
>>>
>>>> language string, whose length is restricted to 16 characters. Anything
>>>> greater than this would lead to an error.
>>>> .SH RETURN VALUE
>>>> On success,
>>>> .BR pthread_setname_np ()
>>>> returns 0;
>>>> on error, it returns an error number.
>>>> .SH ERRORS
>>>
>>> In the ERRORS section, it may be be best to use separate lists for the
>>> set and get functions.
>>>
>>>> .\" FIXME . Find out and add other errors
>>>
>>> I think it would be sufficient to say that if the function fails to
>>> open /proc/self/task/<TID>/comm, then the call may fail with one of
>>> the errors described in open(2).
>>>
>>>> .TP
>>>> .B ERANGE
>>>> The length of the string specified as second argument exceeds the allowed limit.
>>>> .TP
>>>> .B EIO
>>>> The name could not be written to the thread specific file due to some I/O error.
>>>>
>>>> .SH CONFORMING TO
>>>> POSIX.1-2001.
>>>
>>> The above is untrue. Hence the "_np" in the name. Rather, this is a
>>> nonstandard function, present in glibc and and a few other systems.
>>>
>>>> .SH NOTES
>>>> This API
>>>
>>> The pthread_setname_np() function.
>>>
>>>> internally writes to the thread specific comm file under
>>>> .IR /proc
>>>> filesystem:
>>>> .IR /proc/self/task/<tid>/comm.
>>>> .SH BUGS
>>>> NO BUGS YET.
>>>
>>> So, you can omit the BUGS section.
>>>
>>>> .SH EXAMPLE
>>>> The program below demonstrates the use of
>>>> .BR pthread_setname_np (),
>>>> as well as
>>>> .BR pthread_getname_np ().
>>>
>>> Please insert a sample run of the program here. See for example the
>>> eventfd(2) page.
>>>
>>>> .SS Program source
>>>
>>> In general, man-pages formats all code as per K&R style. You can use:
>>>
>>> indent -kr prog-name.c
>>>
>>> to make the job easy.
>>>
>>>> \&
>>>> .nf
>>>
>>> #define _GNU_SOURCE
>>>
>>>> #include <pthread.h>
>>>> #include <stdio.h>
>>>> #include <string.h>
>>>> #include <unistd.h>
>>>>
>>>> void *threadfunc(void *parm)
>>>
>>> Add "static" to this function declaration.
>>>
>>>> {
>>>>         printf("In the thread.\n");
>>>>         sleep(20); // allow main program to set the thread name
>>>>         return NULL;
>>>> }
>>>>
>>>> int main(int argc, char **argv)
>>>> {
>>>>         pthread_t thread;
>>>>         int rc=0;
>>>
>>> No need to initialize 'rc'
>>>
>>> #define NAMELEN 16
>>>
>>> and then use NAMELEN (or whatever you think is a decent name) instead
>>> of 16 in the rest of the code.
>>>
>>>>         char theName[16];
>>>>
>>>>         memset(theName, 0, sizeof(theName));
>>>
>>> Why the memset()?
>>>
>>>>         printf("Creating an unnamed thread\n");
>>>
>>> The above text is not quite right. See comments above.
>>>
>>> The "\n" should be "\\n". Try viewing the page to see why.
>>>
>>>>         rc = pthread_create(&thread, NULL, threadfunc, NULL);
>>>>         if(0 == rc)
>>>
>>> Better to please make this
>>>
>>> if (rc == 0)
>>>
>>> and so on in the rest of the code. I know why people do what you've
>>> done above, but it's less readable and gcc is smart enough that we
>>> don't need to do it.
>>>
>>> But there's a more general comment: the logic for handling errors is
>>> overly complicated. See below.
>>>
>>>>         {
>>>>                 rc = pthread_setname_np(thread, "THREADFOO");
>>>>                 if(0 == rc)
>>>
>>> Add space after "if" please
>>>
>>>>                 {
>>>>                         sleep(2);
>>>>                         rc = pthread_getname_np(thread, theName, 16);
>>>>                         if(0 == rc)
>>>>                         {
>>>>                                 printf("The thread name is %s.", theName);
>>>
>>> The '.' should be "\\n"
>>>
>>>>                         }
>>>>                         else
>>>>                         {
>>>>                                 perror("pthread_getname_np");
>>>
>>> On each error after these pthread calls:
>>> * The errno number is NOT in errno, so perror() will not do the right thing.
>>> * Terminate the program, rather than carry on.
>>>
>>> You may find defining a macro like this useful
>>>
>>> #define errExitEN(en, msg) \
>>>                         do { errno = en; perror(msg); \
>>>                              exit(EXIT_FAILURE); } while (0)
>>>
>>> When you employ this, then you can eliminate your deeply nested 'if' statements.
>>>
>>>>                         }
>>>>                 }
>>>>                 else
>>>>                 {
>>>>                         perror("pthread_setname_np");
>>>>                 }
>>>>                 rc = pthread_join(thread, NULL);
>>>>         }
>>>>         if(0 != rc)
>>>>         {
>>>>                 perror("pthread_create");
>>>>         }
>>>>         printf("Done");
>>>
>>> Missing "\\n"
>>>
>>>>         return(rc);
>>>
>>> Better: exit(EXIT_SUCCESS)
>>>
>>>> }
>>>
>>> Please ensure that the code compiles with "cc -Wall"
>>>
>>>> .fi
>>>> .SH SEE ALSO
>>>> .ad l
>>>> .nh
>>>
>>> .BR prctl (2),
>>>
>>>> .BR pthread_getname_np (3),
>>>> .BR pthread_create (3),
>>>> .BR pthreads (7)
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>>
>>> --
>>> Michael Kerrisk
>>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>>> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
