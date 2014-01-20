From: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Mon, 20 Jan 2014 13:28:41 +0100
Message-ID: <20140120122841.GC29966@aym.net2.nerim.net>
References: <1390205712-10266-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390205712-10266-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2014-01-20 16:15 +0800, Peng Haitao wrote:

> The functions strtod(), strtof() and strtold() are thread safe
> with exceptions.

> +The
> +.BR strtod (),
> +.BR strtof (),
> +and
> +.BR strtold ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale.

Is the requirement that all threads be in the same locale ? Or
that the thread that calls strtod() not use setlocale() at all ?
Or maybe that setlocale() not be called by anyone after threads
are created ? Or even that setlocale() not be used AT ALL by the
process ?

It's not obvious to me which it is !

I think that a more specific wording would be useful.

--=20
Andr=E9 Majorel http://www.teaser.fr/~amajorel/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
