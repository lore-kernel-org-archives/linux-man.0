From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Wed, 4 Sep 2013 16:11:23 +0100
Message-ID: <20130904151123.GA14462@sdfg.com.ar>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
 <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar>
 <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
 <20130904133217.GC12620@sdfg.com.ar>
 <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 04, 2013 at 05:01:26PM +0200, Michael Kerrisk (man-pages) wrote:
> >>
> >> Clearly, the page needs amending. However, ideal would be to describe
> >> *when* the section became obsolete (which kernel version). Do you or
> >> Peter know, or have an idea how we can determine that information?
> >
> > I don't know. But looking at the git repo, it seems in the first git commit
> > (1da177e4c3f41524e886b7f1b8a0c1fc7321cac2) it was already safe,
> 
> So, some history: CLOCK_THREAD_CPUTIME_ID and CLOCK_PROCESS_CPUTIME_ID
> first appeared in 2.6.12, as far as I know.
> 
> Your suggesting that these clocks were safe in 2.6.12-rc2 (April
> 2005). At this point, I'm confused. AFAICT, Christoph wrote his text

Ohh, I didn't know that. Now I'm confused too :S

> in mid-2004, quite some time before 2.61.12 was released with the
> initial CLOCK_THREAD_CPUTIME_ID and CLOCK_PROCESS_CPUTIME_ID
> implementations. The thing is, Christoph, is usually pretty sharp, so
> I assume that he was talking about something that was true at some
> point, but it's unclear to me when that point could have been, since
> the timelines don't seem to match up (unless, of course, your
> suppositions are wrong, Rodrigo, but I'm not assuming that at this
> point).

Hmmm, but chances are that I'm wrong I think... =)


> 
> Let's see is Christoph or Peter has something to say.

Let's see :)






Thanks a lot,
Rodrigo
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
