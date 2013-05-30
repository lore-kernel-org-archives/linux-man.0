From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [bug] Error in mprotect man page description of return value
Date: Thu, 30 May 2013 12:58:56 +0200
Message-ID: <51A730F0.3050508@gmail.com>
References: <CAMJx9yDV3ez0UzqsNn_ub9tOGGVJsN11LkDz_r_VQqC0NW3CGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMJx9yDV3ez0UzqsNn_ub9tOGGVJsN11LkDz_r_VQqC0NW3CGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kennon Bittick <kennonlbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/29/13 00:30, Kennon Bittick wrote:
> Hello,
> 
> I would like to report what I believe is an error in the man page of
> mprotect. The description of the return value says:
> 
> "Upon successful completion, mprotect() shall return 0; otherwise, it
> shall return -1 and set errno to indicate the error."
> 
> However, in my use the behavior does not match this. I reviewed the
> source code, and it appeared to match my experience rather than the
> man pages' description. Instead, the function returns (error_code *
> -1) and does not change errno.
> 
> I am new to bug reporting, so I apologize if I have made a mistake in
> the format or content of the report. Thank you.

Kennon,

How are you calling mprotect()? The wrapper function does the 
manipulation of errno. See syscalls(2).

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
