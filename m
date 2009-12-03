From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: typo in the clone.2
Date: Thu, 3 Dec 2009 16:34:38 +0100
Message-ID: <cfd18e0f0912030734h421b1608mde417aa58ba2c9e1@mail.gmail.com>
References: <20091121170847.05357d0b@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091121170847.05357d0b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Someone else recently reported this, and it's fixed for the next releas=
e.

Thanks for the report!

Michael


On Sat, Nov 21, 2009 at 3:08 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- clone.2.orig =A0 =A0 =A0 =A02009-11-21 17:06:58.000000000 +0300
> +++ clone.2 =A0 =A0 2009-11-21 17:07:10.000000000 +0300
> @@ -786,7 +786,7 @@
> =A0.IR ptid ,
> =A0.IR tls ,
> =A0and
> -.IT ctid .
> +.IR ctid .
> =A0.SH "RETURN VALUE"
> =A0.\" gettid(2) returns current->pid;
> =A0.\" getpid(2) returns current->tgid;
>
>
> --
> Best Regards,
> Yuri Kozlov
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
