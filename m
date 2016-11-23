From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [patch] sched/autogroup: Fix 64bit kernel nice adjustment
Date: Wed, 23 Nov 2016 16:55:25 +0100
Message-ID: <1479916525.4306.120.camel@gmx.de>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
         <1479897217.4306.6.camel@gmx.de>
         <d21cf0b2-5c62-5a49-8758-58793c454cc2@gmail.com>
         <1479910341.4306.46.camel@gmx.de>
         <34cea28b-c8c7-31e3-e920-90f113d22abe@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34cea28b-c8c7-31e3-e920-90f113d22abe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2016-11-23 at 15:20 +0100, Michael Kerrisk (man-pages) wrote:

> Thanks for the confirmation. Are you aiming to see the fix 
> merged for 4.9, or will this wait for 4.10?

Dunno, that's up to Peter/Ingo.  It's unlikely that anyone other than
we two will notice a thing either way :) 

	-Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
