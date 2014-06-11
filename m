From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] siginterrupt.3: ATTRIBUTES: Note function that is not
 thread-safe
Date: Wed, 11 Jun 2014 17:09:06 +0800
Message-ID: <53981CB2.60509@cn.fujitsu.com>
References: <1402470146-16506-1-git-send-email-penght@cn.fujitsu.com> <53981650.5020900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53981650.5020900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 06/11/2014 04:41 PM, Michael Kerrisk (man-pages) wrote:
> Thanks, Haitao. Applied.
>=20
> May I suggest that you CC Qian Lei on all of your patches, at least=20
> for as long as you are both working on this topic?
>=20

OK=EF=BC=8CI will CC Qian Lei.
Thanks.

ps=EF=BC=9A Qian Lei has subscribed to the mailing list of the man-page=
s project,
so I did not CC him before.


--=20
Best Regards,
Peng

> Cheers,
>=20
> Michael
>=20
>=20
> On 06/11/2014 09:02 AM, Peng Haitao wrote:
>> The function siginterrupt() is not thread safe.
>>
>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/siginterrupt.3 | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/man3/siginterrupt.3 b/man3/siginterrupt.3
>> index bdf8b21..8365348 100644
>> --- a/man3/siginterrupt.3
>> +++ b/man3/siginterrupt.3
>> @@ -84,6 +84,12 @@ set to indicate the cause of the error.
>>  .TP
>>  .B EINVAL
>>  The specified signal number is invalid.
>> +.SH ATTRIBUTES
>> +.SS Multithreading (see pthreads(7))
>> +The
>> +.BR siginterrupt ()
>> +function uses a global variable that is not protected,
>> +so it is not thread-safe.
>>  .SH CONFORMING TO
>>  4.3BSD, POSIX.1-2001.
>>  POSIX.1-2008 marks
>>
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
