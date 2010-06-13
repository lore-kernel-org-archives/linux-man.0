From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Sun, 13 Jun 2010 12:33:43 +0200
Message-ID: <20100613103343.GE31464@basil.fritz.box>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org> <AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com> <20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jun 11, 2010 at 04:46:28PM +0200, Michael Kerrisk wrote:
> +Signal                    siginfo_t fields
> +SIGKILL                   si_pid, si_uid
> +SIGCHLD                   si_pid, si_uid, si_status, si_utime, si_stime
> +SIGILL                    si_code, si_addr, si_trapno
> +SIGFPE                    si_code, si_addr, si_trapno
> +SIGSEGV                   si_code, si_addr, si_trapno
> +SIGBUS                    si_code, si_addr, si_trapno, si_addr_lsb
> +SIGTRAP                   si_code, si_addr, si_trapno
> +SIGPOLL                   si_band, si_fd
> +realtime signals > 32     si_pid, si_uid, si_value
> +posix timer               si_tid, si_overrun, si_sigval
> 
> * It duplicates info that can be found in sigaction(2).

The latest version is better, but I'm pretty sure it wasn't
like that when I submitted the pages.

> 
> * It's incomplete. If you compare against the corresponding
> information in sigaction(2) [better pull the latest page from git for
> this comparison], there is more information about which fields are set
> by the various signals. Also, various siginfo_t fields (si_signo) are
> missing from your table.

Ok it could be listed.

> 
> * It's misleading. For example, it implies that some signals set
> si_code while others don't. But, AFAIK, all signals set this field.

The point was for which signals these fields contain useful
information.

Maybe that could be clarified in a introductionary sentence though.

> Likewise, it suggests that there is useful info in si_trapno, but
> usually there is not. The entry for SIGKILL also seems strange.

There is useful information in trapno for the signals where 
I listed it.

Why is SIGKILL strange?

> 
> It would help if you could explain what the problem was that you were
> trying to solve with this patch, and explain why sigaction(2) doesn't
> solve the problem.

My problem was that i had to look this up in the source code because
I couldn't find it in the manpages.

And there was no clear place to put the fields for my hwpoison extensions.

Also even if there's a bit redundancy I don't understand why
that is a problem? imho the goal should be for individual 
pages be useful without having to cross reference all the time.

-Andi
-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
