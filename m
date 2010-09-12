From: ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org
Subject: Re: function cerf in manpage but not in <complex.h>
Date: Sun, 12 Sep 2010 12:28:43 +0200 (CEST)
Message-ID: <767f04770f3b96b1e04cabd4867f8b27.squirrel@webmail-lpp.polytechnique.fr>
References: <b7b0d7b84ae39fc2c80b7efd5d04965a.squirrel@webmail-lpp.polytechnique.fr>
    <AANLkTi=gfsUWbHD1_vyN9sHu1U4RdtYjiVxYpQUs6za4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=gfsUWbHD1_vyN9sHu1U4RdtYjiVxYpQUs6za4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Micheal,

> Hello Ozgur,
>
> On Sun, Sep 12, 2010 at 12:06 AM,  <ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org>
> wrote:
>> Hi,
>>
>> in my system (2.6.34-gentoo-r2), "man cerf" gives me the description of
>> a
>> certain complex error function. This function however is nowhere to be
>> found. I tried this on 5 other linux boxes with the same result.
>>
>> May be the function was taken out at some point but the documentation
>> stayed.
>
> Further down in the page is the line
>
> ==
> .SH AVAILABILITY
> Not yet in glibc, as at version 2.12.
> ==
>
> I suppose you missed that, which is easy to do. I tweaked the page
> (for man-pages-3.27) as below, to try to make it a little clearer.
>
> Cheers,
>
> Michael
>
> --- a/man3/cerf.3
> +++ b/man3/cerf.3
> @@ -21,7 +21,7 @@ cerf, cerff, cerfl, cerfc, cerfcf, cerfcl \- complex
> error function
>  .sp
>  Link with \fI\-lm\fP.
>  .SH DESCRIPTION
> -The function
> +The (unimplemented) function
>  .BR cerf ()
>  is the complex version of the error function.
>  erf(z) = 2/sqrt(pi) * integral from 0 to z of exp(\-t*t) dt.
> @@ -32,7 +32,7 @@ is defined as cerfc(z) = 1\-cerf(z).
>  .SH "CONFORMING TO"
>  The function names are reserved for future use in C99.
>  .SH AVAILABILITY
> -Not yet in glibc, as at version 2.8.
> +Not yet in glibc, as at version 2.12.
>  .\" But reserved in NAMESPACE.
>  .SH "SEE ALSO"
>  .BR erf (3),
>

I see. I had seen the note, but I thought it was in "libm" and not in
glibc or something like that (since it also says link with -lm). I think
your version is much clearer.

thanks,

Ozgur

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
