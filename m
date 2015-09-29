From: Gabriel Corona <gabriel.corona-Pj3lBMu8rt9bbU8NOSLlsg@public.gmane.org>
Subject: STV_PROTECTED
Date: Tue, 29 Sep 2015 12:14:22 +0200
Message-ID: <20150929101411.GA17105@skagos.loria.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

The elf manpage [2] claims that:

> STV_PROTECTED   Not preemptible, not exported.

However the System V gABI [1] claims that:

> A symbol defined in the current component is protected if it is
> visible in other components but not preemptable

Should the manpage read something like:

> STV_PROTECTED   Not preemptible but exported.

[1] http://www.sco.com/developers/gabi/2003-12-17/ch4.symtab.html

[2] http://man7.org/linux/man-pages/man5/elf.5.html

--
Gabriel Corona
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
