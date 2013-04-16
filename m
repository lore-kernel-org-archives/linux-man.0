From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Help request for clone(2) man page
Date: Tue, 16 Apr 2013 08:00:40 +0200
Message-ID: <CAKgNAkj0iKJuwk6moKYqzh_VRLfSQ=9pS6prt=BpXrk5mz=50w@mail.gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ftp.linux.org.uk>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, Peter Schiffer <pschiffe@redhat.com>, Mike Frysinger <vapier@gentoo.org>, Michael Kerrisk <mtk.manpages@gmail.com>
List-Id: linux-man@vger.kernel.org

Al,

I see that you did some consolidating work for clone() in Linux 3.8,
and for that reason I suspect you know the answer to the questions
below. Could you take a short moment to look at the questions?

The relevant pieces of the clone(2) man page are quoted below. There
is some ancient text there that talks about the "struct pt_regs *regs"
argument. In 3.8, I see that you made changes that make mention of
that argument (even more?) obsolete, replacing it with 'tls_val'. In
any case, the page never actually explained the purpose of the
argument, and I do not know the past or present details.

Would you be able to help with the following:
* Provide a short explanation of the purpose of the 'tls_val' argument.
* Was the mention of "struct pt_regs *regs" already long obsolete, or
did it only become obsolete in 3.8? (I suspect the former.) In any
case, (if it makes sense to do so)would you be able to make some short
explanation of that argument, and also some statement about when it
became obsolete? (This is relevant, because man pages tries not to
document just current behavior but also the details in past kernel
versions.)

I'll try to work in whatever text you give me as part of the man page.

Thanks,

Michael



NAME
       clone, __clone2 - create a child process

SYNOPSIS
       /* Prototype for the glibc wrapper function */

       #include <sched.h>

       int clone(int (*fn)(void *), void *child_stack,
                 int flags, void *arg, ...
                 /* pid_t *ptid, struct user_desc *tls, pid_t *ctid */ =
);

       /* Prototype for the raw system call */

       long clone(unsigned long flags, void *child_stack,
                 void *ptid, void *ctid,
                 struct pt_regs *regs);
DESCRIPTION
       clone() creates a new process, in a manner similar to fork(2).

       This page describes both the glibc clone()  wrapper  function  a=
nd
       the  underlying  system  call on which it is based.  The main te=
xt
       describes the wrapper function; the differences for the raw syst=
em
       call are described toward the end of this page.

 [...]
   The raw system call interface
       The raw clone() system call corresponds more closely to fork(2) =
in
       that execution in the child continues from the point of the  cal=
l.
       As  such, the fn and arg arguments of the clone() wrapper functi=
on
       are omitted.  Furthermore, the argument order  changes.   The  r=
aw
       system  call  interface  on  x86  and  many other architectures =
is
       roughly:

           long clone(unsigned long flags, void *child_stack,
                      void *ptid, void *ctid,
                      struct pt_regs *regs);

       Another difference for the raw system call is that the child_sta=
ck
       argument may be zero, in which case copy-on-write semantics ensu=
re
       that the child gets separate copies of  stack  pages  when  eith=
er
       process  modifies the stack.  In this case, for correct operatio=
n,
       the CLONE_VM option should not be specified.

       For some architectures, the order of the arguments for the  syst=
em
       call  differs  from  that  shown above.  On the score, microblaz=
e,
       ARM, ARM 64, PA-RISC, arc, Power PC, xtensa,  and  MIPS  archite=
c=E2=80=90
       tures,  the  order  of the fourth and fifth arguments is reverse=
d.
       On the cris and s390 architectures, the order  of  the  first  a=
nd
       second arguments is reversed.

   clone2()
       On ia64, a different interface is used:

       int __clone2(int (*fn)(void *),
                    void *child_stack_base, size_t stack_size,
                    int flags, void *arg, ...
                 /* pid_t *ptid, struct user_desc *tls, pid_t *ctid */ =
);

       The  prototype  shown above is for the glibc wrapper function; t=
he
       raw system call interface has no fn or arg argument,  and  chang=
es
       the  order  of  the arguments so that flags is the first argumen=
t,
       and tls is the last argument.

       __clone2() operates in  the  same  way  as  clone(),  except  th=
at
       child_stack_base points to the lowest address of the child's sta=
ck
       area, and stack_size specifies the size of the stack pointed to =
by
       child_stack_base.
