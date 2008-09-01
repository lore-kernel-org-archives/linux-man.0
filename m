From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] fix typo in glibc reference: sigorset and not sigdelset
Date: Mon, 01 Sep 2008 12:42:43 +0200
Message-ID: <48BBC723.8020901@gmail.com>
References: <1220067396-5425-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1220067396-5425-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Mike Frysinger wrote:
> From: Christopher Head <chead-EynCeXvFgoheoWH0uzbU5w@public.gmane.org>
> 
> In the man page sigsetops(3), in the last paragraph under the DESCRIPTION
> section, is this fragment:
> 
> "or the additional glibc functions described below (sigisemptyset(),
> sigandset(), and sigdelset())."
> 
> In this fragment, sigdelset() should be sigorset().


Applied for 3.09.  Thanks  Chris/Mike!

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man3/sigsetops.3 |    2 +-
>  1 files changed, 1 inse
rtions(+), 1 deletions(-)
> 
> diff --git a/man3/sigsetops.3 b/man3/sigsetops.3
> index d679a14..0ea0d76 100644
> --- a/man3/sigsetops.3
> +++ b/man3/sigsetops.3
> @@ -84,7 +84,7 @@ or the additional glibc functions described below
>  .RB ( sigisemptyset (),
>  .BR sigandset (),
>  and
> -.BR sigdelset ()).
> +.BR sigorset ()).
>  The results are undefined if this is not done.
>  .SH "RETURN VALUE"
>  .BR sigemptyset (),

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
