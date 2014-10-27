From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: For review: attributes(7) man page
Date: Mon, 27 Oct 2014 14:09:07 +0800
Message-ID: <544DE183.70306@cn.fujitsu.com>
References: <5444A1D8.2060908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5444A1D8.2060908-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 10/20/2014 01:47 PM, Michael Kerrisk (man-pages) wrote:
> .TP
> .I env
> Functions marked with
> .I env
> as an MT-Safety issue access the
> environment with
> .BR getenv (3)
> or similar, without any guards to ensure
> safety in the presence of concurrent modifications.
> 
> We do not mark these functions as MT-Unsafe \" or AS-Unsafe,

Should add ',' before ' \"'.

> however,
> because functions that modify the environment are all marked with
> .I const:env
> and regarded as unsafe.
> Being unsafe, the latter are not to be called when multiple threads
> are running or asynchronous signals are enabled,
> and so the environment can be considered
> effectively constant in these contexts,
> which makes the former safe.
> .TP
> .I hostid
> The function marked with
> .I hostid
> as an MT-Safety issue reads from the system-wide data structures that
> hold the "host ID" of the machine.
> These data structures cannot generally be modified atomically.
> Since it is expected that the "host ID" will not normally change,
> the function that reads from it
> .RB ( gethostid (3))
> is regarded as safe,
> whereas the function that modifies it
> .RB ( sethostid (3))
> is marked with
> .IR const:hostid ,
> indicating it may require special care if it is to be called.
> In this specific case,
> the special care amounts to system-wide
> (not merely intra-process) coordination.
> .TP
> .I sigintr
> Functions marked with
> .I sigintr
> as an MT-Safety issue access the
> GNU C Library
> .I _sigintr
> internal data structure without any guards to ensure
> safety in the presence of concurrent modifications.
> 
> We do not mark these functions as MT-Unsafe \" or AS-Unsafe,

Should add ',' before ' \"'.

> however,
> because functions that modify the this data structure are all marked with

Should delete 'this '.

> .I const:sigintr
> and regarded as unsafe.
> Being unsafe,
> the latter are not to be called when multiple threads are
> running or asynchronous signals are enabled,
> and so the data structure can be considered
> effectively constant in these contexts,
> which makes the former safe.
> .\" .TP
> .\" .I fd
> .\" Functions annotated with
> .\" .I fd
> .\" as an AC-Safety issue may leak file
> .\" descriptors if asynchronous thread cancellation interrupts their
> .\" execution.
> .\" 
> .\" Functions that allocate or deallocate file descriptors will generally be
> .\" marked as such.
> .\" Even if they attempted to protect the file descriptor
> .\" allocation and deallocation with cleanup regions,
> .\" allocating a new descriptor and storing its number where the cleanup region
> .\" could release it cannot be performed as a single atomic operation.
> .\" Similarly,
> .\" releasing the descriptor and taking it out of the data structure
> .\" normally responsible for releasing it cannot be performed atomically.
> .\" There will always be a window in which the descriptor cannot be released
> .\" because it was not stored in the cleanup handler argument yet,
> .\" or it was already taken out before releasing it.
> .\" .\" It cannot be taken out after release:
> .\" an open descriptor could mean either that the descriptor still
> .\" has to be closed,
> .\" or that it already did so but the descriptor was
> .\" reallocated by another thread or signal handler.
> .\" 
> .\" Such leaks could be internally avoided, with some performance penalty,
> .\" by temporarily disabling asynchronous thread cancellation.
> .\" However,
> .\" since callers of allocation or deallocation functions would have to do
> .\" this themselves, to avoid the same sort of leak in their own layer,
> .\" it makes more sense for the library to assume they are taking care of it
> .\" than to impose a performance penalty that is redundant when the problem
> .\" is solved in upper layers, and insufficient when it is not.
> .\" 
> .\" This remark by itself does not cause a function to be regarded as
> .\" AC-Unsafe.
> .\" However, cumulative effects of such leaks may pose a
> .\" problem for some programs.
> .\" If this is the case,
> .\" suspending asynchronous cancellation for the duration of calls
> .\" to such functions is recommended.
> .\" .TP
> .\" .I mem
> .\" Functions annotated with
> .\" .I mem
> .\" as an AC-Safety issue may leak
> .\" memory if asynchronous thread cancellation interrupts their execution.
> .\" 
> .\" The problem is similar to that of file descriptors: there is no atomic
> .\" interface to allocate memory and store its address in the argument to a
> .\" cleanup handler,
> .\" or to release it and remove its address from that argument,
> .\" without at least temporarily disabling asynchronous cancellation,
> .\" which these functions do not do.
> .\" 
> .\" This remark does not by itself cause a function to be regarded as
> .\" generally AC-Unsafe.
> .\" However, cumulative effects of such leaks may be
> .\" severe enough for some programs that disabling asynchronous cancellation
> .\" for the duration of calls to such functions may be required.
> .TP
> .I cwd
> Functions marked with
> .I cwd
> as an MT-Safety issue may temporarily
> change the current working directory during their execution,
> which may cause relative pathnames to be resolved in unexpected ways in
> other threads or within asynchronous signal or cancellation handlers.
> 
> This is not enough of a reason to mark so-marked functions as MT-Unsafe

Should add ','.

> \" or AS-Unsafe,

Should use '.\"'

> but when this behavior is optional (e.g.,
> .BR nftw (3)
> with
> .BR FTW_CHDIR ),
> avoiding the option may be a good alternative to
> using full pathnames or file descriptor-relative (e.g.,
> .BR openat (2))
> system calls.
> .\" .TP
> .\" .I !posix
> .\" This remark, as an MT-Safety, AS-Safety or AC-Safety
> .\" note to a function,
> .\" indicates the safety status of the function is known to differ
> .\" from the specified status in the POSIX standard.
> .\" For example, POSIX does not require a function to be Safe,
> .\" but our implementation is, or vice-versa.
> .\" 
> .\" For the time being, the absence of this remark does not imply the safety
> .\" properties we documented are identical to those mandated by POSIX for
> .\" the corresponding functions.
> .TP
> .I :identifier
> Annotations may sometimes be followed by identifiers,
> intended to group several functions that, for example,
> access the data structures in an unsafe way, as in
> .I race
> and
> .IR const ,
> or to provide more specific information,
> such as naming a signal in a function marked with
> .IR sig .
> It is envisioned that it may be applied to
> .I lock
> and
> .I corrupt
> as well in the future.
> 
> In most cases, the identifier will name a set of functions,
> but it may name global objects or function arguments,
> or identifiable properties or logical components associated with them,
> with a notation such as, for example,
> .I :buf(arg)
> to denote a buffer associated with the argument
> .IR arg ,
> or
> .I :tcattr(fd)
> to denote the terminal attributes of a file descriptor
> .IR fd .
> 
> The most common use for identifiers is to provide logical groups of
> functions and arguments that need to be protected by the same
> synchronization primitive in order to ensure safe operation in a given
> context.
> .TP
> .I /condition
> Some safety annotations may be conditional,
> in that they only apply if a boolean expression involving arguments,
> global variables or even the underlying kernel evaluates evaluates to true.
> .\" Such conditions as
> .\" .I /hurd
> .\" or
> .\" .I /!linux!bsd
> .\" indicate the preceding marker only
> .\" applies when the underlying kernel is the HURD,
> .\" or when it is neither Linux nor a BSD kernel, respectively.
> For example,
> .I !ps

Should be '/!ps'.


-- 
Best Regards,
Peng

> and
> .I /one_per_line
> indicate the preceding marker only applies when argument
> .I ps
> is NULL, or global variable
> .I one_per_line
> is nonzero.
> 
> When all marks that render a function unsafe are
> adorned with such conditions,
> and none of the named conditions hold,
> then the function can be regarded as safe.
> .SH SEE ALSO
> .BR pthreads (7)
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
