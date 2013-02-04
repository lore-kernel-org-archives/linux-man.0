From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: ffix
Date: Mon, 4 Feb 2013 22:26:51 +0100
Message-ID: <CAKgNAkjwYgM0WCs70vhXHYK0zmw2YdDgV3CG+uAQ-SuGsHwNxA@mail.gmail.com>
References: <CAMqf4EEhOoOOd+G++xpB1h-eALmtOEmfrO_gWZQCwA-h3Ms-zQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EEhOoOOd+G++xpB1h-eALmtOEmfrO_gWZQCwA-h3Ms-zQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks. Applied!

On Mon, Feb 4, 2013 at 10:06 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ---
>  man2/prctl.2 |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 36fdc14..f139c5f 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -833,7 +833,6 @@ is not 0,
>  .BR PR_SET_PTRACER_ANY ,
>  or the PID of an existing process.
>  .TP
> -TP
>  .B EPERM
>  .I option
>  is



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
