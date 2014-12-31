From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 23:12:40 -0500
Message-ID: <54A377B8.60802@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>	<20141230230529.GT4574@brightrain.aerifal.cx> <orfvbwegqg.fsf@livre.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-55923-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <orfvbwegqg.fsf@livre.home>
To: Alexandre Oliva <aoliva@redhat.com>, Rich Felker <dalias@libc.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, Peng Haitao <penght@cn.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 12/30/2014 08:43 PM, Alexandre Oliva wrote:
> On Dec 30, 2014, Rich Felker <dalias@libc.org> wrote:
> 
>> On Tue, Dec 30, 2014 at 08:55:11PM -0200, Alexandre Oliva wrote:
> 
>>> I suppose there might be scenarios in which a function doesn't qualify
>>> for AS-Safe because it doesn't support async recursion, but it could
>>> still be reentered by means of (indirect?) recursion safely.
> 
> I guess I got too carried away on this bit, but there are various other
> uncertainties as to the meaning of Reentrant, and current POSIX doesn't
> provide us with any definition AFAICT.  Earlier versions defined
> Reentrant Function as "A function whose effect, when called by two or
> more threads, is guaranteed to be as if the threads each executed the
> function one after another in an undefined order, even if the actual
> execution is interleaved."  This is a stronger requirement than
> MT-Safety, and it is completely unrelated to AS-Safety and
> Recursion-Safety, so I guess that's not what Carlos meant.

That is not the definition of reentrancy that I had in mind.

[snip]

> Or are these questions meaningless because this definition is not the
> one we want to use for Reentrancy?
 
We already use AS-safe to indicate that a function is safe to reenter
from a signal handler.

We already use MT-safe to indicate that a function is safe to reenter
from another thread.

The only definition of reentrancy I had in mind is that which is derived
from the original definition of single-threaded program reetrancy, with
the exclusion of signals.

The reason I want to use this definition is to more formally describe
those functions which are safe to call from a user provided malloc.
A user provided malloc can be called from almost anywhere in glibc, it
interrupts core glibc code, it only synchronously interrupts core
glibc code (when malloc is called), and limiting a user provided malloc
to AS-safe functions would be punative (though that is what we'll be
doing in the initial documentation pass).

Definition of reentrancy:
=========================
~~~~
A function is reentrant if the one thread may safely call
the function before a previous call to the same function
by the same thread completes, but need not be safe if the
second or subsequent calls are made while handling a signal.
~~~~
Safely implies no data loss.

By definition all AS-safe functions are reetrant.

A reetrant function may be AS-unsafe and MT-unsafe.

A reetrant function may be AS-unsafe and MT-safe.

A reetrant function may be AS-safe (makes it reetrant by definition) and MT-unsafe.

A reetrant function may be AS-safe (") and MT-safe.

Examples:
=========

The function `__as_mt_safe_malloc_r` is a AS-Safe, MT-safe, and
reetrant malloc that falls back to a simple and provably safe
allocator when recursion is detected (thus allowing it to return
some memory after a first recursion).

A reentrant function can be AS-unsafe and MT-unsafe:
~~~
int *t;
 
void swap_r(int *x, int *y)
{
  if (t == NULL)
    t = __as_mt_safe_malloc_r (sizeof(int));
  *t = *x;
  *x = *y;
  *y = *t;
}
~~~
MT-unsafe: Race with multiple writers writing to t.
AS-unsafe: Overwrites global state t.
Reetrant: The function can only be reentered when it calls another
	  function e.g. __as_mt_safe_malloc_r. It is safe to reenter
	  at this point, but will leak sizeof(int) during initialization.

A reetrant function can be AS-unsafe and MT-safe:
~~~
__thread int *t;

void swap_r(int *x, int *y)
{
  if (t == NULL)
    t = __as_mt_safe_malloc_r (sizeof(int));
  *t = *x;
  *x = *y;
  *y = *t;
}
~~~
MT-safe: Uses thread local storage to hold t.
AS-unsafe: Overwrites global state t.
Reentrant: Yes.

A reentrant function can be AS-safe and MT-unsafe:
~~~
int *t;
 
void swap_r(int *x, int *y)
{
  int s;
  s = *t; /* Save global.  */
  if (t == NULL)
    t = __as_mt_safe_malloc_r (sizeof(int));
  *t = *x;
  *x = *y;
  *y = *t;
  *t = s; /* Restore global.  */
}
~~~
MT-unsafe: Race with multiple writers writing to t.
AS-safe: Saves and restores the global state.
	 Note: Assumes the loads and stores are atomic wrt to signals.
	       Just pretend they are without me needing to use C11 atomics.
Reentrant: Yes.

A reentrant function can be AS-safe and MT-safe:
~~~
__thread int *t;

void swap_r(int *x, int *y)
{
  int s;
  s = *t; /* Save global.  */
  if (t == NULL)
    t = __as_mt_safe_malloc_r (sizeof(int));
  *t = *x;
  *x = *y;
  *y = *t;
  *t = s; /* Restore global.  */
}
~~~
MT-safe: Uses thread local storage to hold t.
AS-safe: Saves and restores global state.
Reentrant: Yes.

The examples are toy examples, but it shows that a reetrant
function can be completely orthogonal to MT-safe and AS-safe.

It is much harder to come up with more complex examples that
call other functions, but it should be possible with more work.

Hopefully that clarifies the definition of reentrancy.

Cheers,
Carlos.

Note:
- The wikipedia article on reentrancy has a lot of confused terms.
  https://en.wikipedia.org/wiki/Talk:Reentrancy_%28computing%29
