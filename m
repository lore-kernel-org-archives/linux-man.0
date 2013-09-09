From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Mon, 9 Sep 2013 13:07:33 +0200
Message-ID: <20130909110733.GN31370@twins.programming.kicks-ass.net>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
 <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar>
 <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 04, 2013 at 02:32:49PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Rodrigo,
> 
> On Tue, Sep 3, 2013 at 12:05 PM, Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org> wrote:
> > As confirmed by peterz on IRC, this note is obsolete:
> >
> >         <peterz> rata: that section is obsolete; CLOCK_THREAD_CPUTIME_ID is good
> >         <peterz> rata: CLOCK_PROCESS_CPUTIME_ID is also correct
> >
> > So this patch just removes it.
> 
> Clearly, the page needs amending. However, ideal would be to describe
> *when* the section became obsolete (which kernel version). Do you or
> Peter know, or have an idea how we can determine that information?

I was out on holidays but it seems you guys sorted the issue -- glibc
userspace handling of the clocks.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
