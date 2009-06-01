From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH 2/3] strcmp.3: Reference strstr(3)
Date: Mon, 1 Jun 2009 14:15:31 +0100 (BST)
Message-ID: <alpine.BSO.2.00.0906011413080.32660@zrgural.vwaro.pbz>
References: <1835422551-6657-1-git-send-email-mark@pogo.org.uk>  <1835422551-6657-2-git-send-email-mark@pogo.org.uk> <cfd18e0f0906010559i6a6c61d7g3c625a7a04de4323@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1034843895-1243862131=:32660"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0906010559i6a6c61d7g3c625a7a04de4323-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1034843895-1243862131=:32660
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 1 Jun 2009, Michael Kerrisk wrote:

> Mark,
>
> Why do you think this patch is needed?

I deemed that strstr() was relevant as the 'other' string comparison=20
function, but didn't go as far as to reference character-based functions=20
like strchr(). Apologies that the commit message didn't explain this.

However, after sending the patch I was made aware of string(3). To make it=
=20
easy to discover the string functions (as this patch intended to do) would=
=20
it be more appropriate for all functions listed in string(3) to reference=
=20
it?

> Cheers,
>
> Michael
>
> On Tue, Feb 29, 2028 at 9:35 AM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
>> ---
>> =A0man3/strcmp.3 | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/man3/strcmp.3 b/man3/strcmp.3
>> index 4797e71..62d9cc6 100644
>> --- a/man3/strcmp.3
>> +++ b/man3/strcmp.3
>> @@ -27,7 +27,7 @@
>> =A0.\" Modified Sat Jul 24 18:08:52 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>> =A0.\" Modified 2001-08-31, aeb
>> =A0.\"
>> -.TH STRCMP 3 =A02009-04-21 "" "Linux Programmer's Manual"
>> +.TH STRCMP 3 =A02009-05-09 "" "Linux Programmer's Manual"
>> =A0.SH NAME
>> =A0strcmp, strncmp \- compare two strings
>> =A0.SH SYNOPSIS
>> @@ -68,6 +68,7 @@ SVr4, 4.3BSD, C89, C99.
>> =A0.BR strcasecmp (3),
>> =A0.BR strcoll (3),
>> =A0.BR strncasecmp (3),
>> +.BR strstr (3),
>> =A0.BR strverscmp (3),
>> =A0.BR wcscmp (3),
>> =A0.BR wcsncmp (3)
>> --
>> 1.6.2.4
>>
>>
>
>
>
>

--=20
Mark
--0-1034843895-1243862131=:32660--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
