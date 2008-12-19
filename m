From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] crypt.3: Fix formatting
Date: Fri, 19 Dec 2008 10:04:39 -0500
Message-ID: <cfd18e0f0812190704p42a3b1a5i4518a18759aaebde@mail.gmail.com>
References: <20081208000827.GO10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081208000827.GO10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Sun, Dec 7, 2008 at 7:08 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> My groff removes the spaces and renders parts of the string in bold.
>
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 8d75cd1..1139792 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -158,7 +158,8 @@ function was not implemented, probably because of U.S.A. export restrictions.
>  .SH "CONFORMING TO"
>  .BR crypt ():
>  SVr4, 4.3BSD, POSIX.1-2001.
> -.BR crypt_r () is a GNU extension.
> +.BR crypt_r ()
> +is a GNU extension.
>  .SH NOTES
>  .SS Glibc Notes
>  The glibc2 version of this function supports additional

Thanks.  Applied for 3.16.

Cheers,

Michael

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
