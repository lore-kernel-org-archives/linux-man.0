From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: clarify the "notfound" status
Date: Thu, 29 Mar 2012 11:32:52 +1300
Message-ID: <CAKgNAkjyBoB+u8mnnE_6cyzLWaFQM1AvQQ_ZtAFaryCOpsNOYQ@mail.gmail.com>
References: <4F735800.6040807@redhat.com> <4F737004.9060500@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F737004.9060500-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Mar 29, 2012 at 9:09 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> On 28/03/2012 19:27, Peter Schiffer wrote:
>>
>> Hello,
>>
>> I am suggesting the following update of the =A0"notfound" status on =
the
>> nsswitch.conf.5 man page. I am not 100% sure that this is the correc=
t place
>> where this information on the man page should be placed. Any comment=
s are
>> welcome.
>>
>
> Hi Peter,
>
> I did a rewrite of the nsswitch.conf man page in October last year:
>
> http://article.gmane.org/gmane.linux.man/2366/match=3Dnsswitch+conf
>
> I'm still waiting for Michael to incorporate these changes. =A0May I =
suggest
> you send in a patch that is applied against this? =A0I would also sug=
gest that
> if you're going to make reference to "initgroups" you'll need to add =
some
> further description somewhere that explains what this is and when you=
 would
> use it.

I'll incorporate Mark's changes soon.

@Peter: you don't need to rebase your patch--I'll do the work needed.
(@Mark: it's a risky path to rebase a patch off another patch that
isn't yet upstreamed; I wouldn't generally advise it.)

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
