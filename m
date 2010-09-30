From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19332] New: remove editorializing from malloc man page
Date: Thu, 30 Sep 2010 00:52:23 GMT
Message-ID: <bug-19332-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D19332

           Summary: remove editorializing from malloc man page
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No


The man page for malloc in release 3.23 of man-pages has this paragraph=
 in a
section titled "BUGS":

--=20

By default, Linux follows an  optimistic  memory  allocation  strategy.
This  means  that  when malloc() returns non-NULL there is no guarantee
that the memory really is available.  This is a  really  bad  bug.   In
case  it  turns  out that the system is out of memory, one or more pro=E2=
=80=90
cesses will be killed by the infamous OOM killer.   In  case  Linux  is
employed  under  circumstances where it would be less desirable to sud=E2=
=80=90
denly lose some randomly picked processes, and moreover the kernel ver=E2=
=80=90
sion  is  sufficiently  recent,  one can switch off this overcommitting
behavior using a command like:

# echo 2 > /proc/sys/vm/overcommit_memory

See also  the  kernel  Documentation  directory,  files  vm/overcommit-
accounting and sysctl/vm.txt.

--

This paragraph has a polemical tone overall.  Rather than explain the i=
ssues,
the paragraph simply advocates a position against overcommit.  Note in
particular the following issues:

1.  "This is a really bad bug." -- Overcommit may be a bug in the sense=
 of
nonconformance to a standard, but it is not made clear exactly which st=
andard.=20
Clearly it is not a bug in the sense of unintentional behavior.  Whethe=
r or not
overcommit is "really bad" depends on facts which the paragraph does no=
t
present.

2.  "...the infamous OOM killer." -- The word "infamous" here serves on=
ly as
advocacy, and does not help developers understand the issues involved.

3.  "...less desirable to suddenly lose some randomly picked processes"=
 -- It
is not true that the OOM killer selects processes randomly.

4.  "one can switch off this overcommitting behavior using a command...=
" -- You
need to know about more than just overcommit_memory if you want to prec=
isely
control overcommit.  You also need to know about the overcommit ratio, =
as well
as panic_on_oom.  The manual for malloc is not the right place for a pr=
oper
treatment of tuning kernel memory management.

I do not wish to engage in a flamewar over overcommit. I am only trying=
 to
improve the documentation, which better serves developers when it stick=
s to the
facts.  I suggest changing the content to the following:

--

By default, Linux follows an optimistic memory allocation strategy whic=
h can
overcommit the available memory.  The overcommit strategy maximizes the=
 use of
available memory, with the tradeoff that when malloc() returns non-NULL=
 there
is no guarantee the memory really is available. In case it turns out th=
at the
system is out of memory, one or more processes will be killed by the OO=
M
killer. The overcommit behavior is configurable, and processes may be p=
rotected
from the OOM killer as needed.  For more information, see the kernel
documentation files vm/overcommit-accounting and sysctl/vm.txt, and the=
 Web
site
http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Deplo=
yment_Guide/s2-proc-pid.html.

--

In the paragraph I claim that "processes may be protected from the OOM =
killer,"
and what I am referring to is oom_adj/oom_score.  However, I looked in =
the
overcommit-accounting and sysctl/vm pages, and didn't see anything abou=
t
oom_adj or oom_score.

It appears there is no documentation about oom_adj, based on the below =
bug
filed against Red Hat.

https://bugzilla.redhat.com/show_bug.cgi?id=3D239313

Red Hat resolved that bug by writing some documentation for their RHEL
distribution. Hence I added a link to Red Hat's documentation at the en=
d of the
paragraph.  I don't know if it is appropriate to link to distribution-s=
pecific
docs in a man page, but I see no other available documentation, and the
information in question seems to be applicable to Linux in general.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
