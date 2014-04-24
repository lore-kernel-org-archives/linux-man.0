From: Georgi Naydenov <gnaydenov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages bug- syslog(3) grammar
Date: Fri, 25 Apr 2014 00:02:11 +0300
Message-ID: <53597BD3.5040501@gmail.com>
References: <5357AF43.8080102@gmail.com> <CAKgNAkjGzM-P3Ce1TnBKn0r9xr1W4bjS+S9zCub2=gioWFVQ8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjGzM-P3Ce1TnBKn0r9xr1W4bjS+S9zCub2=gioWFVQ8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


Ah, ok then. Thanks for your reply and sorry for the spam ;)

Best regards,
Georgi


=D0=9D=D0=B0 4/24/2014 8:03 PM, Michael Kerrisk (man-pages) =D0=BD=D0=B0=
=D0=BF=D0=B8=D1=81=D0=B0:
> Hi Georgi!
>
> On Wed, Apr 23, 2014 at 2:17 PM, Georgi Naydenov <gnaydenov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>> Hello Michael,
>> I guess that's your email here. First, thank you for your excellent =
book!
>> (We met at the OpenFest in Sofia, Bulgaria a few years ago and lucki=
ly you
>> had some copies with you. :)
> Yes, I remember.
>
>> About the pages - nothing special but what do you think about the co=
mmas
>> when describing notice message priorty here:
>> http://man7.org/linux/man-pages/man3/syslog.3.html
>> and also in syslog(3) at least on Fedora, CentOS6 and RHEL6/7beta.
>>
>>         LOG_NOTICE     normal, but significant, condition
>>
>> Shouldn't be "significant condition"? For example, as specified in R=
=46C5424
>> (http://tools.ietf.org/html/rfc5424):
>>
>>                        ....
>>                5       Notice: normal but significant condition
>>                6       Informational: informational messages
>>                7       Debug: debug-level messages
>>
>>                Table 2. Syslog Message Severities
> Either form works, so I'll leave as is.
>
> Cheers,
>
> Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
