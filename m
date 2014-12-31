From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Wed, 31 Dec 2014 11:07:18 -0500
Message-ID: <54A41F36.5010800@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>	<20141230230529.GT4574@brightrain.aerifal.cx>	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com> <orppb0dur7.fsf@livre.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <orppb0dur7.fsf-o1YuAO9g/txBDLzU/O5InQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/31/2014 04:38 AM, Alexandre Oliva wrote:
> On Dec 31, 2014, "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> 
>> That is not the definition of reentrancy that I had in mind.
> 
> Since reentrant is such an overloaded term, how about using the term
> Recursion-Safe, that AFAICT covers only the concept you have in mind.
> Another possible term that occurs to me is Synchronously Reentrant, to
> indicate it doesn't cover asynchronous reentrancy out of signals or
> multiple threads.  We could then shorten it as SR-Safe.

Michael,

Any suggestion for an alternate term?

Alex,
 
In hindsight I see that reetrancy is an overloaded term.
The POSIX standard uses "reentrant by signals" to mean AS-Safe.
Several authors seem to use "reetrant by another thread" 
to mean MT-safe. Thus without some kind of qualifier the term
reentrant seems ambiguous at best.

You suggest "synchronously reentrant", and that might be the
best and most flexible definition. You have to define at what
points the function might be synchronously reentered, much like
synchronous cancellation defines such points. In the case of
glibc internals you can be synchronously reentered only if you
call a function that might directly or indirectly call malloc,
calloc, realloc, or free. AFAIK these are the only functions
that allow users to synchronously interrupt glibc internal
operations and call back into the runtime. Application calls
to core runtime functions may be interposed and in those cases
the interposing function must follow the standard requirements,
but for maximum compatibility may need to adhere to the
preliminary safety notes along with the new SR notes.

Note that synchronously reetrant would still follow the
definition I gave in the previous email. Restated here with
some slight rewording:
~~~~
A function is synchronously reentrant if a thread may safely
call the function before a previous call to the same function
by the same thread completes, but need not be safe if the
second or subsequent calls are made while handling an
asynchronous signal or by another thread.
~~~~

I amended the definition to say "asynchronous signal" since
it is possible for user code to synchronously handle signals
and that such synchronous signal handlers could make effective
use of SR-safe functions since such handlers would be known
not to be asynchronously interrupting any such previous calls
to the SR-safe functions. Similarly synchronous cancellation
handlers should be able to call SR-safe functions?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
