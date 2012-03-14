From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] tzset.3: fix description of "n" format
Date: Wed, 14 Mar 2012 15:29:53 +0100
Message-ID: <4F60AB61.8060003@redhat.com>
References: <4EBC16EC.30905@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EBC16EC.30905-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

could somebody look at this? Patch was attached in previous email, only=
=20
review is needed.

Thanks,

peter

On 11/10/2011 07:24 PM, Peter Schiffer wrote:
> Hello,
>
> according to [1], description of start/end format of TZ variable says=
:
> ...
> Jn
> This specifies the Julian day, with n between 1 and 365. February 29=20
> is never counted, even in leap years.
> n
> This specifies the Julian day, with n between 0 and 365. February 29=20
> is counted in leap years.
> ...
>
> This is correct and works. However, man page tzset(3) says:
> ...
> Jn This specifies the Julian day with n between 1 and 365. Febru=E2=80=
=90
> ary 29 is never counted even in leap years.
>
> n This specifies the Julian day with n between 1 and 365. Febru=E2=80=
=90
> ary 29 is counted in leap years.
> ...
>
> For "n" format, interval should be "between 0 and 365". Attached patc=
h=20
> is solving this issue.
>
> Version of man pages: 3.35
>
>
> peter
>
>
> [1] http://www.gnu.org/s/hello/manual/libc/TZ-Variable.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
