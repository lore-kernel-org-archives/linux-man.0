From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: typo in clone(2)
Date: Sat, 17 Oct 2009 06:06:31 +0200
Message-ID: <cfd18e0f0910162106r671f61cbg6f3bb0af3bf3295f@mail.gmail.com>
References: <20091008185805.GA28839@mette>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091008185805.GA28839@mette>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Oct 8, 2009 at 8:58 PM, Andries E. Brouwer
<Andries.Brouwer-rh8NL+sEX9E@public.gmane.org> wrote:
> --- clone.2 =A0 =A0 2009-10-08 20:56:13.000000000 +0200
> +++ clone.2a =A0 =A02009-10-08 20:56:35.000000000 +0200
> @@ -786,7 +786,7 @@
> =A0.IR ptid ,
> =A0.IR tls ,
> =A0and
> -.IT ctid .
> +.IR ctid .
> =A0.SH "RETURN VALUE"
> =A0.\" gettid(2) returns current->pid;
> =A0.\" getpid(2) returns current->tgid;

Thanks. Applied.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
