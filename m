From: Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org>
Subject: Re: [patch] document CLOCK_MONOTONIC_COARSE
Date: Mon, 4 Jun 2012 11:02:58 -0700
Message-ID: <CAE_FxDi3ecT8vJnJdeh_T1_2TaTdAWBn=iSb_Z_-EVMW9+6Wxw@mail.gmail.com>
References: <20120531235955.GA18876@cloudera.com>
	<CAP737o+rUezC4tiCra-qTiVL2XxbKJ7Z+9oeHrw6hCEkEX8Cyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP737o+rUezC4tiCra-qTiVL2XxbKJ7Z+9oeHrw6hCEkEX8Cyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 2, 2012 at 2:49 AM, Alexandre Bique
<bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jun 1, 2012 at 1:59 AM, Andy Isaacson <adi-psgPW5cihnJWk0Htik3J/w@public.gmane.org> wrote:
> > +.BR CLOCK_MONOTONIC_COARSE " (since Linux 2.6.32; Linux-specific)"
> > +.\" Added in commit da15cfdae03351c689736f8d142618592e3cebc3, John Stultz, Aug 19 2009
>
> Is it necessary to specify the commit rev?

Speaking as a git user, it's much more helpful to provide the commitID
than to just provide committer+date as was done for other items in
this file.  It allows "git tag --contains da15cfdae" to find out what
release it was merged in, for example.

Is there any downside to having the commit hash in the comment?

-andy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
