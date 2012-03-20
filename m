From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 20 Mar 2012 19:30:29 +1300
Message-ID: <CAKgNAkj-bss8Tuq3jcPMRpsKCfKgHGSemq5emS48eBXi2JXA_w@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331358148-17235-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

And another question about a different part of the page:

> +.SH "RETURN VALUE"
> +On success,
> +.BR process_vm_readv ()
> +returns the number of bytes read while
> +.BR process_vm_writev ()
> +returns the number of bytes written.
> +
> +On error, the number of bytes read or written is returned, or -1 is
> +returned if it was unable to read/write any bytes; in either case,
> +.I errno
> +is set appropriately.

Is that last piece really true? On error, how does the syscall return
number of bytes read or written *and* set errno?

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
