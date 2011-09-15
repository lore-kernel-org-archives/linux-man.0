From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: EXEC(3) html broken link
Date: Thu, 15 Sep 2011 06:14:25 +0200
Message-ID: <CAKgNAkgYUvYaehOOYSnLfDzeS4_KA4as+Lmmm0bTyyH7_kcRAQ@mail.gmail.com>
References: <AANLkTind7u0CqVobfsCpFNN8FX+n7tgOyGuVwdZ29oeV@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTind7u0CqVobfsCpFNN8FX+n7tgOyGuVwdZ29oeV-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manuel Mendez <mmendez534-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Manuel,

On Mon, Dec 13, 2010 at 3:21 PM, Manuel Mendez <mmendez534-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> EXEC 3 - html version
> http://www.kernel.org/doc/man-pages/online/pages/man3/exec.3.html
> Section - SEE ALSO
>
> Problem - links to "sh (1)" at
> "http://www.kernel.org/doc/man-pages/online/pages/man1/sh.1.html"
> which reports a 404 error.

Yes, such problems were the result of a scripting error. For
man-pages-3.33, text like "sh(1)" which refers to pages outside
man-pages wont be hyperlinked.

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
