From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man2/epoll_create.2: fix typo in epoll_create1 desc
Date: Sun, 8 Feb 2009 23:58:33 +1300
Message-ID: <cfd18e0f0902080258h262410fcue7b1af6d4a10776c@mail.gmail.com>
References: <1233992321-23201-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1233992321-23201-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Sat, Feb 7, 2009 at 8:38 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> Christopher Head reported that there is a typo in the epoll_create1 desc.
> When referring to the epoll_create func, we should say "size", not "flags".

Thanks.  Applied for 3.18.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> CC: Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
> ---
>  man2/epoll_create.2 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/epoll_create.2 b/man2/epoll_create.2
> index 9a0aea0..52b8f09 100644
> --- a/man2/epoll_create.2
> +++ b/man2/epoll_create.2
> @@ -62,7 +62,7 @@ and releases the associated resources for re-use.
>  If
>  .I flags
>  is 0, then, other than the fact that the obsolete
> -.I flags
> +.I size
>  argument is dropped,
>  .BR epoll_create1 ()
>  is the same as
> --
> 1.6.1.1
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
