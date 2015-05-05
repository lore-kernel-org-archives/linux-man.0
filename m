From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97051] get_mempolicy(2) inconsistent with numaif.h
Date: Tue, 05 May 2015 09:19:10 +0000
Message-ID: <bug-97051-11311-tf7awIdcVv@https.bugzilla.kernel.org/>
References: <bug-97051-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-97051-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=97051

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Andi, could you comment on this bug?

Thanks,

Michael

On 22 April 2015 at 00:28,  <bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=97051
>
>             Bug ID: 97051
>            Summary: get_mempolicy(2) inconsistent with numaif.h
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: man-pages
>           Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
>           Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
>         Regression: No
>
> get_mempolicy(2)'s synopsis is:
>
>        #include <numaif.h>
>
>        int get_mempolicy(int *mode, unsigned long *nodemask,
>                          unsigned long maxnode, unsigned long addr,
>                          unsigned long flags);
>
> However, the actual prototype in numif.h (and implementation in numactl's
> syscall.c) is subtly different:
>
>        long get_mempolicy(int *policy, const unsigned long *nmask,
>                         unsigned long maxnode, void *addr, int flags);
>
> The funny thing is, that prototype is isn't quite right either - it pretends
> nmask is a const pointer, but it most definitely isn't, and the data pointed by
> it get written to. But that isn't a man-page bug.
>
> --
> You are receiving this mail because:
> You are watching the assignee of the bug.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
