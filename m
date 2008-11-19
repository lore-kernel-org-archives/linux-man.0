From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Typo in sigprocmask(2)
Date: Wed, 19 Nov 2008 10:25:42 -0500
Message-ID: <cfd18e0f0811190725h3ab58e22s90b4762f4bdef88a@mail.gmail.com>
References: <1227107562.22091.7.camel@linux.heathens.co.nz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1227107562.22091.7.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-2022-JP?B?Q2hyaXMgIhskQiUvGyhCIiBIZWF0aA==?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gidday Chris,

On Wed, Nov 19, 2008 at 10:12 AM, Chris "ク" Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org> wrote:
> Michael,
>
> Here's a patch for a small typo I noticed.

Thanks.  Applied for 3.14.

Cheers,

Michael

> diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
> index 524f3d3..e0b4a7b 100644
> --- a/man2/sigprocmask.2
> +++ b/man2/sigprocmask.2
> @@ -82,7 +82,7 @@ is NULL, then the signal mask is unchanged (i.e.,
>  is ignored),
>  but the current value of the signal mask is nevertheless returned in
>  .I oldset
> -(it is not NULL).
> +(if it is not NULL).
>
>  The use of
>  .BR sigprocmask ()
>
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
