From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76851] inotify_rm_watch(2) unspecified behavior
Date: Fri, 30 May 2014 12:34:02 +0000
Message-ID: <bug-76851-11311-YaMil2zFcL@https.bugzilla.kernel.org/>
References: <bug-76851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-76851-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=76851

--- Comment #9 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Heinrich Schuchardt from comment #5)
> Created attachment 137681 [details]
> test_wd_reuse.c - Test watch descriptor reuse
> 
> The test program demonstrates that inotify_add_watch may return a watch
> descriptor ID for which events still exist on the inotify queue.
> 
> It creates one watch for file "0" to demonstrate the problem.
> Afterwards it creates and removes watches again and again just to force
> idr_alloc_cyclic to reach INT_MAX.
> Then events are created for file "0" on the queue.
> The watch for "0" is removed.
> A watch for another file is created.
> 
> Example program output (after a few hours, on Linux 3.14.4 x86_64):
> 
> ...
> 2147459044      2147467235      2147475426      2147483617      2147483647  
> 
> Preparation done
> BINGO Collision detected
> Watch descriptor 1 for /tmp/test/8192
> Watch descriptor 1 for /tmp/test/0

Nice work Heinrich! I pretty much suspected this would be the case, even before
looking at the kernel code, and it's nice to see a demonstration[1] of the
problem. (I had in mind to code something similar myself, just to be sure, but
you beat me to it.)

Anyway, this recycling behavior, coupled with "events remain pending after
inotify_rm_watch()" behavior that Jeff reports mean that yes indeed we can
events on a recycled watch descriptor that do indeed belong to a previous
incarnation of that WD. On the other hand, you have to work pretty hard to do
this: you have to fail to read your queued events while at the same time
cycling through INT_MAX watch descriptors. I suppose no application is going to
run into that scenario in a hurry.

Cheers,

Michael

[1] No need to wait for hours when you test, Just rebuild a kernel with the
following edit in fs/notify/inotify/inotify_user.c::inotify_add_to_idr()

-        ret = idr_alloc_cyclic(idr, i_mark, 1, 0, GFP_NOWAIT);
-        ret = idr_alloc_cyclic(idr, i_mark, 1, 500000, GFP_NOWAIT);

That's sufficient as a proof of concept of the problem.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
