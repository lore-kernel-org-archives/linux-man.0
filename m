From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Fri, 11 Jun 2010 16:46:28 +0200
Message-ID: <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org>
	<AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com>
	<20100611083134.GF6864@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100611083134.GF6864-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andi,

On Fri, Jun 11, 2010 at 10:31 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> The information in this patch is rather incomplete, and is in any case
>> covered more completely in sigaction(2), so I haven't applied this
>
> And impossible to find there.

I didn't think so, but see below.

>> patch. On the other hand, it triggered me to make some improvements to
>> sigaction(2), as shown below.
>
> I still think the table is useful, I added it originally when I couldn't
> find this information easily.

These were the problems I had with the patch:

+Signal                    siginfo_t fields
+SIGKILL                   si_pid, si_uid
+SIGCHLD                   si_pid, si_uid, si_status, si_utime, si_stime
+SIGILL                    si_code, si_addr, si_trapno
+SIGFPE                    si_code, si_addr, si_trapno
+SIGSEGV                   si_code, si_addr, si_trapno
+SIGBUS                    si_code, si_addr, si_trapno, si_addr_lsb
+SIGTRAP                   si_code, si_addr, si_trapno
+SIGPOLL                   si_band, si_fd
+realtime signals > 32     si_pid, si_uid, si_value
+posix timer               si_tid, si_overrun, si_sigval

* It duplicates info that can be found in sigaction(2).

* It's incomplete. If you compare against the corresponding
information in sigaction(2) [better pull the latest page from git for
this comparison], there is more information about which fields are set
by the various signals. Also, various siginfo_t fields (si_signo) are
missing from your table.

* It's misleading. For example, it implies that some signals set
si_code while others don't. But, AFAIK, all signals set this field.
Likewise, it suggests that there is useful info in si_trapno, but
usually there is not. The entry for SIGKILL also seems strange.

It would help if you could explain what the problem was that you were
trying to solve with this patch, and explain why sigaction(2) doesn't
solve the problem.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
