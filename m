From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 98851] New: the man page tc-filters is missing
Date: Mon, 25 May 2015 03:41:02 +0000
Message-ID: <bug-98851-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D98851

            Bug ID: 98851
           Summary: the man page tc-filters is missing
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: cyp2010-9Onoh4P/yGk@public.gmane.org
        Regression: No

I want to see more infomation about tc-filters, but it seems that it is=
 missing
in man-pages.

linux:/usr/share/man/man8 # man tc-filters
No manual entry for tc-filters
linux:/usr/share/man/man8 #

tc-filters is mentioned in man page TC.

linux:/usr/share/man/man8 # man tc
Reformatting tc(8), please wait...
       s, sec or secs
              Whole seconds

       ms, msec or msecs
              Milliseconds

       us, usec, usecs or a bare number
              Microseconds.


TC COMMANDS
       The following commands are available for qdiscs, classes and fil=
ter:

       add    Add a qdisc, class or filter to a node. For all entities,=
 a
parent must be passed, either by passing its ID or by attaching directl=
y to=20
the
              root  of  a device.  When creating a qdisc or a filter, i=
t can be
named with the handle parameter. A class is named with the classid para=
me=E2=80=90
              ter.


       remove A qdisc can be removed by specifying its handle, which ma=
y also
be 'root'. All subclasses and their leaf qdiscs are  automatically  del=
eted,
              as well as any filters attached to them.


       change Some  entities  can be modified 'in place'. Shares the sy=
ntax of
'add', with the exception that the handle cannot be changed and neither=
 can
              the parent. In other words, change cannot move a node.


       replace
              Performs a nearly atomic remove/add on an existing node i=
d. If
the node does not exist yet it is created.


       link   Only available for qdiscs and performs a replace where th=
e node
must exist already.



HISTORY
       tc was written by Alexey N. Kuznetsov and added in Linux 2.2.

SEE ALSO
       tc-cbq(8), tc-htb(8), tc-sfq(8), tc-red(8), tc-tbf(8), tc-pfifo(=
8),
tc-bfifo(8), tc-pfifo_fast(8), tc-filters(8)


AUTHOR
       Manpage maintained by bert hubert (ahu-yMKkj5jtC+M@public.gmane.org)




iproute2                                                             16
December 2001                                                          =
    =20
TC(8)
 Manual page tc(8) line 196/243 (END)

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
