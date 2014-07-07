From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch[ epoll_ctl.2, epoll.7: document EPOLLWAKEUP
Date: Mon, 07 Jul 2014 08:46:28 +0200
Message-ID: <53BA4244.30502@gmail.com>
References: <20140706190351.423e9a93@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140706190351.423e9a93-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Neil,

On 07/06/2014 11:03 AM, NeilBrown wrote:
> 
> 
> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
> --
> 
> I noticed that this was missing so had a go at writing something.

Thanks. I applied this, and also added the additional piece shown 
at the end of this mail.

> Is there / Should there be a section 7 man page describing suspend and
> autosuspend and wakelocks etc??

Sounds like it might be useful, but I don't know for sure. On the 
assumption that it might be possible to convince you to write one,
could you briefly list what you think should be covered in the page?

> Comments (of course) welcome.
> 
> NeilBrown
> 
> 
> diff --git a/man2/epoll_ctl.2 b/man2/epoll_ctl.2
> index 1fbe74eeea4e..6388f19195f1 100644
> --- a/man2/epoll_ctl.2
> +++ b/man2/epoll_ctl.2
> @@ -154,6 +154,26 @@ The user must call
>  with
>  .B EPOLL_CTL_MOD
>  to rearm the file descriptor with a new event mask.
> +.TP
> +.BR EPOLLWAKEUP " (since Linux 3.5)"
> +If
> +.B EPOLLONESHOT
> +and
> +.B EPOLLET
> +are clear and the process has the
> +.B CAP_BLOCK_SUSPEND
> +.BR capability (7),
> +ensure that the system does not enter "suspend" or
> +"hibernate" while this event is pending or being processed.
> +The event is considered as being "processed" from when it returned by
> +a call to
> +.BR epoll_wait (2)
> +until the next call to
> +.BR epoll_wait (2)
> +on the same
> +.BR epoll (7)
> +file descriptor.
> +.\" commit 4d7e30d98939a0340022ccd49325a3d70f7e0238
>  .SH RETURN VALUE
>  When successful,
>  .BR epoll_ctl ()
> diff --git a/man7/epoll.7 b/man7/epoll.7
> index a372d9727978..31b1a8c8c9ba 100644
> --- a/man7/epoll.7
> +++ b/man7/epoll.7
> @@ -173,6 +173,35 @@ it is the caller's responsibility to rearm the file
> descriptor using .BR epoll_ctl (2)
>  with
>  .BR EPOLL_CTL_MOD .
> +.SS Interaction with autosleep
> +If the system is in
> +.B autosleep
> +mode via
> +.I /sys/power/autosleep
> +and an event happens which wakes the device from sleep, the device
> +driver will only keep the device awake until that event is queued.  To
> +keep the device awake until the event has been processed it is
> +necessary to use
> +.B epoll
> +and the
> +.B EPOLLWAKEUP
> +flag.
> +
> +When this flag is set in the
> +.B events
> +field for a
> +.I struct epoll_event
> +then system will be kept awake from the moment the event is queued,
> +through the
> +.IR epoll_wait (2)
> +call which returns the event until the subsequent
> +.IR epoll_wait (2)
> +call.  If the event should keep the system awake beyond that time,
> +the a separate
> +.I wake_lock
> +should be taken before the second
> +.IR epoll_wait (2)
> +call.
>  .SS /proc interfaces
>  The following interfaces can be used to limit the amount of
>  kernel memory consumed by epoll:

All of the above looks good. I also added the piece sad little 
detail shown below.

Cheers,

Michael

--- a/man2/epoll_ctl.2
+++ b/man2/epoll_ctl.2
@@ -174,6 +174,7 @@ until the next call to
 on the same
 .BR epoll (7)
 file descriptor.
+See also BUGS.
 .SH RETURN VALUE
 When successful,
 .BR epoll_ctl ()
@@ -270,6 +271,33 @@ when using
 Applications that need to be portable to kernels before 2.6.9
 should specify a non-null pointer in
 .IR event .
+
+If
+.B EPOLLWAKEUP
+is specified in
+.IR flags ,
+but the caller does not have the
+.BR CAP_BLOCK_SUSPEND
+capability, then the
+.B EPOLLWAKEUP
+flag is
+.IR "silently ignored" .
+This unfortunate behavior is necessary because no validity
+checks were performed on the
+.IR flags
+argument in the original implementation, and the addition of the
+.B EPOLLWAKEUP
+with a check that caused the call to fail if the caller did not have the
+.B CAP_BLOCK_SUSPEND
+capability caused a breakage in at least one existing user-space
+application that happened to randomly (and uselessly) specify this bit.
+.\" commit a8159414d7e3af7233e7a5a82d1c5d85379bd75c (behavior change)
+.\" https://lwn.net/Articles/520198/
+A robust application should therefore double check that it has the
+.B CAP_BLOCK_SUSPEND
+capability if attempting to use the
+.B EPOLLWAKEUP
+flag.
 .SH SEE ALSO
 .BR epoll_create (2),
 .BR epoll_wait (2),




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
