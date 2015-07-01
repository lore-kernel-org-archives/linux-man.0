From: Florian Weimer <fweimer@redhat.com>
Subject: Re: What *is* the API for sched_getaffinity? Should sched_getaffinity
 always succeed when using cpu_set_t?
Date: Wed, 01 Jul 2015 14:37:40 +0200
Message-ID: <5593DF14.2060804@redhat.com>
References: <51E42BFE.7000301@redhat.com> <51E4A0BB.2070802@gmail.com> <51E4A123.9070001@gmail.com> <51E6F3ED.8000502@redhat.com> <51E6F956.5050902@gmail.com> <51E714DE.6060802@redhat.com> <CAHGf_=oZW3kNA3V-9u+BZNs3tL3JKCsO2a0Q6f0iJzo=N4Wb8w@mail.gmail.com> <51E7B205.3060905@redhat.com> <20130722214335.D9AFF2C06F@topped-with-meat.com> <51EDB378.8070301@redhat.com> <558D6171.1060901@gmail.com> <558DB0A0.2040707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-60537-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <558DB0A0.2040707@gmail.com>
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Carlos O'Donell <carlos@redhat.com>, Roland McGrath <roland@hack.frob.com>
Cc: KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 06/26/2015 10:05 PM, Michael Kerrisk (man-pages) wrote:

> +.SS Handling systems with more than 1024 CPUs
> +The
> +.I cpu_set_t
> +data type used by glibc has a fixed size of 128 bytes,
> +meaning that the maximum CPU number that can be represented is 1023.
> +.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=15630
> +.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html
> +If the system has more than 1024 CPUs, then calls of the form:
> +
> +    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
> +
> +will fail with the error
> +.BR EINVAL ,
> +the error produced by the underlying system call for the case where the
> +.I mask
> +size specified in
> +.I cpusetsize
> +is smaller than the size of the affinity mask used by the kernel.

I think it is best to leave this as unspecified as possible.  Kernel
behavior already changed once, and I can imagine it changing again.

Carlos and I tried to get clarification of the future direction of the
kernel interface here:

  <https://sourceware.org/ml/libc-alpha/2015-06/msg00210.html>

No reply so far, unless I missed something.

> +.PP
> +The underlying system calls (which represent CPU masks as bit masks of type
> +.IR "unsigned long\ *" )
> +impose no restriction on the size of the mask.
> +To handle systems with more than 1024 CPUs, one must dynamically allocate the
> +.I mask
> +argument using
> +.BR CPU_ALLOC (3)
> +and manipulate the mask using the "_S" macros described in
> +.BR CPU_ALLOC (3).
> +Using an allocation based on the number of online CPUs:
> +
> +    cpu_set_t *mask = CPU_ALLOC(CPU_ALLOC_SIZE(
> +                                sysconf(_SC_NPROCESSORS_CONF)));

I believe this is incorrect in several ways:

CPU_ALLOC uses the raw CPU counts.  CPU_ALLOC_SIZE converts from the raw
count to the size in bytes.  (This API is misdesigned.)

sysconf(_SC_NPROCESSORS_CONF) is not related to the kernel CPU mask
size, so it is not the correct value.

> +is probably sufficient, although the value returned by the
> +.BR sysconf ()
> +call can in theory change during the lifetime of the process.
> +Alternatively, one can obtain a value that is guaranteed to be stable for
> +the lifetime of the process by proby for the size of the required mask using
> +.BR sched_getaffinity ()
> +calls with increasing mask sizes until the call does not fail with the error

This is the only possible way right now if you do not want to read
sysconf values.

It's also worth noting that the system call and the glibc function have
different return values.

-- 
Florian Weimer / Red Hat Product Security
