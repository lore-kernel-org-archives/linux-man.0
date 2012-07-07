From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kexec_load: minor man page bug
Date: Sat, 7 Jul 2012 08:22:49 +0200
Message-ID: <CAKgNAkhEuPPpCJ1ZaQx8V5HyN537pYjXKCObmYPzbsbbse3sxA@mail.gmail.com>
References: <20120624135213.GA2714@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120624135213.GA2714-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael S. Tsirkin" <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael
On Sun, Jun 24, 2012 at 3:52 PM, Michael S. Tsirkin <mst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> I found this, looks like a minor bug:
>
> http://www.kernel.org/doc/man-pages/online/pages/man2/kexec_load.2.html
> says:
>         KEXEC_PRESERVE_CONTEXT (since Linux 2.7.27)
>
> was there ever such a kernel version: 2.7.27?

Thanks. It should Ibe 2.6.27. Fixed now.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
