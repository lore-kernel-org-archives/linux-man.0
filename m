From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature
Date: Mon, 28 Nov 2016 02:46:14 +0100
Message-ID: <1480297574.9163.76.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479901185.4306.38.camel@gmx.de>
         <327586fa-4672-d070-0ded-850654586273@gmail.com>
         <1479915229.4306.106.camel@gmx.de>
         <8614679c-b1d3-3b35-193d-2ab6eac45aff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8614679c-b1d3-3b35-193d-2ab6eac45aff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, 2016-11-27 at 22:13 +0100, Michael Kerrisk (man-pages) wrote:

> Here's my attempt to define the root task group:
> 
>        *  If autogrouping is disabled, then all processes in the root CPU
>           cgroup form a scheduling group (sometimes called the "root task
>           group").
> 
> Can you improve on this?

A task group is a set of percpu runqueues.  The root task group is the
top level set in a hierarchy of such sets when group scheduling is
enabled, or the only set when group scheduling is not enabled.  The
autogroup hierarchy has a depth of one, ie all autogroups are peers
who's common parent is the root task group.

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
