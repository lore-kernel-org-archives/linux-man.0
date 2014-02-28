From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: resend: add strerror_l() to strerror()
Date: Fri, 28 Feb 2014 23:26:54 +0200
Message-ID: <CACKs7VBG_O4qdrkOsK9RkEUfvkMHSMnXON=a4nCtjNGNN00MKg@mail.gmail.com>
References: <53105855.6000206@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53105855.6000206-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Walter,

I spotted some typos in your patch, I thought I'd send you some
feedback before Michael catches up on this...

On Fri, Feb 28, 2014 at 11:35 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
[...]
> @@ -133,6 +137,11 @@
>  .I errnum
>  is unknown).
>  The string always includes a terminating null byte (\(aq\\0\(aq).
> +
> +To get an error message in a given locale you need
> +.BR strerror_l ()
> +it takes an additional arument that defines to locale in what the message is returned.

s/arument/argument

> +The function is thread-safe.

This sentence seems redundant, you also mention this below (ATTRIBUTES
section?).

>  .SH RETURN VALUE
>  The
>  .BR strerror ()
> @@ -180,6 +189,8 @@
>  .LP
>  The
>  .BR strerror_r ()
> +and
> +.BR strerror_r ()

I suppose you mean strerror_l()?

> @@ -210,6 +221,39 @@
>  .B EINVAL
>  if the error number is unknown.
>  C99 and POSIX.1-2008 require the return value to be non-NULL.
> +.sp
> +.BR strerror_l ()
> +is a POSIX.1-2008 requirement, but available as GNU-specific function
> +atleast since glibc 2.6.1.

s/atleast/at least

> +.SH EXAMPLE
> +The program below demonstrates the use of the
> +.BR strerror* ()
> +functions. The first line should be
> +.I sterror_l(13)=Permission denied

s/sterror/strerror. This is also repeated below a few times... Also,
don't you need to call strerror_l() with a different locale in order
to get a translated error message? You are calling strerror_l() and
then strerror() and strerror_r()...

> +the others should print this in a locale specific version.
> +.nf
> +
> +#include <stdio.h>
> +#include <string.h>
> +#include <locale.h>
> +
> +int main()
> +{
> +  int e=13;    // errornumber
> +  char buf[255];
> +  locale_t loc;
> +
> +  setlocale(LC_ALL, "");
> +  loc = newlocale (LC_MESSAGES_MASK, "C", NULL);
> +  printf("sterror_l(13)=%s\\n",strerror_l(e,loc));
> +  freelocale (loc);
> +  // this will be translated automaticly
> +  printf("sterror(13)=%s\\n",strerror(e));
> +  strerror_r(e,buf,sizeof(buf)-1);
> +  printf("sterror(13)=%s\\n",buf);
> +  return 0;
> +}
> +.fi

Thanks,
Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
