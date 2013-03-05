From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gai.conf.5: tfix
Date: Tue, 5 Mar 2013 17:39:25 +0100
Message-ID: <CAKgNAkg6aJMLsMTGJH-X-cqD6Mr_=cftyf=yfDsmrypcjHx3sg@mail.gmail.com>
References: <CAMqf4EHvYWsQ10pdaW5MZx3CfEanbV7rOgMLAKiUMd8bhpSxNA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EHvYWsQ10pdaW5MZx3CfEanbV7rOgMLAKiUMd8bhpSxNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Denis. Applied.

On Thu, Feb 28, 2013 at 10:53 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> diff --git a/man5/gai.conf.5 b/man5/gai.conf.5
> index d1badac..a749b7c 100644
> --- a/man5/gai.conf.5
> +++ b/man5/gai.conf.5
> @@ -16,7 +16,7 @@
>  .\" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
>  .\"
>  .\" Author: Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -.TH GAI.CONF 5 2013-02-13 ""Linux" "Linux Programmer's Manual"
> +.TH GAI.CONF 5 2013-02-13 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  gai.conf \- getaddrinfo(3) configuration file
>  .SH DESCRIPTION



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
