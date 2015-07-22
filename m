From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Edited draft of bpf(2) man page for review/enhancement
Date: Wed, 22 Jul 2015 16:49:30 +0200
Message-ID: <55AFAD7A.6090009@gmail.com>
References: <556583B4.4000607@gmail.com> <55658DB4.6000106@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55658DB4.6000106-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Daniel,

Sorry for the long delay in following up....

On 05/27/2015 11:26 AM, Daniel Borkmann wrote:
> On 05/27/2015 10:43 AM, Michael Kerrisk (man-pages) wrote:
>> Hello Alexei,
>>
>> I took the draft 3 of the bpf(2) man page that you sent back in March
>> and did some substantial editing to clarify the language and add a
>> few technical details. Could you please check the revised  version
>> below, to ensure I did not inject any errors.
>>
>> I also added a number of FIXMEs for pieces of the page that need
>> further work. Could you take a look at these and let me know your
>> thoughts, please.
> 
> That's great, thanks! Minor comments:
> 
> ...
>> .TH BPF 2 2015-03-10 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> bpf - perform a command on an extended BPF map or program
>> .SH SYNOPSIS
>> .nf
>> .B #include <linux/bpf.h>
>> .sp
>> .BI "int bpf(int cmd, union bpf_attr *attr, unsigned int size);
>>
>> .SH DESCRIPTION
>> The
>> .BR bpf ()
>> system call performs a range of operations related to extended
>> Berkeley Packet Filters.
>> Extended BPF (or eBPF) is similar to
>> the original BPF (or classic BPF) used to filter network packets.
>> For both BPF and eBPF programs,
>> the kernel statically analyzes the programs before loading them,
>> in order to ensure that they cannot harm the running system.
>> .P
>> eBPF extends classic BPF in multiple ways including the ability to call
>> in-kernel helper functions (via the
>> .B BPF_CALL
>> opcode extension provided by eBPF)
>> and access shared data structures such as BPF maps.
> 
> I would perhaps emphasize that maps can be shared among in-kernel
> eBPF programs, but also between kernel and user space.

This is covered later in the page, under the "BPF maps" subheading.
Maybe you missed that? (Or did you think it doesn't suffice?)

>> The programs can be written in a restricted C that is compiled into
>> .\" FIXME In the next line, what is "a restricted C"? Where does
>> .\"       one get further information about it?
> 
> So far only from the kernel samples directory and for tc classifier
> and action, from the tc man page and/or examples/bpf/ in the tc git
> tree.

So, given that we are several weeks down the track, and things may have
changed, I'll re-ask the questions ;-) :

* Is this restricted C documented anywhere?
* Is the procedure for compiling this restricted C documented anywhere?
  (Yes, it's LLVM, but are the suitable pipelines/options documented
  somewhere?)

>> eBPF bytecode and executed on the in-kernel virtual machine or
>> just-in-time compiled into native code.
>> .SS Extended BPF Design/Architecture
>> .P
>> .\" FIXME In the following line, what does "different data types" mean?
>> .\"       Are the values in a map not just blobs?
> 
> Sort of, currently, these blobs can have different sizes of keys
> and values (you can even have structs as keys). For the map itself
> they are treated as blob internally. However, recently, bpf tail call
> got added where you can lookup another program from an array map and
> call into it. Here, that particular type of map can only have entries
> of type of eBPF program fd. I think, if needed, adding a paragraph to
> the tail call could be done as follow-up after we have an initial man
> page in the tree included.

Okay -- I've added a FIXME placeholder for this, so we can revisit.

>> BPF maps are a generic data structure for storage of different data types.
>> A user process can create multiple maps (with key/value-pairs being
>> opaque bytes of data) and access them via file descriptors.
>> BPF programs can access maps from inside the kernel in parallel.
>> It's up to the user process and BPF program to decide what they store
>> inside maps.
>> .P
>> BPF programs are similar to kernel modules.
>> They are loaded by the user
>> process and automatically unloaded when the process exits.
> 
> Generally that's true. Btw, in 4.1 kernel, tc(8) also got support for
> eBPF classifier and actions, and here it's slightly different: in tc,
> we load the programs, maps etc, and push down the eBPF program fd in
> order to let the kernel hold reference on the program itself.
> 
> Thus, there, the program fd that the application owns is gone when the
> application terminates, but the eBPF program itself still lives on
> inside the kernel. But perhaps it's already too much detail to mention
> here ...

Well, it should be documented somewhere....

>> Each BPF program is a set of instructions that is safe to run until
>> its completion.
>> The in-kernel BPF verifier statically determines that the program
>> terminates and is safe to execute.
>> .\" FIXME In the following sentence, what does "takes hold" mean?
> 
> Takes a reference. Meaning, that maps cannot disappear under us while
> the eBPF program that is using them in the kernel is still alive.

So, I changed this to:

[[
During verification, the kernel increments reference counts for each of
the maps that the eBPF program uses,
so that the selected maps cannot be removed until the program is unloaded.
]]

Okay?

>> During verification, the program takes hold of maps that it intends to use,
>> so selected maps cannot be removed until the program is unloaded.
>>
>> BPF programs can be attached to different events.
>> .\" FIXME: In the next sentence , "packets" are not "events". What
>> .\" do you really mean to say here? ("the arrival of a network packet"?)
> 
> Socket filters is meant here: setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, ...);

Okay.

>> These events can be packets, tracing
>> events, and other types that may be added in the future.
> 
> There's already one more type worth mentioning: tc classifier and actions
> (tc/tc_bpf.{c,h}).

Yup. Added.

>> A new event triggers execution of the BPF program, which
>> may store information about the event in the maps.
>> Beyond storing data, BPF programs may call into in-kernel helper functions.
> 
> I would mention that these in-kernel helpers are a fixed set of functions
> provided by the kernel (linux/bpf.h: BPF_FUNC_*), so you cannot call into
> arbitrary ones.

Yes, that helps understanding quite a bit! Changed.

>> The same program can be attached to multiple events and different programs can
>> access the same map:
>> .\" FIXME Can maps be shared between processes? (E.g., what happens
>> .\"       when fork() is called?)
> 
> Yes, they can. Map file descriptors can also be transferred via socket
> passing (SCM_RIGHTS). tc is doing that, i.e. since tc terminates itself
> after configuring the kernel, it can pass the map fds via Unix domain
> socket to an BPF agent that will be the new owner. That can f.e. be a
> shell, so this is very well possible.

Okay -- this is now mentioned in the page.


I'll send out a new draft soon, but in the meantime hopefully you
or Alexei might have a chance to answer some open questions (see my 
other mail to Alexei, which will be sent soon), so I can further edit 
the page before sending it out.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
