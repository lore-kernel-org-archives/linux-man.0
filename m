From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] FreeBSD and bionic have memmem
Date: Thu, 9 Jun 2016 10:00:34 +0200
Message-ID: <CAKgNAkgUXrFZOvm-QazpYjjWEc7-Eit49sjWZCeAqbEP+32i3A@mail.gmail.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com> <1387586263-9002-5-git-send-email-shawn@churchofgit.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-5-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Shawn,

On 21 December 2013 at 01:37, Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org> wrote:
> Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> ---
>  man3/memmem.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/memmem.3 b/man3/memmem.3
> index 7b97d2d..667ff62 100644
> --- a/man3/memmem.3
> +++ b/man3/memmem.3
> @@ -57,7 +57,7 @@ The
>  function returns a pointer to the beginning of the
>  substring, or NULL if the substring is not found.
>  .SH CONFORMING TO
> -This function is a GNU extension.
> +This function is a GNU extension. Present in FreeBSD 6.0 and bionic.

It seems to pbe present on some other systems as well, so I reworded as:

       This  function is not specified in POSIX.1, but is present on a
       number of other systems.

Thanks for the report.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
