From: Chandan Apsangi <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Bug#28702: pthread_setname_np(3) missing man page
Date: Thu, 25 Oct 2012 13:54:41 -0400
Message-ID: <CAMNJgjLgNe61yEuQzah3s2znd3nLyB_k71OpU=ntx+oq30RfHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I have been working on the man pages (version 3.43) for the following APIs:

pthread_setname_np
pthread_getname_np

Currently I'm sending the man page document for pthread_setname_np().
Will submit pthread_getname_np() as soon as I get some review comments
for this one.

I looked at the following sources on the Internet, plus the
glibc-2.16.0 source code, to gather information about these APIs.

http://publib.boulder.ibm.com/infocenter/iseries/v7r1m0/index.jsp?topic=%2Fapis%2Fpthread_setname_np.htm
http://h30097.www3.hp.com/docs/base_doc/DOCUMENTATION/V51B_HTML/MAN/MAN3/2477____.HTM
http://www.qnx.com/developers/docs/6.3.2/neutrino/lib_ref/p/pthread_setname_np.html
http://sourceware.org/ml/libc-help/2010-03/msg00018.html
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=4614a696bd1c3a9af3a08f0e5874830a85b889d4

Following is the source of the man page. Please review the same, and
let me know your comments.




.\" Copyright (c) 2008 Linux Foundation, written by Chandan Apsangi
.\"     <chandan.jc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\"
.TH PTHREAD_SETNAME_NP 3 2012-10-24 "Linux" "Linux Programmer's Manual"
.SH NAME
pthread_setname_np \- Name a thread
.SH SYNOPSIS
.nf
.B #include <pthread.h>

.BI "int pthread_setname_np(pthread_t *" thread ", const char *" name ");
.fi
.sp
Compile and link with \fI\-pthread\fP.
.SH DESCRIPTION
By default, all the threads created using
.BR pthread_create (3)
are unnamed. Using this API, users can specify a unique name for a
thread, which can be particularly useful for debugging complicated
multi-threaded applications. The thread name is a meaningful C
language string, whose length is restricted to 16 characters. Anything
greater than this would lead to an error.
.SH RETURN VALUE
On success,
.BR pthread_setname_np ()
returns 0;
on error, it returns an error number.
.SH ERRORS
.\" FIXME . Find out and add other errors
.TP
.B ERANGE
The length of the string specified as second argument exceeds the allowed limit.
.TP
.B EIO
The name could not be written to the thread specific file due to some I/O error.

.SH CONFORMING TO
POSIX.1-2001.
.SH NOTES
This API internally writes to the thread specific comm file under
.IR /proc
filesystem:
.IR /proc/self/task/<tid>/comm.
.SH BUGS
NO BUGS YET.
.SH EXAMPLE
The program below demonstrates the use of
.BR pthread_setname_np (),
as well as
.BR pthread_getname_np ().

.SS Program source
\&
.nf
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

void *threadfunc(void *parm)
{
	printf("In the thread.\n");
	sleep(20); // allow main program to set the thread name
	return NULL;
}

int main(int argc, char **argv)
{
	pthread_t thread;
	int rc=0;
	char theName[16];

	memset(theName, 0, sizeof(theName));
	printf("Creating an unnamed thread\n");
	rc = pthread_create(&thread, NULL, threadfunc, NULL);
	if(0 == rc)
	{
		rc = pthread_setname_np(thread, "THREADFOO");
		if(0 == rc)
		{
			sleep(2);
			rc = pthread_getname_np(thread, theName, 16);
			if(0 == rc)
			{
				printf("The thread name is %s.", theName);
			}
			else
			{
				perror("pthread_getname_np");
			}
		}
		else
		{
			perror("pthread_setname_np");
		}
		rc = pthread_join(thread, NULL);
	}
	if(0 != rc)
	{
		perror("pthread_create");
	}
	printf("Done");
	return(rc);
}
.fi
.SH SEE ALSO
.ad l
.nh
.BR pthread_getname_np (3),
.BR pthread_create (3),
.BR pthreads (7)



Thanks,
Chandan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
