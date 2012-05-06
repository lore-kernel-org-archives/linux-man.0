From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], ptrace(2): Unnecessary escape before ">"
Date: Mon, 7 May 2012 09:43:33 +1200
Message-ID: <CAKgNAkgwxpez4Vkn2iMuwQkBvYXh80C8UK1N0M4nFkfEMMyO0w@mail.gmail.com>
References: <20120506200217.GA1004@rhi.hi.is> <CAKgNAki_0bW43ffUsYLtRG06_h_iaGbBg-tzxjczPnqS660sdg@mail.gmail.com>
 <20120506213950.GA2078@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120506213950.GA2078-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Mon, May 7, 2012 at 9:39 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> On Mon, May 07, 2012 at 08:51:41AM +1200, Michael Kerrisk (man-pages)=
 wrote:
>> Bjarni,
>>
>> On Mon, May 7, 2012 at 8:02 AM, Bjarni Ingi Gislason <bjarniig@rhi.h=
i.is> wrote:
>> > Package: man-pages
>> > Version: 3.40
>> > Severity: minor
>> > Tags: patch
>> >
>> > =A0From "groff -ww ..." (or "man --warnings=3Dw ...":
>> >
>> > <standard input>:758: warning: escape character ignored before `>'
>> >
>> > =A0Also periods (full stop) in ellipises "protected" with "\&".
>>
>> My knowledge here is a bit thin. Can you expand on the previous sent=
ence please.
>>
>
> =A0This "protection" is actually only necessary, if the
> (unprotected) ellipsis is at the start (becomes a groff macro
> command) or (almost) at end of a line (last period interpreted as
> an end of a sentence). =A0That can happen, if the paragraph (line)
> gets later reformatted or changed in the source.

Ahh -- okay. It's not currently broken then, so I'll leave as is, but
I will apply the fix to  "\>>".

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
