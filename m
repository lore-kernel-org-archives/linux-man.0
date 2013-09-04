From: Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Wed, 4 Sep 2013 16:01:27 +0000
Message-ID: <00000140e9b4ede6-8b9dfd6f-7ca2-4d35-9454-389f6453031a-000000@email.amazonses.com>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar> <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar> <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com> <20130904133217.GC12620@sdfg.com.ar>
 <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 4 Sep 2013, Michael Kerrisk (man-pages) wrote:

> > I don't know. But looking at the git repo, it seems in the first git commit
> > (1da177e4c3f41524e886b7f1b8a0c1fc7321cac2) it was already safe,

What do you mean by "safe"? Note that the manpage was written mainly based
on my experience on IA64 with ITC registers. There were numerous bugs in
2004/2005 due to glibc / kernel / firmware issues.

> So, some history: CLOCK_THREAD_CPUTIME_ID and CLOCK_PROCESS_CPUTIME_ID
> first appeared in 2.6.12, as far as I know.

Those were earlier supported by glibc before kernel support was added. At
some point they were used in some weird scheme to retrieve TSC/ITC
register contents.

> point, but it's unclear to me when that point could have been, since
> the timelines don't seem to match up (unless, of course, your
> suppositions are wrong, Rodrigo, but I'm not assuming that at this
> point).

Only have a vague recollection of these things at this point and I have
no longer access to my email from that time period since I am no longer
with SGI.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
