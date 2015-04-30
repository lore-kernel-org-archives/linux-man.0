From: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Subject: Re: Re: stat(2)
Date: Thu, 30 Apr 2015 23:21:22 +0100
Message-ID: <CAGc9Evd4+KvZXCgmqiJTcDWRoN_=pJ7soY7iv=Sbb7_=NbLuzw@mail.gmail.com>
References: <5528B95F.7010008@gmail.com>
	<55302846.5020506@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55302846.5020506-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> Hello Jonny,
>
> On 04/02/2015 06:59 PM, Jonny Grant wrote:
> > Hello
> >
> > I see:
> > http://man7.org/linux/man-pages/man3/lseek64.3.html
> > Grammar feedback, "the glibc", prefix word "the" is not needed.
>
> Fixed. Thanks.
>
> > http://man7.org/linux/man-pages/man2/fstat64.2.html
> > Has page heading stat(2),
>
> The doc for stat/fstat/lstat is combined into a single page...
>
> > and does not contain any information about fstat64()
> > Any ideas?
>
> See below.
>
> > I saw this one looks as expected:
> > http://man7.org/linux/man-pages/man3/lseek64.3.html
>
> Actually, that page is a bit of an aberration that appeared
> before my time as maintainer.
>
> > I saw this page has similar problem:
> > http://man7.org/linux/man-pages/man2/stat64.2.html
> >
> > No mention of stat64()
>
> That's not precisely true. See the "C library/kernel ABI differences" at
> http://man7.org/linux/man-pages/man2/stat.2.html#NOTES. Note also
> the sentence "Similar remarks apply for fstat() and lstat()."

Ok I understand now. There is no need for a stat64() public
implementation because off_t is 8 bytes, even on 32bit systems.

Many thanks for making the clarifications and updates.
Regards, Jonny
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
