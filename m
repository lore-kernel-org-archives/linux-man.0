From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: What *is* the API for sched_getaffinity? Should sched_getaffinity
 always succeed when using cpu_set_t?
Date: Fri, 26 Jun 2015 22:05:52 +0200
Message-ID: <558DB0A0.2040707@gmail.com>
References: <51E42BFE.7000301@redhat.com> <51E4A0BB.2070802@gmail.com> <51E4A123.9070001@gmail.com> <51E6F3ED.8000502@redhat.com> <51E6F956.5050902@gmail.com> <51E714DE.6060802@redhat.com> <CAHGf_=oZW3kNA3V-9u+BZNs3tL3JKCsO2a0Q6f0iJzo=N4Wb8w@mail.gmail.com> <51E7B205.3060905@redhat.com> <20130722214335.D9AFF2C06F@topped-with-meat.com> <51EDB378.8070301@redhat.com> <558D6171.1060901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558D6171.1060901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sigh.... I forgot much of what I learned as I wrote the CPU_SET(3) 
page many years ago. Revised patch below.

On 06/26/2015 04:28 PM, Michael Kerrisk (man-pages) wrote:
> Carlos,
> 
> On 07/23/2013 12:34 AM, Carlos O'Donell wrote:
>> On 07/22/2013 05:43 PM, Roland McGrath wrote:
>>>> I can fix the glibc manual. A 'configured' CPU is one that the OS
>>>> can bring online.
>>>
>>> Where do you get this definition, in the absence of a standard that
>>> specifies _SC_NPROCESSORS_CONF?  The only definition I've ever known for
>>> _SC_NPROCESSORS_CONF is a value that's constant for at least the life of
>>> the process (and probably until reboot) that is the upper bound for what
>>> _SC_NPROCESSORS_ONLN might ever report.  If the implementation for Linux is
>>> inconsistent with that definition, then it's just a bug in the implementation.
>>
>> Let me reiterate my understanding such that you can help me clarify
>> exactly my interpretation of the glibc manual wording regarding the
>> two existing constants.
>>
>> The reality of the situation is that the linux kernel as an abstraction
>> presents the following:
>>
>> (a) The number of online cpus.
>>     - Changes dynamically.
>>     - Not constant for the life of the process, but pretty constant.
>>
>> (b) The number of configured cpus.
>>     - The number of detected cpus that the OS could access.
>>     - Some of them may be offline for various reasons.
>>     - Changes dynamically with hotplug.
>>
>> (c) The number of possible CPUs the OS or hardware can support.
>>     - The internal software infrastructure is designed to support at
>>       most this many cpus.
>>     - Constant for the uptime of the system.
>>     - May be tied in some way to the hardware.
>>
>> On Linux, glibc currently maps _SC_NPROCESSORS_CONF to (b) via
>> /sys/devices/system/cpu/cpu*, and _SC_NPROCESSORS_ONLN to (a) via
>> /sys/devices/system/cpu/online.
>>
>> The problem is that sched_getaffinity and sched_setaffinity only cares
>> about (c) since the size of the kernel affinity mask is of size (c).
>>
>> What Motohiro-san was requesting was that the manual should make it clear
>> that _SC_NPROCESSORS_CONF is distinct from (c) which is an OS limit that
>> the user doesn't know.
>>
>> We need not expose (c) as a new _SC_* constant since it's not really
>> required, since glibc's sched_getaffinity and sched_setaffinity could
>> hide the fact that (c) exists from userspace (and that's what I suggest
>> should happen).
>>
>> Does that clarify my statement?
> 
> It's a long time since the last activity in this discussion, and I see that
> https://sourceware.org/bugzilla/show_bug.cgi?id=15630
> remains open, I propose to apply the patch below to the 
> sched_setattr/sched_getattr man page. Seem okay?
> 
> Cheers,
> 
> Michael
> 
> 
> --- a/man2/sched_setaffinity.2
> +++ b/man2/sched_setaffinity.2
> @@ -333,6 +334,57 @@ main(int argc, char *argv[])
>      }
>  }
>  .fi
> +.SH BUGS
> +The glibc
> +.BR sched_setaffinity ()
> +and
> +.BR sched_getaffinity ()
> +wrapper functions do not handle systems with more than 1024 CPUs.
> +.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=15630
> +.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html
> +The
> +.I cpu_set_t
> +data type used by glibc has a fixed size of 128 bytes,
> +meaning that the the maximum CPU number that can be represented is 1023.
> +If the system has more than 1024 CPUs, then:
> +.IP * 3
> +The
> +.BR sched_setaffinity ()
> +.I mask
> +argument is not capable of representing the excess CPUs.
> +.IP *
> +Calls of the form:
> +
> +    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
> +
> +will fail with error
> +.BR EINVAL ,
> +the error produced by the underlying system call for the case where the
> +.I mask
> +size specified in
> +.I cpusetsize
> +is smaller than the size of the affinity mask used by the kernel.
> +.PP
> +The workaround for this problem is to fall back to the use of the
> +underlying system call (via
> +.BR syscall (2)),
> +passing
> +.I mask
> +arguments of a sufficient size.
> +Using a value based on the number of online CPUs:
> +
> +    (sysconf(_SC_NPROCESSORS_CONF) / (sizeof(unsigned long) * 8) + 1)
> +                                   * sizeof(unsigned long)
> +
> +is probably sufficient as the size of the mask,
> +although the value returned by the
> +.BR sysconf ()
> +call can in theory change during the lifetime of the process.
> +Alternatively, one can probe for the size of the required mask using raw
> +.BR sched_getaffinity ()
> +system calls with increasing mask sizes
> +until the call does not fail with the error
> +.BR EINVAL .
>  .SH SEE ALSO
>  .ad l
>  .nh

Okay -- scratch the above. How about the patch below.

Cheers,

Michael

--- a/man2/sched_setaffinity.2
+++ b/man2/sched_setaffinity.2
@@ -223,6 +223,47 @@ system call returns the size (in bytes) of the
 .I cpumask_t
 data type that is used internally by the kernel to
 represent the CPU set bit mask.
+.SS Handling systems with more than 1024 CPUs
+The
+.I cpu_set_t
+data type used by glibc has a fixed size of 128 bytes,
+meaning that the maximum CPU number that can be represented is 1023.
+.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=15630
+.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html
+If the system has more than 1024 CPUs, then calls of the form:
+
+    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
+
+will fail with the error
+.BR EINVAL ,
+the error produced by the underlying system call for the case where the
+.I mask
+size specified in
+.I cpusetsize
+is smaller than the size of the affinity mask used by the kernel.
+.PP
+The underlying system calls (which represent CPU masks as bit masks of type
+.IR "unsigned long\ *" )
+impose no restriction on the size of the mask.
+To handle systems with more than 1024 CPUs, one must dynamically allocate the
+.I mask
+argument using
+.BR CPU_ALLOC (3)
+and manipulate the mask using the "_S" macros described in
+.BR CPU_ALLOC (3).
+Using an allocation based on the number of online CPUs:
+
+    cpu_set_t *mask = CPU_ALLOC(CPU_ALLOC_SIZE(
+                                sysconf(_SC_NPROCESSORS_CONF)));
+
+is probably sufficient, although the value returned by the
+.BR sysconf ()
+call can in theory change during the lifetime of the process.
+Alternatively, one can obtain a value that is guaranteed to be stable for
+the lifetime of the process by proby for the size of the required mask using
+.BR sched_getaffinity ()
+calls with increasing mask sizes until the call does not fail with the error
+.BR EINVAL .
 .SH EXAMPLE
 The program below creates a child process.
 The parent and child then each assign themselves to a specified CPU

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
