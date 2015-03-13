From: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] rint.3: Document that halfway cases are rounded to even.
Date: Thu, 12 Mar 2015 18:06:03 -0700
Message-ID: <CAEdQ38EGO7wONjO-3qBNm_aWMX+1WOj0xGrRvE81hTpG-xE79w@mail.gmail.com>
References: <1426207416-7539-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426207416-7539-1-git-send-email-mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Mar 12, 2015 at 5:43 PM, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Per IEEE-754 rounding rules.
>
> The round(3) page describes the behavior of rint and nearbyint in the
> halfway cases by saying:
>
>    These functions round x to the nearest integer, but round halfway
>    cases away from zero [...], instead of to the nearest even integer
>    like rint(3)
>
> Signed-off-by: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Sorry, this is not precise -- these functions round halfway cases to
nearest even when the rounding mode is set to round-to-nearest. I'll
send a revised patch.

And for what it's worth, as far as I can tell this rounding behavior
(halfway cases round to nearest even) is defined by IEEE-754 and not
the C language spec. I don't know if that's worth mentioning.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
