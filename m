From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix ppoll example
Date: Fri, 2 Jul 2010 07:10:24 +0200
Message-ID: <AANLkTimRDeEVjyetAvOEn0z4JqqiysEO_glOKOQrvP94@mail.gmail.com>
References: <20091227004007.GA8638@basil.fritz.box> <20091227004422.GA8673@basil.fritz.box>
	<AANLkTimHnSfMtcsuG8lJ-MTLeMCA3f9XQkL26bEdth1F@mail.gmail.com>
	<AANLkTimkwPS5_6yltbKsCFf-HeVVF5Ox1elT9R1rMcN-@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimkwPS5_6yltbKsCFf-HeVVF5Ox1elT9R1rMcN--JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis

On Thu, Jul 1, 2010 at 11:49 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> On 2010/6/12 Michael Kerrisk wrote:
> [...]
>> --- a/man2/poll.2
>> +++ b/man2/poll.2
> [...]
>> @@ -304,13 +304,15 @@ is Linux-specific.
>> =A0Some implementations define the nonstandard constant
>> =A0.B INFTIM
>> =A0with the value \-1 for use as a
>> -.IR timeout .
>> +.IR timeout
>> +for
>> +.BR poll ()..
>
> Hi Michael,
>
> There is a spurious trailing dot.

Thanks. Fixed now.

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
