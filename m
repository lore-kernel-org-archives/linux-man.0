From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] capabilities.7: Add note about nosuid to file
 capabilities section
Date: Sat, 20 Aug 2016 11:43:22 +1200
Message-ID: <71518f5b-5b96-4f96-f393-6e755593db1a@gmail.com>
References: <CAL=YXq=OZh8XFqNULv1_6tH8cyTOHyX=1Jcra1HwHdXByEwsgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL=YXq=OZh8XFqNULv1_6tH8cyTOHyX=1Jcra1HwHdXByEwsgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Saunders <msaund05-DKaQ6Ef2ZpOd6fZ6bFEAhg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Matthew,

On 08/20/2016 08:36 AM, Matthew Saunders wrote:
> Issue: capabilities.7 does not mention nosuid
> Patch applies to version 4.07 or 4.08? (pulled from
> http://git.kernel.org/pub/scm/docs/man-pages/man-pages
> on 2016-08-19, the repo isn't clear if it contains the latest release
> or the in-progress next version.)
> 
> This patch is the result of my investigation/struggle documented at:
> http://stackoverflow.com/questions/38965819/file-capabilities-do-not-transfer-to-process-once-executed
> (and multiple other similar questions across the web which can be
> found by searching for "capabilities nosuid").
> 
> Relevant kernel code snippet at:
> https://github.com/torvalds/linux/blob/a867d7349e94b6409b08629886a819f802377e91/security/commoncap.c#L456
> 
> *****
> diff -u output below:

(Minor nit: "git diff", or "git format-patch" generates a patch that is 
a little easier to work with.)

> 
> --- ../man-pages/man7/capabilities.7 2016-08-19 15:51:40.683061817 -0400
> +++ capabilities.7 2016-08-19 15:54:14.511732428 -0400
> @@ -804,6 +804,13 @@
>  then the effective flag must also be specified as enabled
>  for all other capabilities for which the corresponding permitted or
>  inheritable flags is enabled.
> +.RE
> +
> +Note that file capability sets are ignored if the executable file
> +is stored on a filesystem mounted
> +.RB ( mount (2),
> +.BR mount (8))
> +with the nosuid option.
>  .\"
>  .SS Transformation of capabilities during execve()
>  .PP

Thanks for that patch! The man page should already have said this :-(.
Applied.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
