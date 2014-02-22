From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolv.conf.5: DESCRIPTION: Mention that the data is
 trusted.
Date: Sat, 22 Feb 2014 09:57:36 +0100
Message-ID: <53086680.30900@gmail.com>
References: <5303E845.7080003@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5303E845.7080003-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/19/2014 12:09 AM, Carlos O'Donell wrote:
> In a recent discussion about DNSSEC it was brought to my
> attention that not all system administrators may understand
> that the information in /etc/resolv.conf is fully trusted.
> The resolver implementation in glibc treats /etc/resolv.conf
> as a fully trusted source of DNS information and passes on
> the AD-bit for DNSSEC as trusted.
> 
> Would it be possible to add a clarifying setence to the
> man page for resolv.conf.5 to make it absolutely clear that
> indeed this source of information is trusted?
> 
> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index f398724..2dfccdf 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -35,6 +35,9 @@ The resolver configuration file contains information that is read
>  by the resolver routines the first time they are invoked by a process.
>  The file is designed to be human readable and contains a list of
>  keywords with values that provide various types of resolver information.
> +The configuration file is considered a trusted source of DNS information
> +e.g. DNSSEC AD-bit information will be returned unmodified from these
> +sources.
>  .LP
>  If this file does not exist,
>  only the name server on the local machine will be queried;

Carlos,

Thanks. I've applied this, but made one small change. You wrote plural "these
sources", but the context seems to indicate a singular is required, so I 
changed it to "this source". Okay?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
