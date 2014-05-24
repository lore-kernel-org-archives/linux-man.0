From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 76101] [TRIVIAL] PTHREAD_CREATE(3): EAGAIN and pid_max
Date: Sat, 24 May 2014 12:24:08 +0000
Message-ID: <bug-76101-11311-50oLcxHpbY@https.bugzilla.kernel.org/>
References: <bug-76101-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-76101-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=76101

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
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
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
