From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re:
Date: Sat, 26 Jun 2010 14:52:23 +0200
Message-ID: <AANLkTim6qZTM5lO3e98iQvZ3qo5aEmiYgLNm2wRNsfHO@mail.gmail.com>
References: <460216361116404BB61933403540E169B645A3E596@ushqwmb03>
	<4C1FD431.6030505@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C1FD431.6030505-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bill o gallmeister <bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bob Eggers <Bob.Eggers-C65YXLrEp3M@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Jun 21, 2010 at 11:05 PM, bill o gallmeister
<bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I believe that's the correct result for a NULL-terminated string of l=
ength 1.

And I agree.

Thanks,

Michael


> On 06/21/2010 01:30 PM, Bob Eggers wrote:
>> I noticed an error in and example on the man page for strncpy(). The=
 page is http://www.kernel.org/doc/man-pages/online/pages/man3/strncpy.=
3.html
>>
>> The error is in the section, "NOTES", specifically in the code examp=
le after the text:
>>
>> =A0 =A0 =A0 If there is no terminating null byte in the first n char=
acters of src,
>> =A0 =A0 =A0 =A0strncpy() produces an unterminated string in dest. =A0=
Programmers often prevent
>> =A0 =A0 =A0 =A0this mistake by forcing termination as follows:
>>
>> =A0 =A0 =A0 =A0 =A0 =A0strncpy(buf, str, n);
>> =A0 =A0 =A0 =A0 =A0 =A0if (n > 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf[n - 1]=3D '\0';
>>
>> Substituting 1 for n and "123" for str, this would equate to:
>>
>> =A0 =A0 =A0 =A0 =A0 =A0strncpy(buf, "123", 1); =A0// buf is now "1"
>> =A0 =A0 =A0 =A0 =A0 =A0if (1 > 0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf[1 - 1]=3D '\0'; =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0// buf is now ""
>>
>> Bob Eggers--
>> To unsubscribe from this list: send the line "unsubscribe linux-man"=
 in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> Bill O. Gallmeister
> bgallmeister-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> http://geekwhisperer.blogspot.com
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
