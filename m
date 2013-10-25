From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] futex.2: Fix link to Rusty's futex example library
Date: Sat, 26 Oct 2013 10:54:38 +1300
Message-ID: <526AE89E.9080604@gmail.com>
References: <1380056659-24306-1-git-send-email-rodrigo@sdfg.com.ar> <1380567043-10102-1-git-send-email-rodrigo@sdfg.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380567043-10102-1-git-send-email-rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01.10.2013 07:50, Rodrigo Campos wrote:
> When I asked to webmaster-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Konstantin Ryabitsev answered that the
> ".nl." is "an obsolete scheme and really should be changed to just
> ftp.kernel.org". So this patch does just this change.
> 
> I also did a git grep for "\..*\.kernel.org" and didn't find anything wierd.
> Just an example using ftp.us.kernel.org in man3/getaddrinfo_a.3 where other
> domains used in the example also don't work. I'm not sure we want to fix this,
> but if we want, we should probably do it in a separate patch.

Applied. Thanks & sorry for the delay.

Cheers,

Michael


> Signed-off-by: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
> ---
>  man2/futex.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 78e3de0..a59b0a4 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -326,5 +326,5 @@ read the sources of the futex user-space library referenced below.
>  .PP
>  Futex example library, futex-*.tar.bz2 at
>  .br
> -.UR ftp://ftp.nl.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
> +.UR ftp://ftp.kernel.org\:/pub\:/linux\:/kernel\:/people\:/rusty/
>  .UE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
