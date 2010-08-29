From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Doubts with sysfs(2)
Date: Sun, 29 Aug 2010 14:39:33 +0200
Message-ID: <AANLkTik0D7AummdRGF0d8VWtfXffWd5ZFUOpfwTvLGUb@mail.gmail.com>
References: <1277635872.25713.4.camel@cowboy> <AANLkTilFc81wcLlG_ELqjDb8xz1RZC_Y3Okh5ncCrOxH@mail.gmail.com>
 <AANLkTi=kh3Tnuh+QZxsa8JpAv-RJ8mC9bYUe8cga-sux@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=kh3Tnuh+QZxsa8JpAv-RJ8mC9bYUe8cga-sux-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Sun, Aug 29, 2010 at 11:25 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> On 2010/6/27 Michael Kerrisk wrote:
> [...]
>> --- a/man2/sysfs.2
>> +++ b/man2/sysfs.2
>> @@ -90,12 +90,12 @@ is invalid.
>> =A0.SH "CONFORMING TO"
>> =A0SVr4.
>> =A0.SH NOTES
>> -On Linux with the
>> -.I proc
>> -file system mounted on
>> +This System-V derived system call is obsolete; don't use it.
>> +On systems with
>> =A0.IR /proc ,
>> -the same information can be derived from
>> -.IR /proc/filesystems .
>> +the the same information can be obtained via
>
> Hello Michael,
>
> There is an extra 'the' just above, found in commit d1d721be.
>
> Denis

Thanks. Fixed.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
