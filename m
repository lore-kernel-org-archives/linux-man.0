From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: suggestion for improvement to vfork() man page
Date: Wed, 8 Feb 2012 10:06:51 +1300
Message-ID: <CAKgNAkgBfugTWMyaS4Nfvv802G=KB95_hx-cGuP6ckqAtSqyYA@mail.gmail.com>
References: <6.2.5.6.2.20120118214935.03aac8c8@flumedata.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6.2.5.6.2.20120118214935.03aac8c8-8QzAbx0zao2B+jHODAdFcQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Thu, Jan 19, 2012 at 4:04 PM,  <starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org> wrote:
> Hello,
>
> Please consider the following two suggestions for
> adjusting the vfork() man page.
>
> In the "Linux Description" section it should be
> mentioned that vfork() does not suspend all the
> threads in the parent process and only suspends
> the thread issuing the call to vfork(). =A0The
> wording is misleading and I misunderstood the
> semantics for a long time, thinking that all
> threads would be suspended. =A0Had to test it to
> determine the actual effect for certain. =A0In our
> case suspending all threads for even a few
> microseconds is unacceptable.

Good point. For 3.36, I made the following change.

=3D=3D=3D=3D=3D
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -97,7 +97,7 @@ where a child is created which then immediately issue=
s an
 .BR vfork ()
 differs from
 .BR fork (2)
-in that the parent is suspended until the child terminates
+in that the calling thread is suspended until the child terminates
 (either normally,
 by calling
 .BR _exit (2),
=3D=3D=3D=3D=3D

> Also, it is important to note that the
> clone(CLONE_VFORK|CLONE_VM) call invoked by
> vfork() makes a separate copy of all process
> resources except the address space. =A0While this is
> implied by the statement "the vfork() function has
> the same effect as fork(2)," this is easily
> overlooked by someone who works with various UNIXs
> where this is most definitely not the case.

I'm just curious here...  The most pertinent case I can think of here
is file descriptors, which *are* duplicated on all vfork()
implementations that I've come across. When you say "UNIXs where this
is most definitely not the case", what (process attributes) are you
thinking of.

> This matters for situations like ours where a
> process with a huge address space, real-time
> priority and root privileges must occasionally
> spawn scripts that should run at user priority
> with user privileges. =A0Using fork() is expensive
> due to the cost of replicating very large page
> tables and vfork() is an excellent alternative.
> But the subtle difference between Solaris/AIX and
> Linux caused us to unnecessarily disable the code
> that lowers priority and surrenders root
> permission before issuing the exec() call to run
> scripts.

Yes, a few words on those lines does not hurt. I made the following cha=
nge:

=3D=3D=3D=3D=3D
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -110,9 +110,19 @@ The child must not return from the current functio=
n or call
 .BR exit (3),
 but may call
 .BR _exit (2).
-.PP
-Signal handlers are inherited, but not shared.
-Signals to the parent
+
+As with
+.BR fork (2),
+the child process created by
+.BR vfork ()
+inherits copies of various of the caller's process attributes
+(e.g., file descriptors, signal dispositions, and current working dire=
ctory);
+the
+.BR vfork ()
+call differs only in the treatment of the virtual address space,
+as described above.
+
+Signals sent to the parent
 arrive after the child releases the parent's memory
 (i.e., after the child terminates
 or calls
=3D=3D=3D=3D=3D

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
