From: "Andi Kleen" <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: SO_NO_CHECK socket option
Date: Mon, 30 Aug 2010 00:26:51 +0200 (CEST)
Message-ID: <43955.91.60.135.224.1283120811.squirrel@www.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
List-Id: linux-man@vger.kernel.org


>
> In the source of the socket.7 man page, there is a comment:
>
> [[
> .\" don't document it because it can do too much harm.
> .\".B SO_NO_CHECK
>
> ]]
>
> One of the coauthors of this page was Andi Kleen, and I suspect he
> wrote the comment. Given that Andi knows far more about the socket
> stack than I, I am reluctant to make any change. But perhaps Andi can
> comment further.

On Linux UDP checksums are essentially free and there's no reason
to turn them off and it would disable another safety line.
That is why I didn't document the option.

-Andi

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
