From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: typo in sigaction(2)
Date: Mon, 02 Sep 2013 07:40:38 +0200
Message-ID: <522424D6.9070309@gmail.com>
References: <1758230142.2775791.1377696186352.JavaMail.root@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1758230142.2775791.1377696186352.JavaMail.root-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zdenek Pavlas <zpavlas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks.

Cheers,

Michael

On 08/28/13 15:23, Zdenek Pavlas wrote:
> --- man-pages-3.53/man2/sigaction.2.orig	2013-08-28 15:20:18.610607663 +0200
> +++ man-pages-3.53/man2/sigaction.2	2013-08-28 15:20:42.354542549 +0200
> @@ -405,7 +405,7 @@ with the address of the fault.
>  On some architectures,
>  these signals also fill in the
>  .I si_trapno
> -filed.
> +field.
>  Some suberrors of
>  .BR SIGBUS ,
>  in particular
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
