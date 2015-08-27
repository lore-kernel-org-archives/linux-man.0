From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Seccomp questions for updates to seccomp(2) man page
Date: Wed, 26 Aug 2015 18:42:54 -0700
Message-ID: <CAKgNAkj8Yboqeq4nB+DbM2K76w3eiwnaUVCoSRzv=r-YGHy5uQ@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Will Drewry <wad@chromium.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, Daniel Borkmann <daniel@iogearbox.net>
List-Id: linux-man@vger.kernel.org

Hello Kees, Will,

In recent times I've been asked a couple of questions about seccomp(),
and it seems like it would be worthwhile to include these topics in
the seccomp(2) man page. Would you be able to help out with some
answers?

=== Use of the instruction pointer in seccomp filters ===

The seccomp_data describing the system call includes the process's
instruction pointer value. What use can be made of this information?

My best guess is that you can use this information in conjunction with
/proc/PID/maps to introspect the process layout and thus construct
filters that conditionally operate based on which DSO is performing a
system call. Is that a reasonable use case? Are there others?

=== Chained seccomp filters and SECCOMP_RET_KILL ===

The man page describes the behavior when multiple filter are installed

       If  multiple  filters  exist, they are all executed, in reverse
       order of their addition to the  filter  tree  (i.e.,  the  most
       recently installed filter is executed first).  The return value
       for the evaluation of a given system  call  is  the  first-seen
       SECCOMP_RET_ACTION  value of highest precedence (along with its
       accompanying data) returned by execution of all of the filters.

The question is: suppose one of the early filters returns
SECCOMP_RET_KILL (which is the highest priority action), what is the
purpose of executing the remaining filters. My best guess is that this
about preventing the user from discovering which filter rule causes
the sandboxed program to fail. Is this correct, or is there another
reason?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
