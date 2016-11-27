From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature
Date: Sun, 27 Nov 2016 22:13:26 +0100
Message-ID: <8614679c-b1d3-3b35-193d-2ab6eac45aff@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479915229.4306.106.camel-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 11/23/2016 04:33 PM, Mike Galbraith wrote:
> On Wed, 2016-11-23 at 14:54 +0100, Michael Kerrisk (man-pages) wrote:
>> Hi Mike,

[...]

>> Actually, can you define for me what the root task group is, and 
>> why it exists? That may be worth some words in this man page.
> 
> I don't think we need group scheduling details, there's plenty of
> documentation elsewhere for those who want theory.  Autogroup is for
> those who don't want to have to care (which is also why it should have
> never grown nice knob).

Actually, the more I think about this, the more I think we *do*
need a few details on group scheduling. Otherwise, it's difficult
to explain to the use why nice(1) no longer works as traditionally
expected.

Here's my attempt to define the root task group:

       *  If autogrouping is disabled, then all processes in the root CPU
          cgroup form a scheduling group (sometimes called the "root task
          group").

Can you improve on this?

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
