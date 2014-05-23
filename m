From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 76101] New: [TRIVIAL] PTHREAD_CREATE(3): EAGAIN and pid_max
Date: Fri, 23 May 2014 06:07:06 +0200
Message-ID: <537EC96A.8050302@gmail.com>
References: <bug-76101-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-76101-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/13/2014 07:22 PM, bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=76101
> 
>             Bug ID: 76101
>            Summary: [TRIVIAL] PTHREAD_CREATE(3): EAGAIN and pid_max
>            Product: Documentation
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: man-pages
>           Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
>           Reporter: carstengrohmann-Mmb7MZpHnFY@public.gmane.org
>         Regression: No
> 
> Hi,
> 
> The system-wide limit on the number of threads can also reached by a small
> value in /proc/sys/kernel/pid_max. E.g. RHEL5 and RHEL6 systems uses a default
> of 32768 in pid_max probably for compatibility with 32bit applications.
> 
> This causes an EAGAIN also if the number of threads is significant lower than
> thread-max or RLIMIT_NPROC.
> 
> Please extent the EAGAIN statement to reflect pid_max too.

Hello Carsten.

Thanks for the report. I've added pid_max to the list 
of causes for EAGAIN in pthread_create(3). (And I've made
the fork(2) text match that in pthread_create(3) as well.).

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
