From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Mon, 05 Jan 2015 10:05:56 -0500
Message-ID: <54AAA854.70507@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home> <20141230230529.GT4574@brightrain.aerifal.cx> <orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com> <20150101001905.GU4574@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150101001905.GU4574-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/31/2014 07:19 PM, Rich Felker wrote:
> On Tue, Dec 30, 2014 at 11:12:40PM -0500, Carlos O'Donell wrote:
>> That is not the definition of reentrancy that I had in mind.
> 
> Indeed. To me, "reentrancy" means the ability to enter the code again
> while one or more instances of the same function are already running
> in the same thread. In my view this doesn't necessarily include
> asynchronous reentrancy unless explicitly stated, and it doesn't have
> anything to do with the concept of reentrancy in the obsolete POSIX
> 2001 that was removed and replaced with "thread safety" in later
> editions of POSIX.
> 
>> [snip]
>>
>>> Or are these questions meaningless because this definition is not the
>>> one we want to use for Reentrancy?
>>  
>> We already use AS-safe to indicate that a function is safe to reenter
>> from a signal handler.
> 
> AS-safety means more than that. It means that it's safe to use the
> function from a signal handler no matter what function the signal
> handler interrupted, and that it's safe to call any standard function
> from a signal handler that interrupted the AS-safe function. Note that
> the latter part can be vacuously true if AS-safety is achieved by
> blocking signals for the duration of the function.
> 
>> We already use MT-safe to indicate that a function is safe to reenter
>> from another thread.
>>
>> The only definition of reentrancy I had in mind is that which is derived
>> from the original definition of single-threaded program reetrancy, with
>> the exclusion of signals.
> 
> This agrees with my definition.
> 
>> The reason I want to use this definition is to more formally describe
>> those functions which are safe to call from a user provided malloc.
>> A user provided malloc can be called from almost anywhere in glibc, it
>> interrupts core glibc code, it only synchronously interrupts core
>> glibc code (when malloc is called), and limiting a user provided malloc
>> to AS-safe functions would be punative (though that is what we'll be
>> doing in the initial documentation pass).
>>
>> Definition of reentrancy:
>> =========================
>> ~~~~
>> A function is reentrant if the one thread may safely call
>> the function before a previous call to the same function
>> by the same thread completes, but need not be safe if the
>> second or subsequent calls are made while handling a signal.
>> ~~~~
>> Safely implies no data loss.
>>
>> By definition all AS-safe functions are reetrant.
>>
>> A reetrant function may be AS-unsafe and MT-unsafe.
>>
>> A reetrant function may be AS-unsafe and MT-safe.
>>
>> A reetrant function may be AS-safe (makes it reetrant by definition) and MT-unsafe.
> 
> No, AS-safe does not imply reentrant. Consider a function that invokes
> a callback but blocks signals during its execution. It's vacuously
> AS-safe but instead of via a signal handler it can be re-entered via
> the callback, and whether such reentrancy is safe is a non-trivial
> question.

You are correct. Thank you for the contradicting example.

The correction should read:

"A reentrant function may be AS-safe and MT-unsafe."

Thus the safety note is entirely orthogonal to AS and MT safety.

Cheers,
Carlos.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
