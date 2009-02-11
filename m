From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: For review: timer_create.2
Date: Wed, 11 Feb 2009 21:42:57 +1300
Message-ID: <cfd18e0f0902110042yd3c9bbbo6d539f364b9aeff5@mail.gmail.com>
References: <4990DE09.7020801@gmail.com> <1234341260.23438.110.camel@twins>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1234341260.23438.110.camel@twins>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Feb 11, 2009 at 9:34 PM, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org> wrote:
> On Tue, 2009-02-10 at 14:53 +1300, Michael Kerrisk wrote:
>>        static void
>>        handler(int sig, siginfo_t *si, void *uc)
>>        {
>>            /* Note: calling printf() from a signal handler is not
>>               strictly correct, since printf() is not async-signal-safe;
>>               see signal(7) */
>>
>>            printf("Caught signal %d\n", sig);
>>            print_siginfo(si);
>>            signal(SIG, SIG_IGN);
>>        }
>
> signal(sig, SIG_IGN);

Good point.  The ode works because SIG and sig have the same value at
this point, but of course the line shold be as you suggest.  Fixed
now.Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
