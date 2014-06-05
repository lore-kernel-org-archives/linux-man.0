From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] charsets.7: update to reflect past developments
Date: Thu, 05 Jun 2014 14:27:03 +0200
Message-ID: <53906217.1090702@gmail.com>
References: <538EB3E0.5050600@redhat.com> <538FF7FC.2030409@gmail.com> <5390319E.6040106@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5390319E.6040106-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Starner <dstarner98-RXPF2eSzNizNLxjTenLetw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

Nice work! I have applied this. 

One minor question:

[...]

>  .TP
>  8859-8
>  Supports modern Hebrew without niqud (punctuation signs).
> -Niqud and full-fledged Biblical Hebrew are outside the scope of this
> -character set; under Linux, UTF-8 is the preferred encoding for
> -these.

Why remove this piece "under Linux, UTF-8...".  Is it not true? (I have 
no idea.)

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
