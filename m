From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: fs(5) man page is out of date
Date: Thu, 10 Jun 2010 06:23:16 +0200
Message-ID: <AANLkTilvXT-T7TW_yp2m8elekKBHniKWp6iAtdRCgOc8@mail.gmail.com>
References: <4BF2BAD0.5070100@myLetters.US> <20100518185651.GQ16800@machine.or.cz>
	<4BF43CAB.7090907@myLetters.US> <AANLkTilvJe1XxwAFtKOu8Z85nz3xutMb-sCTMGtiRnzS@mail.gmail.com>
	<AANLkTin_VLloyn1IReU_h_uMWCUl5Z0-HJiK5OCDoiKa@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTin_VLloyn1IReU_h_uMWCUl5Z0-HJiK5OCDoiKa-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Thu, May 27, 2010 at 11:26 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> On 2010/5/24 Michael Kerrisk wrote:
> [...]
>> --- a/man5/filesystems.5
>> +++ b/man5/filesystems.5
> [...]
>> @@ -77,6 +77,12 @@ is a journaling version of the ext2 file system.
>> =A0It is easy to
>> =A0switch back and forth between ext2 and ext3.
>> =A0.TP
>> +.B ext4
>> +is a set of upgrades to ext3 including substantial performance and
>> +reliability enhancements,
>> +plus large increases in volume, file, and directory size limits.
>> +.TP
>> + .B Reiserfs
>
> Hello,
>
> Please remove the line above, it is duplicated and contain a spurious
> leading space.
>
>> =A0.B Reiserfs
>> =A0is a journaling file system, designed by Hans Reiser,
>> =A0that was integrated into Linux in kernel 2.4.1.

Thanks for catching that. Fixed now.,

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
