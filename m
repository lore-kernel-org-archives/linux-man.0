From: Alexandre Oliva <aoliva@redhat.com>
Subject: Re: Adding reentrancy information to safety notes?
Date: Mon, 05 Jan 2015 21:21:17 -0200
Message-ID: <ortx04ddaq.fsf@livre.home>
References: <54A2C8A6.9050100@redhat.com> <ork318eoj4.fsf@livre.home>
	<20141230230529.GT4574@brightrain.aerifal.cx>
	<orfvbwegqg.fsf@livre.home> <54A377B8.60802@redhat.com>
	<orppb0dur7.fsf@livre.home> <54A41F36.5010800@redhat.com>
	<or8uhndlfm.fsf@livre.home> <54AAAD37.1080207@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <libc-alpha-return-56009-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <54AAAD37.1080207@redhat.com> (Carlos O'Donell's message of "Mon,
	05 Jan 2015 10:26:47 -0500")
To: Carlos O'Donell <carlos@redhat.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, Rich Felker <dalias@libc.org>, Peng Haitao <penght@cn.fujitsu.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On Jan  5, 2015, "Carlos O'Donell" <carlos@redhat.com> wrote:

> On 01/01/2015 02:11 AM, Alexandre Oliva wrote:
>> On Dec 31, 2014, "Carlos O'Donell" <carlos@redhat.com> wrote:
>> 
>>> A function is synchronously reentrant if a thread may safely
>>> call the function before a previous call to the same function
>>> by the same thread completes, but need not be safe if the
>>> second or subsequent calls are made while handling an
>>> asynchronous signal or by another thread.
>> 
>> I'd qualify the asynchronous signal to state that it need not be safe
>> only if the signal interrupted asynchronously the execution of the
>> previous call, otherwise it would also allow a(n indirectly) recursive
>> function, called from the signal handler for the first time, to be
>> unsafe when called recursively.

> That is true. I considered this in the context of synchronous signal
> delivery but couldn't come up with a real way to assure myself that
> the signal didn't interrupt foo.

>> but it's ok if foo is unsafe here:
>> 
>> foo
>> bar
>> [...]
>> <signal>
>> [...]
>> foo
>> [...]

> I agree that this can happen. The question I have is: Is it worth
> allowing this if you can't prove that foo wasn't being executed?

Well...  I guess an application that implements a function and sets up a
signal handler that might call it could always arrange for the function
to test some property very early in its execution, and unset just before
the end of its execution, so that the signal handler can tell whether it
is safe to call such an SR-Safe but AS-Unsafe function, or whether it
has to take some other path.


> How would you rewrite the original definition to include this case?

  A function is synchronously reentrant if a thread may safely
  call the function before a previous call to the same function
  by the same thread completes, but need not be safe if the
  second or subsequent calls are made by another thread, or while
  handling an asynchronous signal that interrupts the execution of
  the function.

Here's another somewhat more formal definition, that defines invocations
rather than functions as (a)synchronously reentrant, and defines SR-Safe
as a property equivalent to the definition above:

  An invocation of a function F is a direct part of an execution of a
  function G iff G calls F, or G accepts a synchronous signal whose
  handler is F.  The execution of function G may encompass other direct
  parts that are not function invocations.

  An indirect part of an execution of a function F is any direct part of
  the execution of a function G, whose invocation is in turn a direct or
  indirect part of the execution of F.

  An invocation of a function F is synchronously reentrant iff it is a
  direct or indirect part of another execution of F.

  An invocation of a function F is asynchronously reentrant iff it
  occurs in one thread while another thread carries out a direct or
  indirect part of an execution of F, or in an asynchronous signal
  handler that interrupted any direct or indirect part of another
  execution of F.

  A function F is SR-Safe iff it is safe for any direct or indirect part
  of an execution of F to be a synchronously reentrant invocation of F,
  absent any asynchronously reentrant invocation of F.

-- 
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
Free Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
