From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] README: add mailing list info
Date: Sun, 29 Aug 2010 07:40:56 +0200
Message-ID: <AANLkTi=EtK5Spo9yPV-RHXciT71DqoJbCwkwCizKBQdQ@mail.gmail.com>
References: <1282307913-29019-1-git-send-email-virtuoso@slind.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1282307913-29019-1-git-send-email-virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alexander,

On Fri, Aug 20, 2010 at 2:38 PM, Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org=
> wrote:
> Signed-off-by: Alexander Shishkin <virtuoso-0lOfPCoBze7YtjvyW6yDsg@public.gmane.org>
> ---
> =A0README | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/README b/README
> index 3f06a5e..da07857 100644
> --- a/README
> +++ b/README
> @@ -29,3 +29,5 @@ All pages are freely distributable when the nroff s=
ource is included.
>
> =A0If you have corrections and additions to suggest, see
> =A0http://www.kernel.org/doc/man-pages/
> +
> +The mailing list address is linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
> --
> 1.7.2.1.45.gb66c2

I won't make this change. The reason is that I want people to look at
the website to see how the mailing list is used. Having said that, I
could make the README more precise, and I did make this change:

--- a/README
+++ b/README
@@ -28,4 +28,4 @@ Copyrights: These man pages come under various copyri=
ghts.
 All pages are freely distributable when the nroff source is included.

 If you have corrections and additions to suggest, see
-http://www.kernel.org/doc/man-pages/
+http://www.kernel.org/doc/man-pages/contributing.html

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
