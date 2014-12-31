From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Wed, 31 Dec 2014 07:31:03 -0200
Message-ID: <ortx0cdv3c.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A377B8.60802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Carlos O'Donell's message of "Tue,
	30 Dec 2014 23:12:40 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Dec 31, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> The reason I want to use this definition is to more formally describe
> those functions which are safe to call from a user provided malloc.
> A user provided malloc can be called from almost anywhere in glibc, it
> interrupts core glibc code, it only synchronously interrupts core
> glibc code (when malloc is called), and limiting a user provided malloc
> to AS-safe functions would be punative (though that is what we'll be
> doing in the initial documentation pass).

Hmm...  Given that making malloc AS-Safe is reuqired POSIX compliance,
what would we gain by enabling malloc implementations to call functions
beyond other AS-Safe functions?  I mean, a malloc implementation cannot
be AS-Safe if it calls AS-Unsafe functions, nor can it be MT-Safe if it
calls MT-Unsafe functions, even if they are Reentrant under the
definition you provided, so...  Wouldn't enabling malloc to call them
making sure we won't ever be able to make malloc AS-Safe, and thus
POSIX-compliant?

> Hopefully that clarifies the definition of reentrancy.

Yes, thanks for all the effort into clarifying what you meant, even
though just the definition would have been enough.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
