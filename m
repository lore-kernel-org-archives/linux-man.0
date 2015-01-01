From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Thu, 01 Jan 2015 05:11:57 -0200
Message-ID: <or8uhndlfm.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>
	<orppb0dur7.fsf@livre.home> <54A41F36.5010800@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A41F36.5010800-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> (Carlos O'Donell's message of "Wed,
	31 Dec 2014 11:07:18 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Dec 31, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> A function is synchronously reentrant if a thread may safely
> call the function before a previous call to the same function
> by the same thread completes, but need not be safe if the
> second or subsequent calls are made while handling an
> asynchronous signal or by another thread.

I'd qualify the asynchronous signal to state that it need not be safe
only if the signal interrupted asynchronously the execution of the
previous call, otherwise it would also allow a(n indirectly) recursive
function, called from the signal handler for the first time, to be
unsafe when called recursively.

I.e., stack traces such as:

  foo
  bar
  foo
  [...]
  <signal>
  [...no foo...]
  main

should be just as safe as:

  foo
  bar
  foo
  [...no foo...]
  main

but it's ok if foo is unsafe here:

  foo
  bar
  [...]
  <signal>
  [...]
  foo
  [...]

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
