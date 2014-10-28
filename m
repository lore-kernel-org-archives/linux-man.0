From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: typos error in man page pthread_setschedparam(3)
Date: Tue, 28 Oct 2014 15:29:25 +0100
Message-ID: <544FA845.4040608@gmail.com>
References: <9bd1496.6d0e.1492b94b860.Coremail.liupai_work@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9bd1496.6d0e.1492b94b860.Coremail.liupai_work-9Onoh4P/yGk@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?5YiY5rmD?= <liupai_work-9Onoh4P/yGk@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, =E5=88=98=E6=B9=83. I have applied your changes.

Cheers,

Michael



On 10/20/2014 05:23 AM, =E5=88=98=E6=B9=83 wrote:
> In Example, Program source=20
>=20
> - fpe("\-i {e|s}         Set inherit scheduler attribute to\\n");
> + fpe("\-i {e|i}         Set inherit scheduler attribute to\\n");
>=20
> - usage(argv[0], "Bad policy for main thread (-s)\n");
> + usage(argv[0], "Bad policy for main thread (-m)\n");
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
