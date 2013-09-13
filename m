From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: Bug 60749 - Do not need to link against -lm for fabs*()
Date: Fri, 13 Sep 2013 20:20:54 +0200
Message-ID: <CAKgNAkiy54SbGEt6KQ2a87SQejoyuzcTvDbVK8aAQXd==yNNvg@mail.gmail.com>
References: <5233415A.90506@bfs.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5233415A.90506-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Walter,

On Fri, Sep 13, 2013 at 6:46 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
> hi list,
> i was investigating this and the good news it that you still need a libm.
> On the other side the reporter is right he does not need to specify that.
> Obviously this depends on the linker script used.
>
> The math man pages say: "Link with -lm".
> Perhaps it is better to say 'You may need to Link with -lm".
>
> any comments on that ?


Thanks for looking at this bug. Could you elaborate a little more on
what it/sin't in the linker script that makes the difference?

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
