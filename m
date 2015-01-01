From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Thu, 01 Jan 2015 05:05:14 -0200
Message-ID: <ord26zdlqt.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>
	<ortx0cdv3c.fsf@livre.home> <54A41595.4010007@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A41595.4010007-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Carlos O'Donell's message of "Wed,
	31 Dec 2014 10:26:13 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Dec 31, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> I did not know malloc was required to be AS-safe for POSIX compliance.

Ugh.  Sorry, my bad, it's not.  malloc's AS-safety goal seems to have
jumped from "desirable" to "mandatory" in my mind :-(

> See: http://pubs.opengroup.org/onlinepubs/009695399/functions/xsh_chap02_04.html
> 2.4.3 Signal Actions.

> The list of functions does not list malloc.

Beware, that's a very old version of POSIX that you referenced above.
What led me to realize it was the use of the term "reentrant" there ;-)

Anyway, the corresponding table in current POSIX fails to list malloc as
AS-Safe just the same ;-)

> My pleasure. A list of examples helps not just you but future readers.

*nod*

Thanks, and happy GNU year to all!

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
