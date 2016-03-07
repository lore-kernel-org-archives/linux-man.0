From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: locale.5: drop tel/fax description
Date: Mon, 07 Mar 2016 13:16:31 +0100
Message-ID: <56DD711F.3090605@bfs.de>
References: <56DD6B93.8070802@redhat.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DD6B93.8070802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

It should simply be noted that these fields are droped since glibc xyz

Others may support them and it is stil valid for older version.

re,
 wh


Am 07.03.2016 12:52, schrieb Marko Myllynen:
> Hi Michael,
> 
> glibc upstream recently deemed that the tel/fax fields are not useful
> and dropped them from the few locales which had them defined. Do you
> think we could/should drop the descriptions from the man page as well?
> 
> https://sourceware.org/git/?p=glibc.git;a=commit;h=5453f739e5fae1f9235c3207a8604f164dc9e484
> 
> ---
>  man5/locale.5 | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 0a26f91..cc6edf2 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -569,14 +569,6 @@ the organization that maintains this document.
>  followed by the email address of the person or
>  organization that maintains this document.
>  .TP
> -.I tel
> -followed by the telephone number (in international format)
> -of the organization that maintains this document.
> -.TP
> -.I fax
> -followed by the fax number (in international format)
> -of the organization that maintains this document.
> -.TP
>  .I language
>  followed by the name of the language to which this document applies.
>  .TP
> 
> Thanks,
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
