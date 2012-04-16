From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH/RFC 0/6] ld.so.8: some improvements from Debian
Date: Tue, 17 Apr 2012 06:07:34 +1200
Message-ID: <CAKgNAkggZ1EZyBkkkd4xmJnjt-_kw=F_xb81+--gpQztvyD8oA@mail.gmail.com>
References: <20111020070037.GA11392@elie.hsd1.il.comcast.net>
 <CAKgNAkgbcL3deJ4x0DEV==vtiAmYie7+Gw+c=K_dAJhWE4va1Q@mail.gmail.com>
 <20120416165806.GR5813@burratino> <CAKgNAkj0BAKbP6SrohCEG+eeEAZAYkJ6NA9Jvi0hS2j3e19mmg@mail.gmail.com>
 <20120416172408.GT5813@burratino>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120416172408.GT5813@burratino>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, Aurelien Jarno <aurelien-rXXEIb44qovR7s880joybQ@public.gmane.org>, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[Correcting my correction to Petr's address]

Hi Jonathan,

On Tue, Apr 17, 2012 at 5:24 AM, Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Michael Kerrisk (man-pages) wrote:
>
>> Could you possibly also rearchitect the patch series please, in the
>> light of the following:
>> * There have been a (very) few changes to upstream ld.so.8, so you'l=
l
>> need to rebase.
>
> Sure, no problem.
>
>> * Please clearly separate out those pieces that simply bridge the ga=
p
>> between upstream ld.so.8 and Debian ld.so.8 and those pieces that ar=
e
>> your own enhancements. (I did correctly understand that there are so=
me
>> of those, right?).
>
> Do I understand correctly that you want first a patch that makes it l=
ook
> just like Debian's ld.so.8, and after that patches that make it more
> palatable? =A0That doesn't seem quite right to me --- for example, it=
 would
> mean first reverting the changes to upstream ld.so.8 and then reapply=
ing
> them again.

IIUC, your purpose is to allow Debian to drop downstream ld.so.8, by
ensuring that upstream ld.so.8 has everything that useful from the
downstream (purpose 1). Along the way, you also saw places where the
upstream page could be further improved with *new* material (purpose
2). Right? What I'm saying is, please keep a good separation between
those two purposes in your patch. Simplest would be a series of
patches that dealt with purpose 1, followed by another series for
purpose 2. Does that make sense?

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
