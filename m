From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getunwind.2: tfix
Date: Tue, 5 Mar 2013 17:39:16 +0100
Message-ID: <CAKgNAkh4kQg3kDr-Ur=88+TMUKXYNkkQuE4i+cz3ZKzsSFEB=g@mail.gmail.com>
References: <CAMqf4EE8HnkQgGw_jgVqfJW_ZS_y_s=G+9vh_a6zOu8+BL+d2A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EE8HnkQgGw_jgVqfJW_ZS_y_s=G+9vh_a6zOu8+BL+d2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Denis. Applied.

On Thu, Feb 28, 2013 at 10:43 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> diff --git a/man2/getunwind.2 b/man2/getunwind.2
> index 13ed6e3..ba113af 100644
> --- a/man2/getunwind.2
> +++ b/man2/getunwind.2
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\"
>  .\"
> -.TH GETUNWIND 2 2013-02-13" Linux "Linux Programmer's Manual"
> +.TH GETUNWIND 2 2013-02-13 Linux "Linux Programmer's Manual"
>  .SH NAME
>  getunwind \- copy the unwind data to caller's buffer
>  .SH SYNOPSIS



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
