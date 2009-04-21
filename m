From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Link to some less-known string functions
Date: Tue, 21 Apr 2009 06:25:47 +0200
Message-ID: <cfd18e0f0904202125p66bb7257yf5d6de4d569dd35b@mail.gmail.com>
References: <20090415111300.GM8940@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090415111300.GM8940-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Wed, Apr 15, 2009 at 1:13 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Some string functions are almost unknown, yet might be useful.
> This adds ffs(3) to SEE ALSO section of memchr(3) and strverscmp(3)
> to SEE ALSO section of strcmp(3).

Thanks.  Applied (as three commits) for man-pages-3.22.

Cheers,

Michael


> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/ffs.3 b/man3/ffs.3
> index 95c8924..dae8e03 100644
> --- a/man3/ffs.3
> +++ b/man3/ffs.3
> @@ -68,4 +68,5 @@ or 0 if no bits are set in
> =A0BSD systems have a prototype in
> =A0.IR <string.h> .
> =A0.SH "SEE ALSO"
> -.BR feature_test_macros (7)
> +.BR feature_test_macros (7),
> +.BR memchr (3)
> diff --git a/man3/memchr.3 b/man3/memchr.3
> index f98eaf7..b9bb8ae 100644
> --- a/man3/memchr.3
> +++ b/man3/memchr.3
> @@ -135,4 +135,5 @@ function is a GNU extension, available since glib=
c 2.1.
> =A0.BR strsep (3),
> =A0.BR strspn (3),
> =A0.BR strstr (3),
> -.BR wmemchr (3)
> +.BR wmemchr (3),
> +.BR ffs (3)
> diff --git a/man3/strcmp.3 b/man3/strcmp.3
> index 0304a85..8814fdd 100644
> --- a/man3/strcmp.3
> +++ b/man3/strcmp.3
> @@ -69,4 +69,5 @@ SVr4, 4.3BSD, C89, C99.
> =A0.BR strcoll (3),
> =A0.BR strncasecmp (3),
> =A0.BR wcscmp (3),
> -.BR wcsncmp (3)
> +.BR wcsncmp (3),
> +.BR strverscmp (3)
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
