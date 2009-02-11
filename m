From: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Subject: Re: For review: timer_create.2
Date: Wed, 11 Feb 2009 09:34:20 +0100
Message-ID: <1234341260.23438.110.camel@twins>
References: <4990DE09.7020801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4990DE09.7020801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 2009-02-10 at 14:53 +1300, Michael Kerrisk wrote:
>        static void
>        handler(int sig, siginfo_t *si, void *uc)
>        {
>            /* Note: calling printf() from a signal handler is not
>               strictly correct, since printf() is not async-signal-safe;
>               see signal(7) */
> 
>            printf("Caught signal %d\n", sig);
>            print_siginfo(si);
>            signal(SIG, SIG_IGN);
>        }

signal(sig, SIG_IGN);

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
