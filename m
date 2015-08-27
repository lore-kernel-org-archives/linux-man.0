From: Kees Cook <keescook@chromium.org>
Subject: Re: Seccomp questions for updates to seccomp(2) man page
Date: Wed, 26 Aug 2015 21:32:40 -0700
Message-ID: <CAGXu5j+__DYvHE36B3SfRAv6t+CP6WRvoAcVSusUXP_J7zO17w@mail.gmail.com>
References: <CAKgNAkj8Yboqeq4nB+DbM2K76w3eiwnaUVCoSRzv=r-YGHy5uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgNAkj8Yboqeq4nB+DbM2K76w3eiwnaUVCoSRzv=r-YGHy5uQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk-manpages <mtk.manpages@gmail.com>
Cc: Will Drewry <wad@chromium.org>, lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, Daniel Borkmann <daniel@iogearbox.net>
List-Id: linux-man@vger.kernel.org

On Wed, Aug 26, 2015 at 6:42 PM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> Hello Kees, Will,
>
> In recent times I've been asked a couple of questions about seccomp(),
> and it seems like it would be worthwhile to include these topics in
> the seccomp(2) man page. Would you be able to help out with some
> answers?
>
> === Use of the instruction pointer in seccomp filters ===
>
> The seccomp_data describing the system call includes the process's
> instruction pointer value. What use can be made of this information?

Will may have some other history to add here, but it seemed like it
was a handy thing to add, as it's a dynamic value attached to the
execution environment. I'm actually not aware of any programs that
build filters with reference to it.

> My best guess is that you can use this information in conjunction with
> /proc/PID/maps to introspect the process layout and thus construct
> filters that conditionally operate based on which DSO is performing a
> system call. Is that a reasonable use case? Are there others?

That's reasonable. Filters limiting syscalls to certain memory ranges
would likely also want to lock down mmap and mprotect calls, to stop
anything malicious from trying to sneak into the protected range.

> === Chained seccomp filters and SECCOMP_RET_KILL ===
>
> The man page describes the behavior when multiple filter are installed
>
>        If  multiple  filters  exist, they are all executed, in reverse
>        order of their addition to the  filter  tree  (i.e.,  the  most
>        recently installed filter is executed first).  The return value
>        for the evaluation of a given system  call  is  the  first-seen
>        SECCOMP_RET_ACTION  value of highest precedence (along with its
>        accompanying data) returned by execution of all of the filters.
>
> The question is: suppose one of the early filters returns
> SECCOMP_RET_KILL (which is the highest priority action), what is the
> purpose of executing the remaining filters. My best guess is that this
> about preventing the user from discovering which filter rule causes
> the sandboxed program to fail. Is this correct, or is there another
> reason?

It's just because it would be an optimization that would only speed up
the RET_KILL case, but it's the uncommon one and the one that doesn't
benefit meaningfully from such a change (you need to kill the process
really quickly?). We would speed up killing a program at the (albeit
tiny) expense to all other filtered programs. Best to keep the filter
execution logic clear, simple, and as fast as possible for all
filters.

-Kees

-- 
Kees Cook
Chrome OS Security
