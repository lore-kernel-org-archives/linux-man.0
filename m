From: "Carlos O'Donell" <carlos@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Mon, 05 Jan 2015 10:26:47 -0500
Message-ID: <54AAAD37.1080207@redhat.com>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>	<20141230230529.GT4574@brightrain.aerifal.cx>	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>	<orppb0dur7.fsf@livre.home> <54A41F36.5010800@redhat.com> <or8uhndlfm.fsf@livre.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-55988-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <or8uhndlfm.fsf@livre.home>
To: Alexandre Oliva <aoliva@redhat.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, Rich Felker <dalias@libc.org>, Peng Haitao <penght@cn.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 01/01/2015 02:11 AM, Alexandre Oliva wrote:
> On Dec 31, 2014, "Carlos O'Donell" <carlos@redhat.com> wrote:
> 
>> A function is synchronously reentrant if a thread may safely
>> call the function before a previous call to the same function
>> by the same thread completes, but need not be safe if the
>> second or subsequent calls are made while handling an
>> asynchronous signal or by another thread.
> 
> I'd qualify the asynchronous signal to state that it need not be safe
> only if the signal interrupted asynchronously the execution of the
> previous call, otherwise it would also allow a(n indirectly) recursive
> function, called from the signal handler for the first time, to be
> unsafe when called recursively.

That is true. I considered this in the context of synchronous signal
delivery but couldn't come up with a real way to assure myself that
the signal didn't interrupt foo.

> I.e., stack traces such as:
> 
>   foo
>   bar
>   foo
>   [...]
>   <signal>
>   [...no foo...]
>   main
> 
> should be just as safe as:
> 
>   foo
>   bar
>   foo
>   [...no foo...]
>   main
> 
> but it's ok if foo is unsafe here:
> 
>   foo
>   bar
>   [...]
>   <signal>
>   [...]
>   foo
>   [...]

I agree that this can happen. The question I have is: Is it worth
allowing this if you can't prove that foo wasn't being executed?

I guess you can prove it by assuring that you're only calling AS-safe
functions, of which foo isn't one of them, and if it is, then it's
safe to call anyway.

How would you rewrite the original definition to include this case?

Cheers,
Carlos.
