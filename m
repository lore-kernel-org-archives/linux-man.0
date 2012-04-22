From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror: improve strerror_r description
Date: Sun, 22 Apr 2012 14:47:30 +1200
Message-ID: <CAKgNAkgPJM4bBLbjutvEc6b87w-UjLFiP8rNVAJQpPwqvAs1Hg@mail.gmail.com>
References: <1300400795-9123-1-git-send-email-eblake@redhat.com>
 <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb@mail.gmail.com>
 <4D8BAEBD.4080202@redhat.com> <CAKgNAkhJDrjrTJJKxubkJ2CMmoB0HBPHWmG2PWJpg7DKMcKWnw@mail.gmail.com>
 <4F936A92.4050004@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F936A92.4050004-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 22, 2012 at 2:18 PM, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 04/21/2012 06:19 PM, Michael Kerrisk (man-pages) wrote:
>> Eric,
>>
>
>> In addition to the above, I added the following, and I'd be happy if
>> you could ack it.
>>
>> =3D=3D=3D=3D=3D
>> --- a/man3/strerror.3
>> +++ b/man3/strerror.3
>> @@ -133,6 +133,19 @@ functions return
>> =A0the appropriate error description string,
>> =A0or an "Unknown error nnn" message if the error number is unknown.
>>
>> +POSIX.1-2001 and POSIX.1-2008 require that a successful call to
>> +.BR strerror (3)
>> +shall leave
>> +.I errno
>> +unchanged, and note that,
>> +since no function return value is reserved to indicate an error,
>> +an application that wishes to check for errors should initialize
>> +.I errno
>> +to zero before the call,
>> +and then check
>> +.I errno
>> +after the call.
>> +
>> =A0The XSI-compliant
>> =A0.BR strerror_r ()
>> =A0function returns 0 on success.
>> =3D=3D=3D=3D=3D

Thanks Eric!

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
