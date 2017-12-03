From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH RFC] stat.2: Document that stat can fail with EINTR
Date: Sun, 03 Dec 2017 17:09:03 +0100
Message-ID: <5A24219F.4010802@bfs.de>
References: <20171203002359.GA17037@juliacomputing.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171203002359.GA17037-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 03.12.2017 01:23, schrieb Keno Fischer:
> Particularly on network file systems, a stat call may require
> submitting a message over the network and waiting interruptably
> for a reply.
> 
> Signed-off-by: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
> ---
> 
> The catalyst for this patch was me experiencing EINTR errors when
> using the 9p file system. In linux commit 9523feac, the 9p file
> system was changed to use wait_event_killable instead of
> wait_event_interruptible, which does indeed address my problem,
> but also makes me a bit unhappy, because uninterruptable waits
> prevents things like ^C'ing the execution and some debugging
> tools which depend on being able to cancel long-running operations
> by sending signals. I'd like to ask the user space applications I
> care about to properly handle such situations (either by using
> SA_RESTART or by explicitly handling EINTR), but it's a bit of a
> hard sell if EINTR isn't documented to be a possibility. I'm hoping
> this doc PATCH will generate a discussion of whether EINTR is an
> appropriate thing for stat (as a stand in for a file system call that's
> not read/write) to return. If so, I'd be happy to submit
> patches to other file system-related syscalls along these same lines.
> 
> I realize I'm probably 20 years too late here, but it feels like
> clarificaion on what to expect from the kernel would still go a long
> way here.  
> 

no matter, if it can happen it should be document.
Nothing is more anoying that triggering an undocumented error.


>  man2/stat.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/stat.2 b/man2/stat.2
> index dad9a01..f10235a 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -452,6 +452,11 @@ Invalid flag specified in
>  is relative and
>  .I dirfd
>  is a file descriptor referring to a file other than a directory.
> +.TP
> +.B EINTR
> +The call was interrupted by delivery of a signal caught by a handler; see
What is about:
  The call was interrupted by a
.BR signal (7).
> +.BR signal (7).
> +The possibility of this error is file-system dependent.
You mean:
  This error is file-system dependent.

just my 2 cents,
re,
 wh

>  .SH VERSIONS
>  .BR fstatat ()
>  was added to Linux in kernel 2.6.16;
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
