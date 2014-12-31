From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 23:43:35 -0200
Message-ID: <orfvbwegqg.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141230230529.GT4574-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org> (Rich Felker's
	message of "Tue, 30 Dec 2014 18:05:29 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Dec 30, 2014, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org> wrote:

> On Tue, Dec 30, 2014 at 08:55:11PM -0200, Alexandre Oliva wrote:

>> I suppose there might be scenarios in which a function doesn't qualify
>> for AS-Safe because it doesn't support async recursion, but it could
>> still be reentered by means of (indirect?) recursion safely.

I guess I got too carried away on this bit, but there are various other
uncertainties as to the meaning of Reentrant, and current POSIX doesn't
provide us with any definition AFAICT.  Earlier versions defined
Reentrant Function as "A function whose effect, when called by two or
more threads, is guaranteed to be as if the threads each executed the
function one after another in an undefined order, even if the actual
execution is interleaved."  This is a stronger requirement than
MT-Safety, and it is completely unrelated to AS-Safety and
Recursion-Safety, so I guess that's not what Carlos meant.

After some more research to try and find some alternate but consensual
definition compatible with what Carlos wrote, but instead of consensus I
found various meanings that are similar but different in various ways,
sometimes minor, sometimes huge.

For example, I found definitions of reentrant that apply only to
single-threaded programs, with variants as to whether it equates to
recursion-safety or it must tolerate asynchronous interrupts also.

A pretty common (if misinformed IMHO) one equates reentrancy with
thread-safety; others state the concepts are related, but neither one
implies the other.  I find this a bit disturbing, for I don't see how a
function that cannot be safely reentered in a separate thread (while
already running on one thread) could qualify as reentrant.

Likewise, I don see how a funciton that cannot be safely reentered in
the same thread, both within a signal and by means of (possibly
indirect) recursion, could qualify as reentrant.


The most natural (to me) definition is that the function is safe to call
even if it is already running, upstack on the same thread, or on other
threads.  This implies both AS-Safety (upstack of a signal handler) and
MT-Safety (no problem with other threads), and this is enough AFAICT to
make it recursive-safe as well.

Under this understanding, that Reentrant implies MT- and AS-Safe, these
are both necessary conditions for Reentrancy under my understanding of
the term.  But are MT- and AS-Safety, taken together, both necessary and
sufficient conditions for Reentrancy?  Or are there other necessary
conditions, on top of MT- and AS-Safe?  (I believe AS-Safe implies
Recursive-Safe, but if it doesn't, it would be an additional
requirement)

Or are these questions meaningless because this definition is not the
one we want to use for Reentrancy?


>> Can you think of any that is AS-Safe, MT-Unsafe and Reentrant?

> Anything written without memory barriers but that has proper compiler
> barriers for AS-safety/reentrancy.

>> Can you think of any that is AS-Unsafe, MT-Unsafe and Reentrant?

> Anything written without memory or compiler barriers but that uses
> global state in a reentrant way.

Clearly you're using a different definition of Reentrancy.
Unfortunately you have not provided a definition, and I can't derive one
from your statements above to as much as tell what they mean, since
"reentrancy" and "reentrant way" both refer back to the unknown-to-me
definition.


>> Can you think of any that is non-Reentrant but that is MT-Safe or
>> AS-Safe?

> Non-reentrant but MT-safe: anything with non-recursive locks.

*nod*.  Non-recursive locks are AS-Unsafe, thus (?) Reentrant-Unsafe.

> Non-reentrant but AS-safe: anything that achieves AS-safety by
> blocking signals for the duration of the operation or any operation
> that accesses the same data.

Ok, so it looks like blocking signals for AS-Safety and taking recursive
locks for MT-Safety still a non-Reentrant function could make, if the
function is not a leaf, and functions it calls could possibly call it
back.  Now, how could any such arising problems, that render such a
function Recursion-Unsafe, not make it also AS-Unsafe or MT-Unsafe?

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
