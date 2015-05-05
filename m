From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 59281] unshare(2) applies to threads, not processes
Date: Tue, 05 May 2015 08:45:24 +0000
Message-ID: <bug-59281-11311-Sn8BKjdVUB@https.bugzilla.kernel.org/>
References: <bug-59281-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-59281-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=59281

--- Comment #3 from walter <wharms-fPG8STNUNVg@public.gmane.org> ---
Am 05.05.2015 09:36, schrieb bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org:
> https://bugzilla.kernel.org/show_bug.cgi?id=59281
> 
> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>              Status|NEW                         |RESOLVED
>                  CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>          Resolution|---                         |CODE_FIX
> 
> --- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> (In reply to Florian Weimer from comment #0)
>> My version starts with "unshare() allows a process to disassociate parts of
>> its execution context", but I've been told that this incorrect because it
>> applies to the calling thread only, not the entire process.
> 
> Florian, while I understand the motivation of this bug report, there's no
> really good fix. As Stuart notes, the line between thread and process in this
> context is fuzzy. Really, the reader needs to have a grasp on what clone(2)
> does.
> 
> Anyway, to improve things a little, I applied the patch below.
> 
> Cheers,
> 
> Michael
> 
> --- a/man2/unshare.2
> +++ b/man2/unshare.2
> @@ -49,15 +49,15 @@ _BSD_SOURCE || _SVID_SOURCE
>  .ad b
>  .SH DESCRIPTION
>  .BR unshare ()
> -allows a process to disassociate parts of its execution
> -context that are currently being shared with other processes.
> +allows a process (or thread) to disassociate parts of its execution
> +context that are currently being shared with other processesi or theads).
                              ^^^^^^^
did you notice ?

re,
 wh

>  Part of the execution context, such as the mount namespace, is shared
>  implicitly when a new process is created using
>  .BR fork (2)
>  or
>  .BR vfork (2),
>  while other parts, such as virtual memory, may be
> -shared by explicit request when creating a process using
> +shared by explicit request when creating a process or thread using
>  .BR clone (2).
> 
>  The main use of
>

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
