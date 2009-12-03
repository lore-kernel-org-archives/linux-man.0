From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: The error of "getpwuid"
Date: Thu, 3 Dec 2009 16:20:42 +0100
Message-ID: <cfd18e0f0912030720q62db3922y100219be97040175@mail.gmail.com>
References: <bdf46e580911242144s733020bamd6816a7853887ccb@mail.gmail.com>
	 <bdf46e580911262152u27a3e96bx3bde63668afaa240@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bdf46e580911262152u27a3e96bx3bde63668afaa240-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?GB2312?B?y++9qLjV?= <sunjiangangok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Fixed for man-pages-3.24.

2009/11/27 =CB=EF=BD=A8=B8=D5 <sunjiangangok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org,linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
>
> 2009/11/25, =CB=EF=BD=A8=B8=D5 <sunjiangangok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> I have found an spelling error of "getpwuid" which is in the section=
 3
>> of man-pages.
>> The error is in the last third line of EXAMPLE in "getpwuid",
>> the primary is
>>  printf("Name: %s; UID: %ld0, pwd.pw_gecos, (long) pwd.pw_uid);
>> but it is wrong.The right is
>>  printf("Name: %s; UID: %ld", pwd.pw_gecos, (long) pwd.pw_uid);
>> should change "0" to quotation mark("), not "0".
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
