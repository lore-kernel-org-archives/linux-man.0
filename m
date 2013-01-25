From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 52741] getnameinfo man page has inappropriate text copied
 from getaddrinfo
Date: Fri, 25 Jan 2013 21:46:56 +0100
Message-ID: <CAKgNAkjHx3JNQ+P7S6+PsN52nnG1WuAm39csvU983B0HgJYSXQ@mail.gmail.com>
References: <bug-52741-11311@https.bugzilla.kernel.org/> <20130115194601.9BFD311FB6C@bugzilla.kernel.org>
 <kdup11$jhp$1@ger.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <kdup11$jhp$1@ger.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jan 25, 2013 at 9:13 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> Le 15/01/2013 15:46,
> bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org a =E9crit :
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D52741
>
>> --- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuM=
wx3w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>  2013-01-15 19:46:01 ---
>> Thkanks for the report Peter.
>>
>> So, it seems here were a confused references in both getnameinfo() a=
nd
>> getaddrinfo(). I applied the following patch.
>>
>> --- a/man3/getaddrinfo.3
>> +++ b/man3/getaddrinfo.3
>> @@ -91,7 +91,7 @@ function combines the functionality provided by th=
e
>>  .\" .BR getipnodebyaddr (3),
>>  .BR getservbyname (3)
>>  and
>> -.BR getservbyport (3)
>> +.BR getservbyname (3)
>
> That change doesn't seem right (duplicating the getservbyname(3) refe=
rence).

Thanks, David.

It should of course have been "gethostbyname(3) and getservbyname(3)".
=46ixed now.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
