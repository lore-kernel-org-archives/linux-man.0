From: Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strlen man-page misinformation
Date: Thu, 18 Feb 2016 08:25:56 -0800
Message-ID: <CAAHpriPqJhR45MD9C1cstZO_f=x92kB4ro0kosSEGb+aoc2MHw@mail.gmail.com>
References: <56B237F9.8010206@cox.net>
	<56C5C33E.7030407@gmail.com>
	<56C5E67A.2010401@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C5E67A.2010401-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Aversa <alan.aversa-j9pdmedNgrk@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Feb 18, 2016 at 7:42 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 18.02.2016 14:12, schrieb Michael Kerrisk (man-pages):
>> Hello Alan,
>>
>> On 02/03/2016 06:25 PM, Alan Aversa wrote:
>>> Hello,
>>>
>>> The 2015-08-08 strlen man-page is incorrect. Here's a diff:
>>>
>>>     --- a/man3/strlen.3
>>>     +++ b/man3/strlen.3
>>>     @@ -45,7 +45,7 @@ excluding the terminating null byte (\(aq\\0\(aq).
>>>      .SH RETURN VALUE
>>>      The
>>>      .BR strlen ()
>>>     -function returns the number of bytes in the string
>>>     +function returns the number of *characters* in the string that
>>>     precede the terminating null character
>>
>> I went for a simpler change: s/bytes/characters/
>
>
> For my understanding this is wrong. 1 character may be represented by 2 or more bytes (utf8).
> see this example, the string (test) is 3 characters long and takes 6 bytes space.
>
> did i miss something ? did the specification of character change ?

[...]

Either "bytes" or "characters" would be correct. POSIX says "bytes";
ISO C says "characters".

See the definition of "character" in C11 3.7.1:

>  bit representation that fits in a byte

On the other hand, 3.7 defines an (abstract) "character" as:

> member of a set of elements used for the organization, control,
> or representation of data

It also defines the terms "multibyte character" (a sequence of one
or more bytes representing a member of the extended character set)
and "wide character" (a value of type wchar_t).

"Bytes" is less ambiguous, but "characters" matches the wording of the
ISO C standard (and, in that context, refers to single-byte characters).

-- 
Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
